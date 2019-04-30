<?php

    namespace App\Controller;
    
    use App\Service\MeetingResultService;
    
    class MeetingResultController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $meeting_type = $params['obj']['meeting_type'];
                
                $_List = MeetingResultService::getList($meeting_type);

                $this->data_result['DATA']['List'] = $_List;

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
                // Update Attach files
                $files = $request->getUploadedFiles();
                $f = $files['obj']['AttachFileTH'];
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
                        $FilePath = $_WEB_FILE_PATH . '/media/'.$FileName;
                        
                        $_Data['file_name_th'] = $f->getClientFilename();
                        $_Data['file_path_th'] = $FilePath;
                        
                        $f->moveTo('../../' . $FilePath);
                    }        
                }

                $f = $files['obj']['AttachFileEN'];
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
                        $FilePath = $_WEB_FILE_PATH . '/media/'.$FileName;
                        
                        $_Data['file_name_en'] = $f->getClientFilename();
                        $_Data['file_path_en'] = $FilePath;
                        
                        $f->moveTo('../../' . $FilePath);
                    }        
                }
                // print_r($_Data);
                // exit;
                $id = MeetingResultService::updateData($_Data);

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
                $result = MeetingResultService::removeData($id);
                $this->data_result['DATA']['result'] = $result;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }


    }
