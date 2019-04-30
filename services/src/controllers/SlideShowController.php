<?php

    namespace App\Controller;
    
    use App\Service\SlideShowService;
    use App\Service\AttachFileService;

    class SlideShowController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getSlideShowView($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $_SlideShow = SlideShowService::getSlideShowView();
                
                $this->data_result['DATA']['SlideShow'] = $_SlideShow;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getSlideShow($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $_SlideShow = SlideShowService::getSlideShow();
                
                $this->data_result['DATA']['SlideShow'] = $_SlideShow;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateSlideShow($request, $response, $args){
            $_WEB_FILE_PATH = 'files/img';
            try{
                error_reporting(E_ERROR);
                error_reporting(E_ALL);
                ini_set('display_errors','On');
                $params = $request->getParsedBody();

                // print_r($params);exit;
                $_SlideShow = $params['obj']['SlideShowObj']; 
                $id = SlideShowService::updateSlideShow($_SlideShow);
                $_SlideShow['id'] = $id;
                // Update Attach files
                $files = $request->getUploadedFiles();
                $f = $files['obj']['AttachFileObj'];
                // print_r($f->file);exit;
                if($f != null){
                    
                    $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                    $FileName = $id . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                    $FilePath = $_WEB_FILE_PATH . '/slide/'.$FileName;
                    $_SlideShow['file_name'] = $f->getClientFilename();
                    $_SlideShow['file_path'] = $FilePath;
                    $_SlideShow['contents_type'] = $f->getClientMediaType();
                    $f->moveTo('../../' . $FilePath);
                    
                }
                //exit;
                // Save SlideShow 
                $id = SlideShowService::updateSlideShow($_SlideShow);
                // exit;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function removeSlideShow($request, $response, $args){
            try{

                $id = $request->getAttribute('id');
                SlideShowService::removeSlideShow($id);
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    }