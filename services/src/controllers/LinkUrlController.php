<?php

    namespace App\Controller;
    
    use App\Service\LinkUrlService;

    class LinkUrlController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getLinkUrl($request, $response, $args){
            
            try{
                $params = $request->getParsedBody();
                $_LinkUrl = LinkUrlService::getLinkUrl();
                
                $this->data_result['DATA']['LinkUrl'] = $_LinkUrl;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getLinkUrlView($request, $response, $args){
            
            try{
                $params = $request->getParsedBody();
                $_LinkUrlType = LinkUrlService::getLinkUrlType();
                $_LinkUrl = [];
                $cnt = 0;
                foreach($_LinkUrlType as $k => $v){
                    $data = LinkUrlService::getLinkUrlByType($v['link_type']);
                    $_LinkUrl[$cnt]['link_type'] = $v['link_type'];
                    $_LinkUrl[$cnt]['data'] = $data;
                    $cnt++;
                }
                $this->data_result['DATA']['LinkUrl'] = $_LinkUrl;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateLinkUrl($request, $response, $args){
            
            $_WEB_FILE_PATH = 'files/img';

            try{
                error_reporting(E_ERROR);
                error_reporting(E_ALL);
                ini_set('display_errors','On');
                $params = $request->getParsedBody();

                // print_r($params);exit;
                $_LinkUrl = $params['obj']['LinkUrl']; 
                
                // Update Attach files
                $files = $request->getUploadedFiles();
                if($files != null){
                    $files = $files['obj']['AttachFile'];
                    // print_r($files);exit;
                    if($files->getClientFilename() != ''){
                        $ext = pathinfo($files->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/link_url/'.$FileName;
                        $_LinkUrl['image_path'] = $FilePath;
                        
                        $files->moveTo('../../' . $FilePath);
                        
                    }   
                }
                $id = LinkUrlService::updateLinkUrl($_LinkUrl);
                // exit;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function removeLinkUrl($request, $response, $args){
            try{

                $id = $request->getAttribute('id');
                LinkUrlService::removeLinkUrl($id);
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    }