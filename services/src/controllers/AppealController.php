<?php

namespace App\Controller;

use App\Service\AppealService;
use App\Service\MenuService;
use App\Service\EmailService;
use App\Controller\Mailer;
use PHPExcel;

class AppealController extends Controller {

    protected $logger;
    protected $db;

    public function __construct($logger, $db) {
        $this->logger = $logger;
        $this->db = $db;
    }

    public function getList($request, $response, $args) {
        try {
            $params = $request->getParsedBody();
            //$emailID = $params['obj']['emailID'];
            $condition = $params['obj']['condition'];

            if (!empty($condition['months']) && !empty($condition['years'])) {
                $date_from = $condition['years'] . '-' . str_pad($condition['months'], 2, '0', STR_PAD_LEFT) . '-01';
                $maxDay = date('t', strtotime($date_from));
                $date_to = $condition['years'] . '-' . str_pad($condition['months'], 2, '0', STR_PAD_LEFT) . '-' . $maxDay;
                $appeal_date = [$date_from, $date_to];
            }

            $_List = AppealService::getList($appeal_date, $condition['page_type']);

            $this->data_result['DATA']['List'] = $_List;

            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

    public function getPage($request, $response, $args) {
        try {
            $params = $request->getParsedBody();
            $menu_id = $params['obj']['menu_id'];

            $_Page = MenuService::getPage($menu_id);

            $this->data_result['DATA']['Page'] = $_Page;

            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

    public function updateData($request, $response, $args) {

        $_WEB_FILE_PATH = 'files/files';
        try {
            // error_reporting(E_ERROR);
            // error_reporting(E_ALL);
            // ini_set('display_errors','On');
            $params = $request->getParsedBody();
            $_Data = $params['obj']['Data'];
            foreach ($_Data as $key => $value) {
                if ($value == 'null') {
                    $_Data[$key] = '';
                }
            }

            $_AppealList = $params['obj']['AppealList'];
            $_AppealCallback = $params['obj']['AppealCallback'];
            unset($_Data['officer']);
            // Update Attach files
            $files = $request->getUploadedFiles();
            $f = $files['obj']['AttachFile'];
            // echo "asdasd";print_r($f);
            // exit;
            if ($f != null) {
                if ($f->getClientFilename() != '') {

                    $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                    if ($ext == 'php' || $ext == 'bat' || $ext == 'sh') {
                        $this->data_result['STATUS'] = 'ERROR';
                        $this->data_result['DATA'] = 'คุณอัพโหลดไฟล์ที่ไม่ได้รับอนุญาติเข้ามาในระบบ กรุณาเลือกไฟล์เพื่ออัพโหลดใหม่อีกครั้ง';
                        return $this->returnResponse(200, $this->data_result, $response, false);
                        exit();
                    }
                    $FileName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $ext;
                    $FilePath = $_WEB_FILE_PATH . '/appeal/' . $FileName;

                    $_Data['description_filename'] = $f->getClientFilename();
                    $_Data['description_filepath'] = $FilePath;

                    $f->moveTo('../../' . $FilePath);
                }
            }
            // print_r($_Data);
            // exit;
            $id = AppealService::updateData($_Data);

            // Add Appeal Callback
            foreach ($_AppealCallback as $key => $value) {
                $data['appeal_id'] = $id;
                $data['callback_name'] = $value;
                AppealService::addAppealCallback($data);
            }

            // Add Appeal List
            foreach ($_AppealList as $key => $value) {
                $data['appeal_id'] = $id;
                $data['appeal_text'] = $value;
                AppealService::addAppealList($data);
            }

            $email_settings = EmailService::getEmailDefault();
            // print_r($email_settings);exit;
            $mail_content = "ขอบคุณสำหรับข้อร้องเรียนที่ท่านได้แจ้งเข้ามา
เจ้าหน้าที่ได้รับข้อมูลของท่านแล้ว จะเร่งดำเนินการอย่างเร็วที่สุด";
            // exit;
            $mailer = new Mailer;
            $mailer->setMailHost('smtp.gmail.com');
            $mailer->setMailPort('465');
            $mailer->setMailUsername($email_settings->email);
            $mailer->setMailPassword($email_settings->password);
            $mailer->setSubject("กระทรวงการท่องเที่ยวและกีฬา ได้รับแจ้งเรื่องร้อนเรียนจากคุณ " . $_Data['firstname'] . ' ' . $_Data['lastname']);
            $mailer->setHTMLContent($mail_content);
            $mailer->isHtml(true);
            $mailer->setReceiver($_Data['email']);
            $res = $mailer->sendMail();
            if ($res) {
                $status = 'Sent mail appeal success';
            } else {
                // print_r($res);
                // exit;
                $status = 'Sent mail appeal failed' . $res;
            }

            $this->data_result['DATA']['id'] = $id;

            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

    public function callback($request, $response, $args) {
        $_WEB_FILE_PATH = 'files/files';
        try {
            $params = $request->getParsedBody();
            $_Data = $params['obj']['Data'];
            $files = $request->getUploadedFiles();
            $f = $files['obj']['AttachFile'];

            if ($f != null) {
                if ($f->getClientFilename() != '') {

                    $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                    if ($ext == 'php' || $ext == 'bat' || $ext == 'sh') {
                        $this->data_result['STATUS'] = 'ERROR';
                        $this->data_result['DATA'] = 'คุณอัพโหลดไฟล์ที่ไม่ได้รับอนุญาติเข้ามาในระบบ กรุณาเลือกไฟล์เพื่ออัพโหลดใหม่อีกครั้ง';
                        return $this->returnResponse(200, $this->data_result, $response, false);
                        exit();
                    }
                    $FileName = date('YmdHis') . '_' . rand(100000, 999999) . '.' . $ext;
                    $FilePath = $_WEB_FILE_PATH . '/appeal/' . $FileName;


                    $_Data['res_file'] = $FilePath;

                    $f->moveTo('../../' . $FilePath);
                }
            }

            $id = AppealService::callback($_Data);
            $email_settings = EmailService::getEmailDefault();
            // print_r($email_settings);exit;
            $mail_content = $_Data['res_description'];
            // exit;
            $mailer = new Mailer;
            $mailer->setMailHost('smtp.gmail.com');
            $mailer->setMailPort('465');
            $mailer->setMailUsername($email_settings->email);
            $mailer->setMailPassword($email_settings->password);
            $mailer->setSubject("กระทรวงการท่องเที่ยวและกีฬา เรียนคุณ " . $_Data['firstname'] . ' ' . $_Data['lastname']);
            $mailer->setHTMLContent($mail_content);
            $mailer->isHtml(true);
            $mailer->setReceiver($_Data['email']);
            $mailer->addAttachFile('../../' . $FilePath, $FileName);

            $res = $mailer->sendMail();


            $this->data_result['STATUS'] = 'OK';
            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

    public function report($request, $response) {

        try {
            $obj = $request->getParsedBody();

            $data = $obj['obj']['DataList'];


            $cacheMethod = \PHPExcel_CachedObjectStorageFactory::cache_in_memory_gzip;

            $catch_result = \PHPExcel_Settings::setCacheStorageMethod($cacheMethod);

            $objPHPExcel = new PHPExcel();

            $objPHPExcel = $this->generateReportExcel($objPHPExcel, $data);


            $filename = 'Appeal-' . date('YmdHis') . '.xlsx';

            $filepath = '../../files/files/downloads/' . $filename;

            $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');

            $objWriter->setPreCalculateFormulas();


            $objWriter->save($filepath);
//   die();
            $this->data_result['DATA'] = 'files/files/downloads/' . $filename;

            return $this->returnResponse(200, $this->data_result, $response);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

    private function generateReportExcel($objPHPExcel, $data) {

        $objPHPExcel->getActiveSheet()->setTitle("รายงานเรื่องร้องเรียน");
        $objPHPExcel->getActiveSheet()->setCellValue('A1', "รายงานเรื่องร้องเรียน");
        $objPHPExcel->getActiveSheet()->mergeCells('A1:O1');
        $objPHPExcel->getActiveSheet()->setCellValue('A2', 'เลขที่รับเรื่อง');
        $objPHPExcel->getActiveSheet()->setCellValue('B2', 'ชื่อ');
        $objPHPExcel->getActiveSheet()->setCellValue('C2', 'นามสกุล');
        $objPHPExcel->getActiveSheet()->setCellValue('D2', 'ที่อยู่');
        $objPHPExcel->getActiveSheet()->setCellValue('E2', 'จังหวัด');
        $objPHPExcel->getActiveSheet()->setCellValue('F2', 'รหัสไปรษณีย์');
        $objPHPExcel->getActiveSheet()->setCellValue('G2', 'โทรศัพท์บ้าน');
        $objPHPExcel->getActiveSheet()->setCellValue('H2', 'โทรศัพท์มือถือ');
        $objPHPExcel->getActiveSheet()->setCellValue('I2', 'อีเมล');
        $objPHPExcel->getActiveSheet()->setCellValue('J2', 'ติดต่อกลับ');
        $objPHPExcel->getActiveSheet()->setCellValue('K2', 'ช่องทางการติดต่อ');
        $objPHPExcel->getActiveSheet()->setCellValue('L2', 'บุลคล/หน่วยงาน ที่ท่านต้องการติชม/ร้องเรียน/อุทธรณ์');
        $objPHPExcel->getActiveSheet()->setCellValue('M2', 'ต้องการส่งคำร้องเพื่อ');
        $objPHPExcel->getActiveSheet()->setCellValue('N2', 'รายละเอียด');
        $objPHPExcel->getActiveSheet()->setCellValue('O2', 'วันที่ส่งเรื่อง');

        $row = 3;
        foreach ($data as $item) {
            $objPHPExcel->getActiveSheet()->setCellValue('A' . $row, $item['id']);
            $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $item['firstname']);
            $objPHPExcel->getActiveSheet()->setCellValue('C' . $row, $item['lastname']);
            $objPHPExcel->getActiveSheet()->setCellValue('D' . $row, $item['address']);
            $objPHPExcel->getActiveSheet()->setCellValue('E' . $row, $item['province']);
            $objPHPExcel->getActiveSheet()->setCellValue('F' . $row, $item['postcode']);
            $objPHPExcel->getActiveSheet()->setCellValue('G' . $row, $item['tel']);
            $objPHPExcel->getActiveSheet()->setCellValue('H' . $row, $item['mobile']);
            $objPHPExcel->getActiveSheet()->setCellValue('I' . $row, $item['email']);
            $objPHPExcel->getActiveSheet()->setCellValue('J' . $row, $item['callback']);
            $objPHPExcel->getActiveSheet()->setCellValue('K' . $row, $item['appeal_callback'][0]);
            $objPHPExcel->getActiveSheet()->setCellValue('L' . $row, $item['appeal_list'][0]);
            $objPHPExcel->getActiveSheet()->setCellValue('M' . $row, $item['appeal_type']);
            $objPHPExcel->getActiveSheet()->setCellValue('N' . $row, $item['description']);
            $objPHPExcel->getActiveSheet()->setCellValue('O' . $row, $item['create_date']);
            $row++;
        }



        $objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
        $objPHPExcel->getActiveSheet()->getStyle('A1')->getFont()->setSize(16);
        $objPHPExcel->getActiveSheet()->getStyle('A2:O2')->getFont()->setBold(true);
        $objPHPExcel->getActiveSheet()->getStyle('A2:O2')->getFont()->setSize(14);
        $objPHPExcel->getActiveSheet()
                ->getStyle('A2:O2')
                ->applyFromArray(array(
                    'alignment' => array(
                        'horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                        'vertical' => \PHPExcel_Style_Alignment::VERTICAL_CENTER
                    )
                        )
        );

        $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(10);
        $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(10);
        $objPHPExcel->getActiveSheet()->getColumnDimension('K')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('L')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('M')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('N')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('O')->setWidth(15);


        $objPHPExcel->getActiveSheet()->getStyle('A1:O' . ($row - 1))->applyFromArray(
                array(
                    'borders' => array(
                        'allborders' => array(
                            'style' => (\PHPExcel_Style_Border::BORDER_THIN)
                        )
                    ),
                    'font' => array(
                        'name' => 'AngsanaUPC'
                    )
                )
        );

        return $objPHPExcel;
    }

}
