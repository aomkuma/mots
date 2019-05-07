<?php

    namespace App\Controller;
    
    use App\Service\ContactUsService;
    
    class ContactUsController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }


        public function getData($request, $response, $args){
            try{
                $params = $request->getParsedBody();

                $_Page = ContactUsService::getData();

                $this->data_result['DATA'] = $_Page;

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
                
                $f = $files['obj']['ImageFile'];
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
                        $FilePath = $_WEB_FILE_PATH . '/contactus/'.$FileName;
                        
                        $_Data['image_name'] = $f->getClientFilename();
                        $_Data['image_path'] = $FilePath;
                        
                        $f->moveTo('../../' . $FilePath);
                    }        
                }

                $f = $files['obj']['MapFile'];
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
                        $FilePath = $_WEB_FILE_PATH . '/contactus/'.$FileName;
                        
                        $_Data['map_name'] = $f->getClientFilename();
                        $_Data['map_path'] = $FilePath;
                        
                        $f->moveTo('../../' . $FilePath);
                    }        
                }
                // print_r($_Data);
                // exit;
                $id = ContactUsService::updateData($_Data);

                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

    }
