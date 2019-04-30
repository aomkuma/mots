<?php

    namespace App\Controller;
    
    use App\Service\SeminarService;

    class SeminarController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $actives = $params['obj']['actives'];
                $page_type = $params['obj']['page_type'];
                
                $_List = SeminarService::getList($page_type, $actives);

                $this->data_result['DATA']['List'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListResponse($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $seminar_id = $params['obj']['seminar_id'];
                
                $_List = SeminarService::getListResponse($seminar_id);

                $this->data_result['DATA']['List'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateData($request, $response, $args){
            $_WEB_IMAGE_PATH = 'files/img';
            $_WEB_FILE_PATH = 'files/files';
            try{
                // error_reporting(E_ERROR);
                // error_reporting(E_ALL);
                // ini_set('display_errors','On');
                $params = $request->getParsedBody();
                $_Seminar = $params['obj']['Data'];
                $user_session = $params['user_session'];

                // Update Attach files
                $files = $request->getUploadedFiles();
                $file_th = $files['obj']['ScheduleFile']['attachFileTH'];
                $file_en = $files['obj']['ScheduleFile']['attachFileEN'];
                // print_r($f);
                // exit;
                if($file_th != null){
                    if($file_th->getClientFilename() != ''){
                        // Unset old image if exist
                        
                        $ext = pathinfo($file_th->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/seminar/'.$FileName;
                        
                        $_Seminar['schedule_filename_th'] = $file_th->getClientFilename();
                        $_Seminar['schedule_filepath_th'] = $FilePath;
                        
                        $file_th->moveTo('../../' . $FilePath);
                    }        
                }
                if($file_en != null){
                    if($file_en->getClientFilename() != ''){
                        // Unset old image if exist
                        
                        $ext = pathinfo($file_en->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/seminar/'.$FileName;
                        
                        $_Seminar['schedule_filename_en'] = $file_en->getClientFilename();
                        $_Seminar['schedule_filepath_en'] = $FilePath;
                        
                        $file_en->moveTo('../../' . $FilePath);
                    }        
                }

                $file_th = $files['obj']['ParticipantFile']['attachFileTH'];
                $file_en = $files['obj']['ParticipantFile']['attachFileEN'];
                // print_r($f);
                // exit;
                if($file_th != null){
                    if($file_th->getClientFilename() != ''){
                        // Unset old image if exist
                        
                        $ext = pathinfo($file_th->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/seminar/'.$FileName;
                        
                        $_Seminar['participant_filename_th'] = $file_th->getClientFilename();
                        $_Seminar['participant_filepath_th'] = $FilePath;
                        
                        $file_th->moveTo('../../' . $FilePath);
                    }        
                }
                if($file_en != null){
                    if($file_en->getClientFilename() != ''){
                        // Unset old image if exist
                        
                        $ext = pathinfo($file_en->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/seminar/'.$FileName;
                        
                        $_Seminar['participant_filename_en'] = $file_en->getClientFilename();
                        $_Seminar['participant_filepath_en'] = $FilePath;
                        
                        $file_en->moveTo('../../' . $FilePath);
                    }        
                }
                
                $id = SeminarService::updateData($_Seminar);
                
                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
                $result = SeminarService::removeData($id);
                $this->data_result['DATA']['result'] = $result;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function addResponse($request, $response, $args){
            
            $_WEB_FILE_PATH = 'files/files';
            try{
                // error_reporting(E_ERROR);
                // error_reporting(E_ALL);
                // ini_set('display_errors','On');
                $params = $request->getParsedBody();
                $_Seminar = $params['obj']['Data'];
                $user_session = $params['user_session'];

                // Update Attach files
                $files = $request->getUploadedFiles();
                $file = $files['obj']['AttachFile'];
                // print_r($f);
                // exit;
                if($file != null){
                    if($file->getClientFilename() != ''){
                        // Unset old image if exist
                        
                        $ext = pathinfo($file->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/seminar/'.$FileName;
                        
                        $_Seminar['file_name'] = $file->getClientFilename();
                        $_Seminar['file_path'] = $FilePath;
                        
                        $file->moveTo('../../' . $FilePath);
                    }        
                }

                $id = SeminarService::addSeminarResponse($_Seminar);
                
                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }        

    
    }