<?php

    namespace App\Controller;
    
    use App\Service\MeetingService;
    use App\Service\EmailService;
    use App\Service\CommodityStandardService;
    use App\Service\AcademicBoardService;
    use App\Service\UserAccountService;
    use App\Controller\Mailer;
    
    class MeetingController extends Controller {
        
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

                $_List = MeetingService::getList($standardID);

                $this->data_result['DATA']['Meeting'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListForHomepage($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $standardID = $params['obj']['standardID'];
                $userType = filter_var($params['obj']['userType'], FILTER_SANITIZE_STRING);
                $userID = filter_var($params['obj']['userID'], FILTER_SANITIZE_NUMBER_INT);

                if($userType == 'admin'){
                    $userID = '';
                }
                $_List = MeetingService::getListForHomepage($userID);

                $this->data_result['DATA']['Meeting'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getData($request, $response, $args){
            try{

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function viewAttendee($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $meetingID = $params['obj']['meetingID'];

                $_List = MeetingService::getAttendee($meetingID);
                $this->data_result['DATA']['Attendee'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function addAttendee($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $Attendee = $params['obj']['Attendee'];
                unset($Attendee['nameThai']);
                unset($Attendee['lastNameThai']);
                unset($Attendee['positionThai']);

                $value['createBy'] = $user_session['adminID'];
                $value['createDate'] = date('Y-m-d H:i:s');
                $value['updateBy'] = $user_session['adminID'];
                $value['updateDate'] = date('Y-m-d H:i:s');
                
                $_Attendee = MeetingService::addAttendee($Attendee);
                $this->data_result['DATA']['Attendee'] = $_Attendee;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function removeAttendee($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $meetingAttendeeID = $params['obj']['id'];

                $result = MeetingService::deleteAttendee($meetingAttendeeID);
                $this->data_result['DATA']['result'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function uploadMOMFile($request, $response, $args){

            $_WEB_FILE_PATH = 'files/files';
            try{

                $params = $request->getParsedBody();
                $user_session = $params['user_session'];
                $standardID = $params['obj']['standardID'];
                $meetingID = $params['obj']['meetingID'];

                $files = $request->getUploadedFiles();
                if($files != null){
                    $f = $files['obj']['MOMFile'];
                    // print_r($files);
                    // exit;
                    if($f->getClientFilename() != ''){
                        $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = $meetingID . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/commodity-standard/mom-files/'.$FileName;

                        $AttachFile = ['meetingID'=>$meetingID
                                        ,'standardID'=>$_Meeting['standardID']
                                        ,'fileName'=>$f->getClientFilename()
                                        ,'filePath'=>$FilePath
                                        ,'createBy'=>$user_session['adminID']
                                        ,'createDate'=>date('Y-m-d H:i:s')
                                        ,'updateBy'=>$user_session['adminID']
                                        ,'updateDate'=>date('Y-m-d H:i:s')
                                    ];
                        // print_r($AttachFile);exit;
                        $result = MeetingService::addMOMFile($AttachFile);
                        $f->moveTo('../../' . $FilePath);
                        
                    }

                }

                $this->data_result['DATA']['result'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);

            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateData($request, $response, $args){

            // error_reporting(E_ERROR);
            //     error_reporting(E_ALL);
            //     ini_set('display_errors','On');
            $_WEB_FILE_PATH = 'files/files';
            try{

                $params = $request->getParsedBody();
                $_Meeting = $params['obj']['Meeting'];
                $_AttendeeList = $params['obj']['AttendeeList'];
                $user_session = $params['user_session'];
                unset($_Meeting['meeting_attendees']);
                unset($_Meeting['mom_file']);
                unset($_Meeting['meeting_file']);
                unset($_Meeting['invite_file']);
                // print_r($_Meeting);
                // exit;

                foreach ($_Meeting as $key => $value) {
                    if($value == 'null' || $value == ''){
                        $_Meeting[$key] = NULL;
                    }
                }
                $meetingID = MeetingService::updateData($_Meeting);

                // Upload meeting files if exists
                $files = $request->getUploadedFiles();
                if($files != null){
                    foreach($files as $key => $val){
                        foreach($val['MeetingFileList'] as $k => $v){
                            // print_r($v);
                            // exit;
                            $f = $v['attachFile'];
                            // print_r($f);
                            if($f != null){
                                if($f->getClientFilename() != ''){
                                    $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                                    $FileName = $meetingID . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                                    $FilePath = $_WEB_FILE_PATH . '/commodity-standard/meeting-files/'.$FileName;

                                    $AttachFile = ['meetingID'=>$meetingID
                                                    ,'standardID'=>$_Meeting['standardID']
                                                    ,'fileName'=>$f->getClientFilename()
                                                    ,'filePath'=>$FilePath
                                                    ,'createBy'=>$user_session['adminID']
                                                    ,'createDate'=>date('Y-m-d H:i:s')
                                                    ,'updateBy'=>$user_session['adminID']
                                                    ,'updateDate'=>date('Y-m-d H:i:s')
                                                ];
                                    // print_r($AttachFile);exit;
                                    MeetingService::addMeetingFile($AttachFile);
                                    $f->moveTo('../../' . $FilePath);
                                    
                                }
                            }
                        }
                    }
                }

                // Upload invite files if exists
                $files = $request->getUploadedFiles();
                if($files != null){
                    foreach($files as $key => $val){
                        foreach($val['InviteFileList'] as $k => $v){
                            // print_r($v);
                            // exit;
                            $f = $v['attachFile'];
                            // print_r($f);
                            if($f != null){
                                if($f->getClientFilename() != ''){
                                    $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                                    $FileName = $meetingID . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                                    $FilePath = $_WEB_FILE_PATH . '/commodity-standard/invite-files/'.$FileName;

                                    $AttachFile = ['meetingID'=>$meetingID
                                                    ,'standardID'=>$_Meeting['standardID']
                                                    ,'fileName'=>$f->getClientFilename()
                                                    ,'filePath'=>$FilePath
                                                    ,'createBy'=>$user_session['adminID']
                                                    ,'createDate'=>date('Y-m-d H:i:s')
                                                    ,'updateBy'=>$user_session['adminID']
                                                    ,'updateDate'=>date('Y-m-d H:i:s')
                                                ];
                                    // print_r($AttachFile);exit;
                                    MeetingService::addInviteFile($AttachFile);
                                    $f->moveTo('../../' . $FilePath);
                                    
                                }
                            }
                        }
                    }
                }

                // Add Atendee
                $MailToAttendee = [];
                foreach ($_AttendeeList as $key => $value) {
                    $data = $value;
                    if(empty($value['meetingAttendeeID'])){  
                        unset($value['nameThai']);
                        unset($value['lastNameThai']);
                        unset($value['positionThai']);
                        foreach ($value as $k => $v) {
                            if($v == 'null' || $v == ''){
                                $value[$k] = NULL;
                            }
                        }
                        $value['createBy'] = $user_session['adminID'];
                        $value['createDate'] = date('Y-m-d H:i:s');
                        $value['updateBy'] = $user_session['adminID'];
                        $value['updateDate'] = date('Y-m-d H:i:s');
                        MeetingService::addAttendee($value);
                    }
                    $MailToAttendee[] = $data;
                }
                
                // send e-mail if sentMailStatus = 'Default'
                if($_Meeting['sentEmailStatus'] == 'Default'){
                    // Get e-mail hosting for send to attendee & academic board
                    $email_settings = EmailService::getEmailAcademicBord($_Meeting['standardID']);

                    // To attendee
                    foreach ($MailToAttendee as $key => $value) {
                        
                        // sent mail
                        $mailer = new Mailer;
                        $mailer->setMailHost('smtp.gmail.com');
                        $mailer->setMailPort('465');
                        $mailer->setMailUsername($email_settings->email);
                        $mailer->setMailPassword($email_settings->password);
                        $mailer->setSubject("ขอเชิญประชุมคณะกรรมการวิชาการพิจารณามาตรฐานสินค้าเกษตร");
                        $mailer->isHtml(true);

                        // Prepare data
                        $data = [];
                        if($_Meeting['meetingType'] == 'convoke'){
                            $data['toPerson'] = $value['nameThai'] . ' ' . $value['lastNameThai'];
                            $data['meetingName'] = $_Meeting['meetingName'];//$CommodityStandard->standardNameThai;
                            $data['startDate'] = $_Meeting['startDate'];
                            $data['endDate'] = $_Meeting['endDate'];
                            $data['address'] = $_Meeting['address'];
                            $data['remark'] = $_Meeting['remark'];

                            $mailer->setHTMLContent($this->generateMailConvokeContent($data));

                        }else{

                        }
                        
                        // Find email to 
                        $userData = UserAccountService::getUserDataByStakeholderID($value['attendeeID']);
                        $mailer->setReceiver($userData->email);

                        // Add attach files
                        $MOM_Files = MeetingService::getMeetingFile($meetingID);
                        // print_r($MOM_Files);exit;
                        foreach ($MOM_Files as $key => $value) {
                            // echo '../../' . $value->filePath;
                            $mailer->addAttachFile('../../' . $value->filePath, $value['fileName']);
                        }
                            // exit;
                        

                        $res = $mailer->sendMail();
                        if($res){
                            $this->logger->info('Sent mail Room success');
                        }else{
                            // print_r($res);
                            // exit;
                            $this->logger->info('Sent mail Room failed' . $res);
                        }
                    }
                    // End of send to attendee

                    // To Academic board
                    // get academic board list
                    $_AcademicBoard = AcademicBoardService::getAcademicBoardList($_Meeting['standardID']);
                    foreach ($_AcademicBoard as $key => $value) {
                        
                        // sent mail
                        $mailer = new Mailer;
                        $mailer->setMailHost('smtp.gmail.com');
                        $mailer->setMailPort('465');
                        $mailer->setMailUsername($email_settings->email);
                        $mailer->setMailPassword($email_settings->password);
                        
                        $mailer->isHtml(true);

                        // Prepare data
                        $data = [];
                        if($_Meeting['meetingType'] == 'convoke'){
                            $data['toPerson'] = $value['nameThai'] . ' ' . $value['lastNameThai'];
                            $data['meetingName'] = $_Meeting['meetingName'];//$CommodityStandard->standardNameThai;
                            $data['startDate'] = $_Meeting['startDate'];
                            $data['endDate'] = $_Meeting['endDate'];
                            $data['address'] = $_Meeting['address'];
                            $data['remark'] = $_Meeting['remark'];
                            $mailer->setSubject("ขอเชิญประชุมคณะกรรมการวิชาการพิจารณามาตรฐานสินค้าเกษตร");
                            $mailer->setHTMLContent($this->generateMailConvokeContent($data));

                        }else{
                            $data['toPerson'] = $value['nameThai'] . ' ' . $value['lastNameThai'];
                            $data['meetingName'] = $_Meeting['meetingName'];//$CommodityStandard->standardNameThai;
                            $data['startDate'] = $_Meeting['startDate'];
                            $data['endDate'] = $_Meeting['endDate'];
                            $data['address'] = $_Meeting['address'];
                            $data['remark'] = $_Meeting['remark'];
                            $mailer->setSubject("ขอเชิญเข้าร่วมการสัมมนาระดมความเห็นต่อร่างมาตรฐานสินค้าเกษตรและร่างแนวปฏิบัติในการใช้มาตรฐานสินค้าเกษตร");
                            $mailer->setHTMLContent($this->generateMailSeminarContent($data));
                        }
                        
                        // Find email to 
                        // $userData = UserAccountService::getUserDataByStakeholderID($value['attendeeID']);
                        $mailer->setReceiver($value->email);

                        // Add attach files
                        $MOM_Files = MeetingService::getMeetingFile($meetingID);
                        // print_r($MOM_Files);exit;
                        foreach ($MOM_Files as $key => $value) {
                            // echo '../../' . $value->filePath;
                            $mailer->addAttachFile('../../' . $value->filePath, $value['fileName']);
                        }
                            // exit;
                        

                        $res = $mailer->sendMail();
                        if($res){
                            $this->logger->info('Sent mail Room success');
                        }else{
                            // print_r($res);
                            // exit;
                            $this->logger->info('Sent mail Room failed' . $res);
                        }
                    }
                    // End of send to academic board
                }

                $this->data_result['DATA']['meetingID'] = $meetingID;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        private function generateMailConvokeContent($data){
            $str = "เรียน คุณ" . $data['toPerson'];
            $str .= "<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            $str .= "ด้วยสำนักงานมาตรฐานสินค้าเกษตรและอาหารแห่งชาติ (มกอช.) กำหนดจัดประชุมคณะกรรมการวิชาการพิจารณามาตรฐานสินค้าเกศตร เรื่อง";
            $str .= "<b>" . $data['meetingName'] ."</b>";
            if(date('Y-m-d', strtotime($data['startDate'])) == date('Y-m-d', strtotime($data['endDate']))){
                $str .= " ในวัน" . $this->getDayOfWeek($data['startDate']) . "ที่ " . $this->makeThaiDateTime($data['startDate']);   
                $str .= " - " . $this->makeTime($data['endDate']) . ' น.';
            }else{
                $str .= " ในวัน" . $this->getDayOfWeek($data['startDate']) . "ที่ " . $this->makeThaiDateTime($data['startDate']);   
                $str .= " - " . " วัน" . $this->getDayOfWeek($data['endDate']) . "ที่ " . $this->makeThaiDateTime($data['endDate']) . ' น.';
            }
            $str .= " ณ " . $data['address'];
            $str .= " โดยมีระเบียบวาระการประชุมตามสิ่งที่ส่งมาด้วย";
            $str .= "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            $str .= "จึงขอเรียนเชิญท่านเข้าร่วมประชุม ในวัน เวลา และสถานที่ดังกล่าว และกรุณาตอบกลับ มกอช. ทราบโดยท่านสามารถตอบกลับทางอีเมล ภายในวันที่ " . $this->replyDate($data['startDate']) . " ด้วย จะขอบคุณมาก";
            $str .= "<br><br>หมายเหตุ " . $data['remark'];
            
            return $str;
        }

        private function generateMailSeminarContent($data){
            $str = "เรียน คุณ" . $data['toPerson'];
            $str .= "<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            $str .= "ตามที่สำนักงานมาตรฐานสินค้าเกษตรและอาหารแห่งชาติ (มกอช.) ได้รับอนุมัติให้จัดสัมมนาระดมความเห็นต่อร่างมาตรฐานสินค้าเกษตร เรื่อง ";
            $str .= "<b>" . $data['meetingName'] ."</b>";
            $str .= " และร่างแนวปฏิบัติการใช้มาตรฐานสินค้าเกษตร เรื่อง ";
            $str .= "<b>" . $data['meetingName'] ."</b>";
            if(date('Y-m-d', strtotime($data['startDate'])) == date('Y-m-d', strtotime($data['endDate']))){
                $str .= " ในวัน" . $this->getDayOfWeek($data['startDate']) . "ที่ " . $this->makeThaiDateTime($data['startDate']);   
                $str .= " - " . $this->makeTime($data['endDate']) . ' น.';
            }else{
                $str .= " ในวัน" . $this->getDayOfWeek($data['startDate']) . "ที่ " . $this->makeThaiDateTime($data['startDate']);   
                $str .= " - " . " วัน" . $this->getDayOfWeek($data['endDate']) . "ที่ " . $this->makeThaiDateTime($data['endDate']) . ' น.';
            }
            $str .= " ณ " . $data['address'];
            $str .= " โดยมีวัตถุประสงค์เพื่อรับฟังความเห็นจากผู้มีส่วนได้ส่วนเสียทุกฝ่ายที่เกี่ยวข้อง เพื่อนำมาใช้ประกอบการพิจารณาแก้ไขร่างมาตรฐานสินค้าเกษตร ";
            $str .= "" . $data['meetingName'] ."";
            $str .= " และร่างแนวปฏิบัติการใช้มาตรฐานสินค้าเกษตร เรื่อง ";
            $str .= "" . $data['meetingName'] ."";
            $str .= " ให้อยู่ในแนวทางที่เหมาะสมและนำไปใช้ปฏิบัติได้ ทั้งนี้มีผู้เกี่ยวข้องจากภาครัฐและเอกชนเข้าร่วมสัมมนา รายละเอียดตามสิ่งที่ส่งมาด้วย ";
            $str .= "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

            $str .= "มกอช. ขอเรียนเชิญท่านหรือผู้แทนเข้าร่วมการสัมมนาดังกล่าว ทั้งนี้โปรดตอบกลับเข้าร่วมการสัมมนาภายในวันที่ " . $this->replyDate($data['startDate']);
            $str .= "<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
            $str .= " จึงเรียนมาเพื่อโปรดพิจารณาเข้าร่วมการสัมมนาในวัน เวลา และสถานที่ดังกล่าวด้วยจะขอบคุณมาก";
            $str .= "<br><br>หมายเหตุ " . $data['remark'];
            
            return $str;
        }

        private function makeThaiDateTime($date){
            $date = str_replace('.000', '', $date);
            $dateTimeObj = explode(' ', $date);
            $dateObj = $dateTimeObj[0]; 
            $timeObj = $dateTimeObj[1];

            $dateObj = explode('-' , $dateObj);
            $day = $dateObj[2];
            $month = $dateObj[1];
            $year = $dateObj[0];

            $timeObj = explode(':' , $timeObj);
            $hour = $timeObj[0];
            $minute = $timeObj[1];

            // Convert month to month text
             switch($month){
                case 1 : $month = 'มกราคม';break;
                case 2 : $month = 'กุมภาพันธ์';break;
                case 3 : $month = 'มีนาคม';break;
                case 4 : $month = 'เมษายน';break;
                case 5 : $month = 'พฤษภาคม';break;
                case 6 : $month = 'มิถุนายน';break;
                case 7 : $month = 'กรกฎาคม';break;
                case 8 : $month = 'สิงหาคม';break;
                case 9 : $month = 'กันยายน';break;
                case 10 : $month = 'ตุลาคม';break;
                case 11 : $month = 'พฤษจิกายน';break;
                case 12 : $month = 'ธันวาคม';break;
            }

            return $day . ' ' . $month . ' ' . ($year + 543) . ' เวลา ' . $hour . '.' . $minute;
        }

        private function replyDate($date){
            $date = date('Y-m-d H:i:s', strtotime("-3 day", strtotime($date)));
            $date = str_replace('.000', '', $date);
            $dateTimeObj = explode(' ', $date);
            $dateObj = $dateTimeObj[0]; 
            $timeObj = $dateTimeObj[1];

            $dateObj = explode('-' , $dateObj);
            $day = $dateObj[2];
            $month = $dateObj[1];
            $year = $dateObj[0];

            $timeObj = explode(':' , $timeObj);
            $hour = $timeObj[0];
            $minute = $timeObj[1];

            // Convert month to month text
             switch($month){
                case 1 : $month = 'มกราคม';break;
                case 2 : $month = 'กุมภาพันธ์';break;
                case 3 : $month = 'มีนาคม';break;
                case 4 : $month = 'เมษายน';break;
                case 5 : $month = 'พฤษภาคม';break;
                case 6 : $month = 'มิถุนายน';break;
                case 7 : $month = 'กรกฎาคม';break;
                case 8 : $month = 'สิงหาคม';break;
                case 9 : $month = 'กันยายน';break;
                case 10 : $month = 'ตุลาคม';break;
                case 11 : $month = 'พฤษจิกายน';break;
                case 12 : $month = 'ธันวาคม';break;
            }

            return $day . ' ' . $month . ' ' . ($year + 543);
        }

        private function makeTime($date){
            $date = str_replace('.000', '', $date);
            $dateTimeObj = explode(' ', $date);
            $dateObj = $dateTimeObj[0]; 
            $timeObj = $dateTimeObj[1];

            $timeObj = explode(':' , $timeObj);
            $hour = $timeObj[0];
            $minute = $timeObj[1];

            return $hour . '.' . $minute;
        }

        private function getDayOfWeek($date){
            $day = date('w', strtotime($date));
            switch($day){
                case 0 : $day = 'อาทิตย์';break;
                case 1 : $day = 'จันทร์';break;
                case 2 : $day = 'อังคาร';break;
                case 3 : $day = 'พุธ';break;
                case 4 : $day = 'พฤหัสบดี';break;
                case 5 : $day = 'ศุกร์';break;
                case 6 : $day = 'เสาร์';break;
            }
            return $day;
        }

        public function deleteData($request, $response, $args){
            try{

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteMeetingData($request, $response, $args){

            try{
                $params = $request->getParsedBody();
                $meetingFileID = $params['obj']['id'];
                $result = MeetingService::removeMeetingFile($meetingFileID);
                $this->data_result['DATA']['result'] = $result;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteInviteData($request, $response, $args){

            try{
                $params = $request->getParsedBody();
                $inviteFileID = $params['obj']['id'];
                $result = MeetingService::removeInviteFile($inviteFileID);
                $this->data_result['DATA']['result'] = $result;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function testmail($request, $response, $args){

            try{
                // sent mail
                // echo "testmaill";
                $email = $request->getAttribute('email');                
                $mailer = new Mailer($this->logger);
                $mailer->setMailHost('mail.acfs.go.th');
                $mailer->setMailHost('tls://mail.acfs.go.th:587');
                $mailer->setMailPort('587');
                $mailer->setMailUsername('standarddevelopment@acfs.go.th');
                $mailer->setMailPassword('279sktX2DX');
                $mailer->setSubject("ขอเชิญประชุมคณะกรรมการวิชาการพิจารณามาตรฐานสินค้าเกษตร");
                $mailer->isHtml(true);
                $mailer->setHTMLContent('test content ssss s');
                $mailer->setReceiver('korapotu@gmail.com');

                $res = $mailer->sendMail();
                if($res){
                    $this->logger->info('Sent mail Room success');
                    $result = 'Sent mail Room success';
                }else{
                    // print_r($res);
                    // exit;
                    $this->logger->info('Sent mail Room failed' . $res);
                    $result = 'Sent mail Room success'.$res;
                }
                echo $result;exit;
                $this->data_result['DATA']['result'] = $result;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    
    }