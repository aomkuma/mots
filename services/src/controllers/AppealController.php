<?php

    namespace App\Controller;
    
    use App\Service\AppealService;
    use App\Service\MenuService;
    use App\Service\EmailService;
    use App\Controller\Mailer;
    
    class AppealController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                //$emailID = $params['obj']['emailID'];
                $condition = $params['obj']['condition'];
                
                if(!empty($condition['months']) && !empty($condition['years'])){
                    $date_from = $condition['years'] . '-' . str_pad($condition['months'], 2, '0', STR_PAD_LEFT) . '-01'; 
                    $maxDay = date('t', strtotime($date_from));
                    $date_to = $condition['years'] . '-' . str_pad($condition['months'], 2, '0', STR_PAD_LEFT) . '-' . $maxDay; 
                    $appeal_date = [$date_from, $date_to];
                }
                
                $_List = AppealService::getList($appeal_date, $condition['page_type']);

                $this->data_result['DATA']['List'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getPage($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $menu_id =  $params['obj']['menu_id'];

                $_Page = MenuService::getPage($menu_id);

                $this->data_result['DATA']['Page'] = $_Page;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateData($request, $response, $args){
            
            $_WEB_FILE_PATH = 'files/files';
            try{
                // error_reporting(E_ERROR);
                // error_reporting(E_ALL);
                // ini_set('display_errors','On');
                $params = $request->getParsedBody();
                $_Data = $params['obj']['Data'];
                foreach ($_Data as $key => $value) {
                    if($value == 'null'){
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
                if($f != null){
                    if($f->getClientFilename() != ''){
                        
                        $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                        if($ext == 'php' || $ext == 'bat' || $ext == 'sh'){
                            $this->data_result['STATUS'] = 'ERROR';
                            $this->data_result['DATA'] = 'คุณอัพโหลดไฟล์ที่ไม่ได้รับอนุญาติเข้ามาในระบบ กรุณาเลือกไฟล์เพื่ออัพโหลดใหม่อีกครั้ง';
                            return $this->returnResponse(200, $this->data_result, $response, false);
                            exit();
                        }
                        $FileName = date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/appeal/'.$FileName;
                        
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
                $mailer->setSubject("กระทรวงการท่องเที่ยวและกีฬา ได้รับแจ้งเรื่องร้อนเรียนจากคุณ " . $_Data['firstname'].' '.$_Data['lastname']);
                $mailer->setHTMLContent($mail_content);
                $mailer->isHtml(true);
                $mailer->setReceiver($_Data['email']);
                $res = $mailer->sendMail();
                if($res){
                    $status = 'Sent mail appeal success';
                }else{
                    // print_r($res);
                    // exit;
                    $status = 'Sent mail appeal failed' . $res;
                }

                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

    }
