<?php

    namespace App\Controller;
    
    use App\Service\AcademicBoardService;
    use App\Service\CommodityStandardService;
    use App\Service\UserAccountService;
    use App\Service\EmailService;
    use App\Controller\Mailer;
    
    class AcademicBoardController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getList($request, $response, $args){
            try{
            	$params = $request->getParsedBody();
            	$standardID = $params['obj']['standardID'];
                $_AcademicBoard = AcademicBoardService::getAcademicBoardList($standardID);
                
                $_AcademicBoard_List = [];
                foreach($_AcademicBoard as $k =>$v){
                    $Substitute_List = AcademicBoardService::getSubtituteList($v['academicBoardID']);
                    $v['Substitute_List'] = $Substitute_List;
                    array_push($_AcademicBoard_List, $v);
                }

                $this->data_result['DATA']['AcademicBoard'] = $_AcademicBoard_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getData($request, $response, $args){
            try{
            	$params = $request->getParsedBody();
            	$id = $params['obj']['id'];
                $_AcademicBoard = AcademicBoardService::getAcademicBoard($id);
                $_Commodity_Keywords_TH = AcademicBoardService::getCommodityKeywords($id, 'TH');
                $_Commodity_Keywords_EN = AcademicBoardService::getCommodityKeywords($id, 'EN');

                $this->data_result['DATA']['AcademicBoard'] = $_AcademicBoard;
                $this->data_result['DATA']['Commodity_Keywords_TH'] = $_Commodity_Keywords_TH;
                $this->data_result['DATA']['Commodity_Keywords_EN'] = $_Commodity_Keywords_EN;

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


                //print_r($params);exit;
                $_Stakeholders = $params['obj']['Stakeholders']; 
                $standardID = $params['obj']['standardID'];
                $user_session = $params['user_session'];
                $AcademicBoard['academicBoardID'] = $_Stakeholders['academicBoardID'];
                $AcademicBoard['stakeholderID'] = $_Stakeholders['stakeholderID'];
                $AcademicBoard['standardID'] = $standardID;
                $AcademicBoard['createBy'] = $user_session['adminID'];
                $AcademicBoard['updateBy'] = $user_session['adminID'];

                foreach ($AcademicBoard as $key => $value) {
                    if($value == 'null' || $value == ''){
                        $AcademicBoard[$key] = NULL;
                    }
                }

                $id = AcademicBoardService::updateAcademicBoard($AcademicBoard);

                foreach($_Stakeholders['Substitute_List'] as $k => $v){
                    $Substitute['substituteID'] = $v['substituteID'];
                	$Substitute['academicBoardID'] = $id;
                    $Substitute['stakeholderID'] = $v['stakeholderID'];
                    $Substitute['standardID'] = $standardID;
                	unset($v['$hashKey']);
                	AcademicBoardService::updateSubstituteAcademicBoard($Substitute);
                }


                // Send email 
                if(empty($AcademicBoard['academicBoardID'])){
                    
                    $userData = UserAccountService::getUserDataByStakeholderID($AcademicBoard['stakeholderID']);
                    if(!empty($userData)){

                        // Check password is empty or not
                        if(empty($userData->password)){
                            $userData->password = UserAccountService::generatePassword($userData->email);
                        }
                        // get standard name
                        $CommodityStandard = CommodityStandardService::getCommodityStandard($standardID);

                        // Get e-mail hosting for send
                        // $email_settings = EmailService::getEmailAcademicBord($standardID);
                        // if(!empty($email_settings)){
                        $this->logger->info('PREPARE Sent mail');
                            // sent mail
                            $mailer = new Mailer;
                            $mailer->setMailHost('tls://mail.acfs.go.th:587');
                            $mailer->setMailPort('587');
                            $mailer->setMailUsername('standarddevelopment@acfs.go.th');
                            $mailer->setMailPassword('279sktX2DX');
                            $mailer->setSubject("รหัสผ่านเข้าสู่ระบบสำหรับคณะกรรมการวิชาการพิจารณามาตรฐานสินค้าเกษตร");
                            $mailer->isHtml(true);
                            $mailer->setHTMLContent($this->generateAcademicBoardMailContent($CommodityStandard->standardNameThai, $userData->email, $userData->password));
                            $mailer->setReceiver($userData->email);
                            $res = $mailer->sendMail();
                            if($res){
                                $this->logger->info('Sent mail Room success');
                            }else{
                                // print_r($res);
                                // exit;
                                $this->logger->info('Sent mail Room failed' . $res->ErrorInfo);
                            }
                        // }
                    }
                }
                
                $this->data_result['DATA']['academicBoardID'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        private function generateAcademicBoardMailContent($standardName, $email, $password){
            return "ท่านได้รับการแต่งตั้งเป็นกรรมการวิชาการพิจารณามาตรฐานสินค้าเกษตร เรื่อง <b>" . $standardName . "</b> ซึ่งมีรายการเข้าสู่ระบบ ดังนี้"
                    . "<br><br>อีเมลสำหรับเข้าสู่ระบบ " . $email 
                    . "<br>รหัสผ่านสำหรับเข้าสู่ระบบ " . $password
                    . "<br>ลิ้งค์เข้าระบบ http://61.19.221.109/acfs/backend/#/guest/logon"
                    . "<br><br><b>**นี่คืออีเมลที่สร้างขึ้นจากระบบอัตโนมัติ กรุณาอย่าตอบกลับ e-mail ฉบับนี้**</b>"
                    ;
        }

        public function deleteData($request, $response, $args){
            
            try{
                $params = $request->getParsedBody();
                $academicBoardID = filter_var($params['obj']['academicBoardID'], FILTER_SANITIZE_NUMBER_INT);

                AcademicBoardService::removeAcademicBoard($academicBoardID);
                $this->data_result['DATA']['academicBoardID'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    }