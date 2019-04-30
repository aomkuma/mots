<?php

    namespace App\Controller;
    
    use App\Service\PurchaseService;
    use App\Service\AttachFileService;

    class PurchaseController extends Controller {
        
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
                $echo_status = '';
                if($page_type == 'cancelled-work'){
                    $echo_status = 'N';
                }
                $_List = PurchaseService::getList($page_type, $actives, $echo_status);
                $_DataList = [];
                foreach($_List as $k => $v){
                    $_AttachFiles = AttachFileService::getAttachFiles($v['id'], $v['page_type']);
                
                    $v['AttachFileList'] = $_AttachFiles;
                    array_push($_DataList, $v);
                
                }

                $this->data_result['DATA']['List'] = $_DataList;

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
                $_Purchase = $params['obj']['Data'];
                $user_session = $params['user_session'];

                $page_type = $_Purchase['page_type'];

                if(empty($_Purchase['create_by'])){
                    $_Purchase['create_by'] = $user_session['adminID'];
                }
                $_Purchase['update_by'] = $user_session['adminID'];
                unset($_Purchase['AttachFileList']);

                foreach ($_Purchase as $key => $value) {
                    if($value == 'null'){
                        $_Purchase[$key] = '';
                    }
                }
                $id = PurchaseService::updateData($_Purchase);

                // Update Attach files
                $files = $request->getUploadedFiles();
                $FileList = $files['obj']['Data']['AttachFileList'];
                // print_r($FileList);
                // exit;
                foreach ($FileList as $key => $value) {
                    $f = $value['attachFile'];
                    // print_r($f);
                    if($f != null){
                        if($f->getClientFilename() != ''){

                            $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                            $FileName = $id . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                            $FilePath = $_WEB_FILE_PATH . '/attach-files/'.$FileName;

                            $AttachFile = ['parent_id'=>$id
                                            ,'menu_id'=>$id
                                            ,'page_type'=>$page_type
                                            ,'file_language'=>'TH'
                                            ,'file_code'=>''
                                            //,'file_name'=>(empty($file_name_th)?$f->getClientFilename():$file_name_th)
                                            ,'file_name'=>$f->getClientFilename()
                                            ,'display_name'=>$f->getClientFilename()
                                            ,'file_path'=>$FilePath
                                            ,'content_type'=>$f->getClientMediaType()
                                            ,'order_no' => 1
                                            ,'file_size'=>number_format($f->getSize()/1024, 2)

                                        ];
                            // print_r($AttachFile);exit;
                            AttachFileService::updateAttachFiles($AttachFile);
                            $f->moveTo('../../' . $FilePath);
                            
                        }
                    }
                }
                
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
                $result = PurchaseService::removeData($id);
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
                $_Purchase = $params['obj']['Data'];
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
                        
                        $_Purchase['file_name'] = $file->getClientFilename();
                        $_Purchase['file_path'] = $FilePath;
                        
                        $file->moveTo('../../' . $FilePath);
                    }        
                }

                $id = PurchaseService::addPurchaseResponse($_Purchase);
                
                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }        

    
    }