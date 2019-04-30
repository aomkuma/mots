<?php

    namespace App\Controller;
    
    use App\Service\MediaService;
    
    class MediaController extends Controller {
        
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
                
                $_List = MediaService::getList($actives);

                $this->data_result['DATA']['List'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateVisitCountData($request, $response, $args){
            try{
                // error_reporting(E_ERROR);
                // error_reporting(E_ALL);
                // ini_set('display_errors','On');
                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
                $result = MediaService::updateVisitCount($id);

                $this->data_result['DATA']['result'] = $result;

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
                        $FilePath = $_WEB_FILE_PATH . '/media/'.$FileName;
                        
                        $_Data['file_name'] = $f->getClientFilename();
                        $_Data['file_path'] = $FilePath;
                        $_Data['file_type'] = $f->getClientMediaType();
                        
                        $f->moveTo('../../' . $FilePath);
                    }        
                }
                // print_r($_Data);
                // exit;
                $id = MediaService::updateData($_Data);

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
                $result = MediaService::removeData($id);
                $this->data_result['DATA']['result'] = $result;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteVideoData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
                $result = MediaService::removeVideoData($id);
                $this->data_result['DATA']['result'] = $result;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

    }
