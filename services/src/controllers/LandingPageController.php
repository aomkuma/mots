<?php

    namespace App\Controller;
    
    use App\Service\LandingPageService;
    use App\Service\EmailService;
    use App\Controller\Mailer;
    
    class LandingPageController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getListView($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $actives = $params['obj']['actives'];
                $_List = LandingPageService::getListView($actives);

                $this->data_result['DATA'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getList($request, $response, $args){
            try{
                $params = $request->getParsedBody();

                $_List = LandingPageService::getList();

                $this->data_result['DATA'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateData($request, $response, $args){
            
            error_reporting(E_ERROR);
                error_reporting(E_ALL);
                ini_set('display_errors','On');
            $_WEB_IMAGE_PATH = 'files/img';

            try{
                $params = $request->getParsedBody();
                $_Data = $params['obj']['Data'];
                foreach ($_Data as $key => $value) {
                    if($value == 'null'){
                        $_Data[$key] = '';
                    }
                }

                // Update Attach files
                $files = $request->getUploadedFiles();
                $f = $files['obj']['AttachFile'];
                // print_r($f);
                // exit;
                if($f != null){
                    if($f->getClientFilename() != ''){
                        // Unset old image if exist
                        $delete_file_path = '../../' . $_WEB_IMAGE_PATH . $_Data['file_path'];
                        unset($delete_file_path);

                        $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_IMAGE_PATH . '/landing-page/'.$FileName;
                        
                        // $_Palace['picture_name'] = $f->getClientFilename();
                        $_Data['file_path'] = $FilePath;
                        
                        $f->moveTo('../../' . $FilePath);
                        
                    }        
                }


                $id = LandingPageService::updateData($_Data);

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
                
                $result = LandingPageService::removeData($id);

                $this->data_result['DATA']['result'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

    }
