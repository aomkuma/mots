<?php

    namespace App\Controller;
    
    use App\Service\CommodityStandardService;
    use App\Service\AcademicBoardService;
    use App\Service\SubcommitteeService;
    use App\Service\StakeholderService;
    use App\Service\HearingReportService;
    use App\Service\QuestionService;

    use PhpOffice\PhpSpreadsheet\Spreadsheet;
    use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

    class ReportController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function exportReport($request, $response, $args){
    //         error_reporting(E_ERROR);
    // error_reporting(E_ALL);
    // ini_set('display_errors','On');
    // var_dump(extension_loaded('zip'));
    // exit;
            try{
                $params = $request->getParsedBody();
                $condition = $params['obj']['condition'];
                $report_type = $params['obj']['report_type'];

                // $cacheMethod = \PHPExcel_CachedObjectStorageFactory::cache_in_memory_gzip;
                // $catch_result = \PHPExcel_Settings::setCacheStorageMethod($cacheMethod);

                // $objPHPExcel = new PHPExcel();


                $objPHPExcel = new Spreadsheet();

                switch($report_type){
                    case 'standard-commodity-status' : $objPHPExcel = $this->standardCommodityStatus($objPHPExcel, $condition); break;
                    case 'academic-board' : $objPHPExcel = $this->generateAcademicBoard($objPHPExcel, $condition); break;
                    case 'annual-plan' : $objPHPExcel = $this->generateAnnualPlan($objPHPExcel, $condition); break;
                    case 'questionnaire' : $objPHPExcel = $this->generateQuestionnaire($objPHPExcel, $condition); break;
                    case 'academicboardgroup' : $objPHPExcel = $this->generateAcademicBoardGroup($objPHPExcel, $condition); break;
                    case 'stackholder' : $objPHPExcel = $this->generateStackholder($objPHPExcel, $condition); break;
                    case 'subcommittee' : $objPHPExcel = $this->generateSubcommittee($objPHPExcel, $condition); break;
                    case 'hearing-report' : $objPHPExcel = $this->generateHearingReport($objPHPExcel, $condition); break;
                    default : $result = null;
                }
                
                $filename = $report_type . '_' . date('YmdHis') . '.xlsx';
                $filepath = '../../files/files/downloads/' . $filename;
                
                // $objWriter = \PHPExcel_IOFactory::createWriter ( $objPHPExcel, 'Excel2007' );
                // $objWriter->setPreCalculateFormulas(); 
                
                // $objWriter->save ( $filepath );

                $objWriter = new Xlsx($objPHPExcel);
                $objWriter->save($filepath);
                
                $this->data_result['DATA'] = $filename;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        private function getStandardStatusText($step){
            switch ($step) {
                    
                case '1' : return 'ขั้นที่1 การพิจารณาเรื่องที่สมควรกำหนดเป็นมาตรฐาน';break;
                case '2' : return 'ขั้นที่2 การแต่งตั้งคณะกรรมการวิชาการ';break;
                case '3' : return 'ขั้นที่3 การจัดทำร่างมาตรฐาน';break;
                case '4' : return 'ขั้นที่4 การพิจารณาร่างมาตรฐาน';break;
                case '5' : return 'ขั้นที่5 การประสานความเห็นจากผู้มีส่วนได้เสีย';break;
                case '6' : return 'ขั้นที่6 การเสนอคณะกรรมการมาตรฐานสินค้าเกษตร';break;
                case '7' : return 'ขั้นที่7 การรับฟังความคิดเห็นจากต่างประเทศ';break;
                case '8' : return 'ขั้นที่8 การเสนอรัฐมนตรีลงนามในประกาศ/กฎกระทรวง';break;
                case '9' : return 'ขั้นที่9 ประกาศใช้';break;
                case '10' : return 'ยกเลิกการประกาศใช้';break;
                case '11' : return 'ทบทวน';break;
                default : return '';
            }
        }

        private function standardCommodityStatus($objPHPExcel, $condition){

            // get Commodity standard detail
            $years = intval($condition['YearFrom']);
            $standardID = $condition['Standard'];
            $years += 543;
            $CommodityStandard = CommodityStandardService::getstandardCommodityStatus($years, $standardID);

            $objPHPExcel->getActiveSheet()->setCellValue('A2', 'รายงานแผนงานประจำปี ' . $years);
            $objPHPExcel->getActiveSheet()->mergeCells('A2:F2');
            $objPHPExcel->getActiveSheet()->getStyle('A2:F2')->getAlignment()->setHorizontal('center');
            // $objPHPExcel->getActiveSheet()->setCellValue('C2', $years);

            $objPHPExcel->getActiveSheet()->setCellValue('A4', 'ลำดับ');
            $objPHPExcel->getActiveSheet()->setCellValue('B4', 'มาตรฐานสินค้าเกษตร');
            $objPHPExcel->getActiveSheet()->setCellValue('C4', 'ประเภทการกำหนดมาตรฐาน');
            $objPHPExcel->getActiveSheet()->setCellValue('D4', 'ประเภทมาตรฐาน');
            $objPHPExcel->getActiveSheet()->setCellValue('E4', 'กลุ่มมาตรฐาน');
            $objPHPExcel->getActiveSheet()->setCellValue('F4', 'สถานะขั้นตอนการจัดทามาตรฐาน');
            $objPHPExcel->getActiveSheet()->getStyle('A4')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('B4')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('C4')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('D4')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('E4')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('F4')->getFont()->setBold(true);

            $row = 5;
            $cnt = 1;
            foreach ($CommodityStandard as $key => $value) {
                $objPHPExcel->getActiveSheet()->setCellValue('A' . $row, $cnt);
                $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $value['standardNameThai']);
                $objPHPExcel->getActiveSheet()->setCellValue('C' . $row, $value['standardDefineType']);
                $objPHPExcel->getActiveSheet()->setCellValue('D' . $row, $value['standardType']);
                $objPHPExcel->getActiveSheet()->setCellValue('E' . $row, $value['standardGroup']);
                $objPHPExcel->getActiveSheet()->setCellValue('F' . $row, $this->getStandardStatusText($value['step']));
                $row++;
                $cnt++;
            }

            $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);

            $objPHPExcel->getActiveSheet()
            ->getStyle("A4:F" . $objPHPExcel->getActiveSheet()->getHighestRow())
            ->applyFromArray($this->getDefaultStyle());

            return $objPHPExcel;

        }

        private function generateQuestionnaire($objPHPExcel, $condition){
            $years = $condition['YearFrom'];
            $questionnaireID = $condition['Standard'];

            // load Questionnaire id join with questions and response
            $Quesionnaire = QuestionService::getData($questionnaireID);

            $objPHPExcel->getActiveSheet()->setCellValue('B1', 'แบบสอบถาม ' . $Quesionnaire['questionName']);
            

            $objPHPExcel->getActiveSheet()->setCellValue('B4', 'หัวข้อ');
            $objPHPExcel->getActiveSheet()->setCellValue('C4', 'เห็นด้วย');
            $objPHPExcel->getActiveSheet()->setCellValue('D4', 'ไม่เห็นด้วย');
            $objPHPExcel->getActiveSheet()->setCellValue('E4', 'ความคิดเห็น');
            $objPHPExcel->getActiveSheet()->getStyle('B4')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('C4')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('D4')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('E4')->getFont()->setBold(true);


            // Questions
            $row = 5;
            $TotalResponse = 0;
            foreach ($Quesionnaire['question'] as $key => $value) {
                // get count agree and dis agree
                $AgreeResponse = QuestionService::getCountAgree($value['questionID']);
                $DisgreeResponse = QuestionService::getCountDisagree($value['questionID']);
                $DisgreeCommentResponse = QuestionService::getDisagreeComment($value['questionID']);
                // print_r($DisgreeCommentResponse);
                $disagree_comment = [];
                foreach ($DisgreeCommentResponse as $k => $v) {
                    $disagree_comment[] = $v['q_response_comment'];
                }
                $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $value['question']);
                $objPHPExcel->getActiveSheet()->setCellValue('C' . $row, $AgreeResponse);
                $objPHPExcel->getActiveSheet()->setCellValue('D' . $row, $DisgreeResponse);
                $objPHPExcel->getActiveSheet()->setCellValue('E' . $row, "- ". implode("\n- ", $disagree_comment ) );
                $row++;
                $TotalResponse += ($AgreeResponse + $DisgreeResponse);
            }

            $objPHPExcel->getActiveSheet()->setCellValue('B2', 'จำนวนผู้ตอบแบบสอบถาม ' . $TotalResponse);

            // exit;
            $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);

            $objPHPExcel->getActiveSheet()
            ->getStyle("B4:E" . $objPHPExcel->getActiveSheet()->getHighestRow())
            ->applyFromArray($this->getDefaultStyle());

            return $objPHPExcel;

        }



        private function generateAcademicBoard($objPHPExcel, $condition){

            // get Commodity standard detail
            $standardID = $condition['Standard'];
            $CommodityStandard = CommodityStandardService::getCommodityStandard($standardID);

            // get Acedemic board by standard ID
            $AcademicBoard = AcademicBoardService::getAcademicBoardList($standardID);

            // generate data
            $objPHPExcel->getActiveSheet()->setCellValue('A2', 'ปีงบประมาณ ' . $CommodityStandard['years']);
            $objPHPExcel->getActiveSheet()->mergeCells('A2:K2');
            $objPHPExcel->getActiveSheet()->getStyle('A2:F2')->getAlignment()->setHorizontal('center');
            // $objPHPExcel->getActiveSheet()->setCellValue('C2', $CommodityStandard['years']);
            $objPHPExcel->getActiveSheet()->setCellValue('A3', 'มาตรฐานสินค้าเกษตร : '. $CommodityStandard['standardNameThai']);
            $objPHPExcel->getActiveSheet()->mergeCells('A3:K3');
            $objPHPExcel->getActiveSheet()->getStyle('A3:K3')->getAlignment()->setHorizontal('center');

            $objPHPExcel->getActiveSheet()->setCellValue('A5', 'ลำดับ');
            $objPHPExcel->getActiveSheet()->setCellValue('B5', 'ชื่อคณะกรรมการ');
            $objPHPExcel->getActiveSheet()->setCellValue('C5', 'ตำแหน่ง');
            $objPHPExcel->getActiveSheet()->setCellValue('D5', 'หน้าที่รับผิดชอบ');
            $objPHPExcel->getActiveSheet()->setCellValue('E5', 'สาขา');
            $objPHPExcel->getActiveSheet()->setCellValue('F5', 'คุณวุฒิ');
            $objPHPExcel->getActiveSheet()->setCellValue('G5', 'หน่วยงาน');
            $objPHPExcel->getActiveSheet()->setCellValue('H5', 'สถานที่ติดต่อ');
            $objPHPExcel->getActiveSheet()->setCellValue('I5', 'โทรศัพท์');
            $objPHPExcel->getActiveSheet()->setCellValue('J5', 'โทรสาร');
            $objPHPExcel->getActiveSheet()->setCellValue('K5', 'email');

            $objPHPExcel->getActiveSheet()->getStyle('A5')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('B5')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('C5')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('D5')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('E5')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('F5')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('G5')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('H5')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('I5')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('J5')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('K5')->getFont()->setBold(true);

            $row = 6;
            $cnt = 1;
            // Loop for details
            foreach ($AcademicBoard as $key => $value) {
                $objPHPExcel->getActiveSheet()->setCellValue('A' . $row, $cnt);
                $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $value['nameThai'] . ' ' . $value['lastNameThai']);
                $objPHPExcel->getActiveSheet()->setCellValue('C' . $row, $value['positionThai']);
                $objPHPExcel->getActiveSheet()->setCellValue('D' . $row, $value['responsible']);
                $objPHPExcel->getActiveSheet()->setCellValue('E' . $row, $value['branch']);
                $objPHPExcel->getActiveSheet()->setCellValue('F' . $row, $value['experience']);
                $objPHPExcel->getActiveSheet()->setCellValue('G' . $row, $value['institution']);
                $objPHPExcel->getActiveSheet()->setCellValue('H' . $row, $value['address']);
                $objPHPExcel->getActiveSheet()->setCellValue('I' . $row, $value['phone']);
                $objPHPExcel->getActiveSheet()->setCellValue('J' . $row, $value['fax']);
                $objPHPExcel->getActiveSheet()->setCellValue('K' . $row, $value['email']);
                $row++;
                $cnt++;
            }
            $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);

            $objPHPExcel->getActiveSheet()
            ->getStyle("A5:K" . $objPHPExcel->getActiveSheet()->getHighestRow())
            ->applyFromArray($this->getDefaultStyle());

            return $objPHPExcel;
        }

        private function generateAnnualPlan($objPHPExcel, $condition){

            // get Commodity standard detail
            $years = intval($condition['YearFrom']);
            $years += 543;
            $CommodityStandard = CommodityStandardService::getListActive($years);

            $objPHPExcel->getActiveSheet()->setCellValue('B2', 'รายงานแผนงานประจำปี');
            $objPHPExcel->getActiveSheet()->setCellValue('C2', $years);

            $objPHPExcel->getActiveSheet()->setCellValue('C5', 'มาตรฐานสินค้าเกษตร');
            $objPHPExcel->getActiveSheet()->getStyle('B2')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('C2')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->getStyle('C5')->getFont()->setBold(true);

            $row = 6;
            foreach ($CommodityStandard as $key => $value) {
                $objPHPExcel->getActiveSheet()->setCellValue('C' . $row, $value['standardNameThai']);
                $row++;
            }

            $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);

            $objPHPExcel->getActiveSheet()
            ->getStyle("C5:C" . $objPHPExcel->getActiveSheet()->getHighestRow())
            ->applyFromArray($this->getDefaultStyle());

            return $objPHPExcel;

        }

        private function generateAcademicBoardGroup($objPHPExcel, $condition){

            // get Commodity standard detail
            $standardID = $condition['AcademicBoardGroup'];
            $CommodityStandard = CommodityStandardService::getCommodityStandard($standardID);

            // get Acedemic board by standard ID
            $AcademicBoard = AcademicBoardService::getAcademicBoardList($standardID);

            // generate data
            $objPHPExcel->getActiveSheet()->setCellValue('A1', 'ชื่อกลุ่ม ' . $CommodityStandard['academicBoardName']);
            $objPHPExcel->getActiveSheet()->mergeCells('A1:K1');
            $objPHPExcel->getActiveSheet()->getStyle('A1:K1')->getAlignment()->setHorizontal('center');
            // $objPHPExcel->getActiveSheet()->setCellValue('B3', );

            $objPHPExcel->getActiveSheet()->setCellValue('A5', 'ลำดับ');
            $objPHPExcel->getActiveSheet()->setCellValue('B5', 'ชื่อคณะกรรมการ');
            $objPHPExcel->getActiveSheet()->setCellValue('C5', 'ตำแหน่ง');
            $objPHPExcel->getActiveSheet()->setCellValue('D5', 'หน้าที่รับผิดชอบ');
            $objPHPExcel->getActiveSheet()->setCellValue('E5', 'สาขา');
            $objPHPExcel->getActiveSheet()->setCellValue('F5', 'คุณวุฒิ');
            $objPHPExcel->getActiveSheet()->setCellValue('G5', 'หน่วยงาน');
            $objPHPExcel->getActiveSheet()->setCellValue('H5', 'สถานที่ติดต่อ');
            $objPHPExcel->getActiveSheet()->setCellValue('I5', 'โทรศัพท์');
            $objPHPExcel->getActiveSheet()->setCellValue('J5', 'โทรสาร');
            $objPHPExcel->getActiveSheet()->setCellValue('K5', 'email');
            $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);

            $row = 6;
            $cnt = 1;
            // Loop for details
            foreach ($AcademicBoard as $key => $value) {
                $objPHPExcel->getActiveSheet()->setCellValue('A' . $row, $cnt);
                $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $value['nameThai'] . ' ' . $value['lastNameThai']);
                $objPHPExcel->getActiveSheet()->setCellValue('C' . $row, $value['positionThai']);
                $objPHPExcel->getActiveSheet()->setCellValue('D' . $row, $value['responsible']);
                $objPHPExcel->getActiveSheet()->setCellValue('E' . $row, $value['branch']);
                $objPHPExcel->getActiveSheet()->setCellValue('F' . $row, $value['experience']);
                $objPHPExcel->getActiveSheet()->setCellValue('G' . $row, $value['institution']);
                $objPHPExcel->getActiveSheet()->setCellValue('H' . $row, $value['address']);
                $objPHPExcel->getActiveSheet()->setCellValue('I' . $row, $value['phone']);
                $objPHPExcel->getActiveSheet()->setCellValue('J' . $row, $value['fax']);
                $objPHPExcel->getActiveSheet()->setCellValue('K' . $row, $value['email']);
                $row++;
                $cnt++;
            }
            $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);

            $objPHPExcel->getActiveSheet()
            ->getStyle("A5:K" . $objPHPExcel->getActiveSheet()->getHighestRow())
            ->applyFromArray($this->getDefaultStyle());

            return $objPHPExcel;
        }

        private function generateStackholder($objPHPExcel, $condition){

            // get Commodity standard detail
            $Branch = $condition['Branch'];
            // get Acedemic board by standard ID
            $AcademicBoard = StakeholderService::getListByBranch($Branch);

            // generate data
            $objPHPExcel->getActiveSheet()->setCellValue('A3', 'สาขา ' . $Branch);
            // $objPHPExcel->getActiveSheet()->setCellValue('B3', );

            $objPHPExcel->getActiveSheet()->setCellValue('A5', 'ลำดับ');
            $objPHPExcel->getActiveSheet()->setCellValue('B5', 'ชื่อ-สกุล');
            $objPHPExcel->getActiveSheet()->setCellValue('C5', 'ตำแหน่ง');
            $objPHPExcel->getActiveSheet()->setCellValue('D5', 'หน้าที่รับผิดชอบ');
            $objPHPExcel->getActiveSheet()->setCellValue('E5', 'สาขา');
            $objPHPExcel->getActiveSheet()->setCellValue('F5', 'คุณวุฒิ');
            $objPHPExcel->getActiveSheet()->setCellValue('G5', 'หน่วยงาน');
            $objPHPExcel->getActiveSheet()->setCellValue('H5', 'สถานที่ติดต่อ');
            $objPHPExcel->getActiveSheet()->setCellValue('I5', 'โทรศัพท์');
            $objPHPExcel->getActiveSheet()->setCellValue('J5', 'โทรสาร');
            $objPHPExcel->getActiveSheet()->setCellValue('K5', 'email');
            $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);

            $row = 6;
            $cnt = 1;
            // Loop for details
            foreach ($AcademicBoard as $key => $value) {
                $objPHPExcel->getActiveSheet()->setCellValue('A' . $row, $cnt);
                $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $value['nameThai'] . ' ' . $value['lastNameThai']);
                $objPHPExcel->getActiveSheet()->setCellValue('C' . $row, $value['positionThai']);
                $objPHPExcel->getActiveSheet()->setCellValue('D' . $row, $value['responsible']);
                $objPHPExcel->getActiveSheet()->setCellValue('E' . $row, $value['branch']);
                $objPHPExcel->getActiveSheet()->setCellValue('F' . $row, $value['experience']);
                $objPHPExcel->getActiveSheet()->setCellValue('G' . $row, $value['institution']);
                $objPHPExcel->getActiveSheet()->setCellValue('H' . $row, $value['address']);
                $objPHPExcel->getActiveSheet()->setCellValue('I' . $row, $value['phone']);
                $objPHPExcel->getActiveSheet()->setCellValue('J' . $row, $value['fax']);
                $objPHPExcel->getActiveSheet()->setCellValue('K' . $row, $value['email']);
                $row++;
                $cnt++;
            }
            $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);

            $objPHPExcel->getActiveSheet()
            ->getStyle("A5:K" . $objPHPExcel->getActiveSheet()->getHighestRow())
            ->applyFromArray($this->getDefaultStyle());

            return $objPHPExcel;
        }

        private function generateSubcommittee($objPHPExcel, $condition){
            $subcommitteeID = $condition['Subcommittee'];

            // Get subcommittee by ID
            $Subcommittee = SubcommitteeService::getData($subcommitteeID);
            // print_r($Subcommittee);
            // exit;
            $objPHPExcel->getActiveSheet()->setCellValue('A2', 'คณะอนุกรรมการ : ' . $Subcommittee['subcommitteeName']);
            $objPHPExcel->getActiveSheet()->mergeCells('A1:K1');
            $objPHPExcel->getActiveSheet()->getStyle('A1:K1')->getAlignment()->setHorizontal('center');
            
            $objPHPExcel->getActiveSheet()->getStyle('B2')->getFont()->setBold(true);
            
            $objPHPExcel->getActiveSheet()->setCellValue('A5', 'ลำดับ');
            $objPHPExcel->getActiveSheet()->setCellValue('B5', 'ชื่อคณะอนุกรรมการ');
            $objPHPExcel->getActiveSheet()->setCellValue('C5', 'ตำแหน่ง');
            $objPHPExcel->getActiveSheet()->setCellValue('D5', 'หน้าที่รับผิดชอบ');
            $objPHPExcel->getActiveSheet()->setCellValue('E5', 'สาขา');
            $objPHPExcel->getActiveSheet()->setCellValue('F5', 'คุณวุฒิ');
            $objPHPExcel->getActiveSheet()->setCellValue('G5', 'หน่วยงาน');
            $objPHPExcel->getActiveSheet()->setCellValue('H5', 'สถานที่ติดต่อ');
            $objPHPExcel->getActiveSheet()->setCellValue('I5', 'โทรศัพท์');
            $objPHPExcel->getActiveSheet()->setCellValue('J5', 'โทรสาร');
            $objPHPExcel->getActiveSheet()->setCellValue('K5', 'email');
            $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
            $row = 6;
            $cnt = 1;
            foreach ($Subcommittee['subcommitteePerson'] as $key => $value) {
                $objPHPExcel->getActiveSheet()->setCellValue('A' . $row, $cnt);
                $objPHPExcel->getActiveSheet()->setCellValue('B' . $row, $value['nameThai'] . ' ' . $value['lastNameThai']);
                $objPHPExcel->getActiveSheet()->setCellValue('C' . $row, $value['positionThai']);
                $objPHPExcel->getActiveSheet()->setCellValue('D' . $row, $value['responsible']);
                $objPHPExcel->getActiveSheet()->setCellValue('E' . $row, $value['branch']);
                $objPHPExcel->getActiveSheet()->setCellValue('F' . $row, $value['experience']);
                $objPHPExcel->getActiveSheet()->setCellValue('G' . $row, $value['institution']);
                $objPHPExcel->getActiveSheet()->setCellValue('H' . $row, $value['address']);
                $objPHPExcel->getActiveSheet()->setCellValue('I' . $row, $value['phone']);
                $objPHPExcel->getActiveSheet()->setCellValue('J' . $row, $value['fax']);
                $objPHPExcel->getActiveSheet()->setCellValue('K' . $row, $value['email']);
                $row++;
                $cnt++;
            }

            $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);

            $objPHPExcel->getActiveSheet()
            ->getStyle("A5:K" . $objPHPExcel->getActiveSheet()->getHighestRow())
            ->applyFromArray($this->getDefaultStyle());

            return $objPHPExcel;

        }

        private function generateHearingReport($objPHPExcel, $condition){
            $months = $condition['months'];
            $years = $condition['years'];
            if(!empty($condition['months']) && !empty($condition['years'])){
                $date_from = $condition['years'] . '-' . str_pad($condition['months'], 2, '0', STR_PAD_LEFT) . '-01'; 
                $maxDay = date('t', strtotime($date_from));
                $date_to = $condition['years'] . '-' . str_pad($condition['months'], 2, '0', STR_PAD_LEFT) . '-' . $maxDay; 
                $create_date = [$date_from, $date_to];
            }
            print_r($create_date);
            // Get total of data
            $total = HearingReportService::getCountReport($create_date);

            // Get data by column name
            $service_type_1 = HearingReportService::getReportDataByColumn('service_type', 'หน่วยงานราชการ / รัฐวิสาหกิจ', $create_date);
            $service_type_2 = HearingReportService::getReportDataByColumn('service_type', 'บริษัท/ห้างร้าน/เอกชน', $create_date);
            $service_type_3 = HearingReportService::getReportDataByColumn('service_type', 'สื่อมวลชน', $create_date);
            $service_type_4 = HearingReportService::getReportDataByColumn('service_type', 'ประชาชนทั่วไป', $create_date);
            $service_type_5 = HearingReportService::getReportDataByColumn('service_type', 'นักเรียน/นิสิต/นักศึกษา', $create_date);
            $service_type_6 = HearingReportService::getReportDataByColumn('service_type', 'องค์กรอิสระ/หน่วยงานอิสระ', $create_date);
            $service_type_7 = HearingReportService::getReportDataByColumn('service_type', 'อื่นๆ', $create_date);

            $gender_1 = HearingReportService::getReportDataByColumn('gender', 'ชาย', $create_date);
            $gender_2 = HearingReportService::getReportDataByColumn('gender', 'หญิง', $create_date);

            $age_1 = HearingReportService::getReportDataByColumn('age', 'ต่ำกว่า 18 ปี', $create_date);
            $age_2 = HearingReportService::getReportDataByColumn('age', '18-25 ปี', $create_date);
            $age_3 = HearingReportService::getReportDataByColumn('age', '26-35 ปี', $create_date);
            $age_4 = HearingReportService::getReportDataByColumn('age', '36-45 ปี', $create_date);
            $age_5 = HearingReportService::getReportDataByColumn('age', '46-55 ปี', $create_date);
            $age_6 = HearingReportService::getReportDataByColumn('age', '56 ปี ขึ้นไป', $create_date);

            $chanel_detail_1 = HearingReportService::getReportDetailDataByColumn('เว็บไซต์ www.acfs.go.th', 'Chanel', $create_date);
            $chanel_detail_2 = HearingReportService::getReportDetailDataByColumn('แผ่นพับ/โบรชัวร์', 'Chanel', $create_date);
            $chanel_detail_3 = HearingReportService::getReportDetailDataByColumn('การจัดนิทรรศการ', 'Chanel', $create_date);
            $chanel_detail_4 = HearingReportService::getReportDetailDataByColumn('ผ่านสถานีวิทยุกระจายเสียง', 'Chanel', $create_date);
            $chanel_detail_5 = HearingReportService::getReportDetailDataByColumn('ผ่านรายการโทรทัศน์', 'Chanel', $create_date);
            $chanel_detail_6 = HearingReportService::getReportDetailDataByColumn('ป้ายโปสเตอร์', 'Chanel', $create_date);
            $chanel_detail_7 = HearingReportService::getReportDetailDataByColumn('หนังสือ', 'Chanel', $create_date);
            $chanel_detail_8 = HearingReportService::getReportDetailDataByColumn('อื่นๆ', 'Chanel', $create_date);

            $datatype_detail_1 = HearingReportService::getReportDetailDataByColumn('มาตรฐานสินค้าเกษตรและอาหาร/คู่มือขั้นตอนในการกำหนดมาตรฐานสินค้าเกษตรและอาหาร', 'DataType', $create_date);
            $datatype_detail_2 = HearingReportService::getReportDetailDataByColumn('พระราชบัญญัติมาตรฐานสินค้าเกษตรและอาหาร พ.ศ.2551', 'DataType', $create_date);
            $datatype_detail_3 = HearingReportService::getReportDetailDataByColumn('กฎหมาย/ระเบียบ ความปลอดภัย', 'DataType', $create_date);
            $datatype_detail_4 = HearingReportService::getReportDetailDataByColumn('รายชื่อหน่วยงานที่ได้รับการรับรอง/คู่มือขั้นตอนในการตรวจประเมินเพื่อรับรองระบบงาน', 'DataType', $create_date);
            $datatype_detail_5 = HearingReportService::getReportDetailDataByColumn('โครงสร้าง อำนาจ หน้าที่ของ มกอช.', 'DataType', $create_date);
            $datatype_detail_6 = HearingReportService::getReportDetailDataByColumn('นโยบายและงบประมาณของ มกอช.', 'DataType', $create_date);
            $datatype_detail_7 = HearingReportService::getReportDetailDataByColumn('การประกวดราคา/ประกาศผลสอบ/ผลพิจารณาจัดซื้อจัดจ้าง', 'DataType', $create_date);
            $datatype_detail_8 = HearingReportService::getReportDetailDataByColumn('อื่นๆ', 'DataType', $create_date);

            $total_visit = HearingReportService::getSumReportDataByColumn('total_visit', $create_date);
            
            $time_visit = HearingReportService::getSumReportDataByColumn('time_visit', $create_date);

            $visit_website_time_1 = HearingReportService::getReportDataByColumn('visit_website_time', '06.00-10.00 น.', $create_date);
            $visit_website_time_2 = HearingReportService::getReportDataByColumn('visit_website_time', '10.00-14.00 น.', $create_date);
            $visit_website_time_3 = HearingReportService::getReportDataByColumn('visit_website_time', '14.00-18.00 น.', $create_date);
            $visit_website_time_4 = HearingReportService::getReportDataByColumn('visit_website_time', '18.00-22.00 น.', $create_date);
            $visit_website_time_5 = HearingReportService::getReportDataByColumn('visit_website_time', '22.00-02.00 น.', $create_date);
            $visit_website_time_6 = HearingReportService::getReportDataByColumn('visit_website_time', '02.00-06.00 น.', $create_date);

            $color_font_size_1 = HearingReportService::getReportDataByColumn('color_font_size', 'ดี', $create_date);            
            $color_font_size_2 = HearingReportService::getReportDataByColumn('color_font_size', 'พอใช้', $create_date);            
            $color_font_size_3 = HearingReportService::getReportDataByColumn('color_font_size', 'ควรปรับปรุง', $create_date);            

            $picture_symbol_1 = HearingReportService::getReportDataByColumn('picture_symbol', 'ดี', $create_date);            
            $picture_symbol_2 = HearingReportService::getReportDataByColumn('picture_symbol', 'พอใช้', $create_date);            
            $picture_symbol_3 = HearingReportService::getReportDataByColumn('picture_symbol', 'ควรปรับปรุง', $create_date);            

            $group_data_1 = HearingReportService::getReportDataByColumn('group_data', 'ดี', $create_date);            
            $group_data_2 = HearingReportService::getReportDataByColumn('group_data', 'พอใช้', $create_date);            
            $group_data_3 = HearingReportService::getReportDataByColumn('group_data', 'ควรปรับปรุง', $create_date);            

            $external_link_1 = HearingReportService::getReportDataByColumn('external_link', 'ดี', $create_date);            
            $external_link_2 = HearingReportService::getReportDataByColumn('external_link', 'พอใช้', $create_date);            
            $external_link_3 = HearingReportService::getReportDataByColumn('external_link', 'ควรปรับปรุง', $create_date);            

            $user_friendly_1 = HearingReportService::getReportDataByColumn('user_friendly', 'ดี', $create_date);            
            $user_friendly_2 = HearingReportService::getReportDataByColumn('user_friendly', 'พอใช้', $create_date);            
            $user_friendly_3 = HearingReportService::getReportDataByColumn('user_friendly', 'ควรปรับปรุง', $create_date);            

            $up_to_date_1 = HearingReportService::getReportDataByColumn('up_to_date', 'ดี', $create_date);            
            $up_to_date_2 = HearingReportService::getReportDataByColumn('up_to_date', 'พอใช้', $create_date);            
            $up_to_date_3 = HearingReportService::getReportDataByColumn('up_to_date', 'ควรปรับปรุง', $create_date);            

            $correction_1 = HearingReportService::getReportDataByColumn('correction', 'ดี', $create_date);            
            $correction_2 = HearingReportService::getReportDataByColumn('correction', 'พอใช้', $create_date);            
            $correction_3 = HearingReportService::getReportDataByColumn('correction', 'ควรปรับปรุง', $create_date);            

            $attractive_1 = HearingReportService::getReportDataByColumn('attractive', 'ดี', $create_date);            
            $attractive_2 = HearingReportService::getReportDataByColumn('attractive', 'พอใช้', $create_date);            
            $attractive_3 = HearingReportService::getReportDataByColumn('attractive', 'ควรปรับปรุง', $create_date);            

            $clarity_1 = HearingReportService::getReportDataByColumn('clarity', 'ดี', $create_date);            
            $clarity_2 = HearingReportService::getReportDataByColumn('clarity', 'พอใช้', $create_date);            
            $clarity_3 = HearingReportService::getReportDataByColumn('clarity', 'ควรปรับปรุง', $create_date);            

            $speed_data_1 = HearingReportService::getReportDataByColumn('speed_data', 'ดี', $create_date);            
            $speed_data_2 = HearingReportService::getReportDataByColumn('speed_data', 'พอใช้', $create_date);            
            $speed_data_3 = HearingReportService::getReportDataByColumn('speed_data', 'ควรปรับปรุง', $create_date);            

            $benefit_1 = HearingReportService::getReportDataByColumn('benefit', 'ดี', $create_date);            
            $benefit_2 = HearingReportService::getReportDataByColumn('benefit', 'พอใช้', $create_date);            
            $benefit_3 = HearingReportService::getReportDataByColumn('benefit', 'ควรปรับปรุง', $create_date);            

            // print_r(($service_type_2['totals'] / $total));
            // print_r($service_type_2['totals']);
            // exit;
            $objPHPExcel->getActiveSheet()->setCellValue('D2', 'รายงานการรับฟังความคิดเห็น');
            $objPHPExcel->getActiveSheet()->getStyle('D2')->getFont()->setBold(true);

            $objPHPExcel->getActiveSheet()->setCellValue('B4', 'ประจำเดือน');
            $objPHPExcel->getActiveSheet()->getStyle('B4')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->setCellValue('C4', $this->getMonthName($months));
            $objPHPExcel->getActiveSheet()->getStyle('C4')->getFont()->setBold(true);
            $objPHPExcel->getActiveSheet()->setCellValue('D4', $years + 543);
            $objPHPExcel->getActiveSheet()->getStyle('D4')->getFont()->setBold(true);    

            $objPHPExcel->getActiveSheet()->setCellValue('C7', 'ข้อมูลทั่วไป');
            $objPHPExcel->getActiveSheet()->getStyle('C7')->getFont()->setBold(true);

            $objPHPExcel->getActiveSheet()->setCellValue('D8', 'ประเภทของผู้รับบริการ');
            $start_row = 9;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'หน่วยงานราชการ / รัฐวิสาหกิจ');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($service_type_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'บริษัท/ห้างร้าน/เอกชน');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($service_type_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'สื่อมวลชน');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($service_type_3['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ประชาชนทั่วไป');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($service_type_4['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'นักเรียน/นิสิต/นักศึกษา');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($service_type_5['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'องค์กรอิสระ/หน่วยงานอิสระ');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($service_type_6['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'อื่นๆ');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($service_type_7['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'เพศของผู้รับบริการ');
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ชาย');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($gender_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'หญิง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($gender_2['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'อายุของผู้รับบริการ');
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ต่ำกว่า 18 ปี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($age_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, '18-25 ปี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($age_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, '26-35 ปี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($age_3['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, '36-45 ปี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($age_4['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, '46-55 ปี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($age_5['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, '56 ปี ขึ้นไป');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($age_6['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'ช่องทางการทราบข้อมูล');
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'เว็บไซต์ www.acfs.go.th');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($chanel_detail_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'แผ่นพับ/โบรชัวร์');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($chanel_detail_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'การจัดนิทรรศการ');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($chanel_detail_3['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ผ่านสถานีวิทยุกระจายเสียง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($chanel_detail_4['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ผ่านรายการโทรทัศน์');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($chanel_detail_5['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ป้ายโปสเตอร์');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($chanel_detail_6['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'หนังสือ');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($chanel_detail_7['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'อื่นๆ');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($chanel_detail_8['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'ประเภทข้อมูลต้องการทราบเป็น');
            $start_row++;

            
            
            

            

            
            
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'มาตรฐานสินค้าเกษตรและอาหาร/คู่มือขั้นตอนในการกำหนดมาตรฐานสินค้าเกษตรและอาหาร');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($datatype_detail_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'พระราชบัญญัติมาตรฐานสินค้าเกษตรและอาหาร พ.ศ.2551');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($datatype_detail_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'กฎหมาย/ระเบียบ ความปลอดภัย');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($datatype_detail_3['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'รายชื่อหน่วยงานที่ได้รับการรับรอง/คู่มือขั้นตอนในการตรวจประเมินเพื่อรับรองระบบงาน');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($datatype_detail_4['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'โครงสร้าง อำนาจ หน้าที่ของ มกอช.');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($datatype_detail_5['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'นโยบายและงบประมาณของ มกอช.');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($datatype_detail_6['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'การประกวดราคา/ประกาศผลสอบ/ผลพิจารณาจัดซื้อจัดจ้าง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($datatype_detail_7['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'อื่นๆ');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($datatype_detail_8['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('C'.$start_row, 'ข้อมูลการเข้าใช้บริการ');
            $objPHPExcel->getActiveSheet()->getStyle('C'.$start_row)->getFont()->setBold(true);
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, '"จำนวนครั้งที่เข้าใช้บริการเว็บไซต์ www.acfs.go.th   ต่อสัปดาห์
"');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($total_visit['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ระยะเวลาที่เข้าใช้บริการเว็บไซต์ (นาที) www.acfs.go.th ต่อครั้ง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($time_visit['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'ใช้บริการเว็บไซต์ในช่วงเวลา');
            $start_row++;
              
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, '06.00-10.00 น.');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($visit_website_time_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, '10.00-14.00 น.');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($visit_website_time_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, '14.00-18.00 น.');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($visit_website_time_3['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, '18.00-22.00 น.');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($visit_website_time_4['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, '22.00-02.00 น.');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($visit_website_time_5['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, '02.00-06.00 น.');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($visit_website_time_6['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('C'.$start_row, 'ข้อมูลการแสดงความคิดเห็นของผู้ใช้บริการ');
            $objPHPExcel->getActiveSheet()->getStyle('C'.$start_row)->getFont()->setBold(true);
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'สีและขนาดตัวอักษร');
            $start_row++;  
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ดี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($color_font_size_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'พอใช้');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($color_font_size_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ควรปรับปรุง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($color_font_size_3['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'ภาพหรือสัญลักษณ์ที่ใช้');
            $start_row++;  
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ดี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($picture_symbol_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'พอใช้');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($picture_symbol_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ควรปรับปรุง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($picture_symbol_3['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'การจัดหมวดหมู่ข้อมูล');
            $start_row++;  
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ดี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($group_data_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'พอใช้');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($group_data_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ควรปรับปรุง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($group_data_3['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'การเชื่อมโยงเว็บไซต์ต่าง ๆ');
            $start_row++;  
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ดี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($external_link_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'พอใช้');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($external_link_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ควรปรับปรุง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($external_link_3['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'ความง่ายในการใช้งาน');
            $start_row++;  
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ดี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($user_friendly_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'พอใช้');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($user_friendly_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ควรปรับปรุง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($user_friendly_3['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'ความทันสมัยของข้อมูล');
            $start_row++;  
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ดี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($up_to_date_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'พอใช้');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($up_to_date_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ควรปรับปรุง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($up_to_date_3['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'ความถูกต้องของข้อมูล');
            $start_row++;  
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ดี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($correction_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'พอใช้');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($correction_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ควรปรับปรุง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($correction_3['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'ความน่าสนใจของข้อมูล');
            $start_row++;  
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ดี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($attractive_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'พอใช้');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($attractive_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ควรปรับปรุง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($attractive_3['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'ความชัดเจนของข้อมูล');
            $start_row++;  
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ดี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($clarity_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'พอใช้');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($clarity_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ควรปรับปรุง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($clarity_3['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'ความรวดเร็วในการเข้าถึงข้อมูล');
            $start_row++;  
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ดี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($speed_data_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'พอใช้');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($speed_data_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ควรปรับปรุง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($speed_data_3['totals'] , $total));
            $start_row++;

            $objPHPExcel->getActiveSheet()->setCellValue('D'.$start_row, 'ประโยชน์ของข้อมูลข่าวสารที่ได้รับ');
            $start_row++;  
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ดี');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($benefit_1['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'พอใช้');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($benefit_2['totals'] , $total));
            $start_row++;
            $objPHPExcel->getActiveSheet()->setCellValue('E'.$start_row, 'ควรปรับปรุง');
            $objPHPExcel->getActiveSheet()->setCellValue('F'.$start_row, $this->calcHearingReport($benefit_3['totals'] , $total));
            $start_row++;

            

            $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
            $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);

            $objPHPExcel->getActiveSheet()
            ->getStyle("C7:F" . $objPHPExcel->getActiveSheet()->getHighestRow())
            ->applyFromArray($this->getDefaultStyle());

            return $objPHPExcel;

        }

        private function calcHearingReport($value, $total){
            return (($value / $total) * 100) . ' %';
        }

        private function getDefaultStyle(){
            return array(      
                    'borders' => [            
                    'allBorders' => array(
                        'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN
                    )],
                    
                    'alignment' => array(
                        'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT,
                        'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_TOP,
                        'wrap' => true
                     ),
                     'font'  => array(
                        'size'  => 12,
                        // 'bold'  => true
                    )
                );
        }

        private function getMonthName($month){
            
            $monthTxt = '';
            switch($month){
                case 1 : $monthTxt = 'มกราคม';break;
                case 2 : $monthTxt = 'กุมภาพันธ์';break;
                case 3 : $monthTxt = 'มีนาคม';break;
                case 4 : $monthTxt = 'เมษายน';break;
                case 5 : $monthTxt = 'พฤษภาคม';break;
                case 6 : $monthTxt = 'มิถุนายน';break;
                case 7 : $monthTxt = 'กรกฎาคม';break;
                case 8 : $monthTxt = 'สิงหาคม';break;
                case 9 : $monthTxt = 'กันยายน';break;
                case 10 : $monthTxt = 'ตุลาคม';break;
                case 11 : $monthTxt = 'พฤศจิกายน';break;
                case 12 : $monthTxt = 'ธันวาคม';break;
            }
            return $monthTxt;
        }
    
    }