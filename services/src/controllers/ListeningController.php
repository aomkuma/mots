<?php

    namespace App\Controller;
    
    use App\Service\ListeningService;
    use App\Service\AttachFileService;

    class ListeningController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                //$emailID = $params['obj']['emailID'];
                $listening_type = $params['obj']['listening_type'];
                $view_type = $params['obj']['view_type'];
                $condition =  $params['obj']['condition'];

                $_List = ListeningService::getList($listening_type, $view_type, $condition);
                $_DataList = [];
                foreach($_List as $k => $v){
                    $_AttachFiles = AttachFileService::getAttachFiles($v['id'], 'listening');
                    // if(!empty($_AttachFiles)){
                        $v['AttachFiles'] = $_AttachFiles;
                        array_push($_DataList, $v);
                    // }
                }
                $this->data_result['DATA']['Listening'] = $_DataList;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
                $_Data = ListeningService::getData($id);
                $_AttachFiles = AttachFileService::getAttachFiles($_Data['id'], 'listening');
                $_Data['AttachFiles'] = $_AttachFiles;

                $this->data_result['DATA']['Listening'] = $_Data;

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
                $_Listening = $params['obj']['Data'];
                $FileName = $params['obj']['FileName'];
                $user_session = $params['user_session'];
                $page_type = 'listening';
                $OldAttachFile = $_Listening['AttachFiles'];

                unset($_Listening['AttachFiles']);

                $files = $request->getUploadedFiles();
                $AttachFileObj = $files['obj']['AttachFile'];
                // print_r($AttachFileObj);
                // exit;

                $id = ListeningService::updateData($_Listening);

                // Update Attach files
                $file_name_th = $FileName['name_th'];
                $file_name_en = $FileName['name_en'];
                
                $f = $AttachFileObj['attachFileTH'];
                // print_r($f);
                if($f != null && !empty($f)){
                    if($f->getClientFilename() != ''){
                        // if(!empty($OldAttachFile[0]['id'])){
                        //     $id_th = $OldAttachFile[0]['id'];
                        //     AttachFileService::removeAttachFile($id_th);
                        // }
                        $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = $id . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/attach-files/'.$FileName;

                        $AttachFile = ['parent_id'=>$id
                                        ,'menu_id'=>$id
                                        ,'page_type'=>$page_type
                                        ,'file_language'=>'TH'
                                        ,'file_name'=>(empty($file_name_th)?$f->getClientFilename():$file_name_th)
                                        ,'file_path'=>$FilePath
                                        ,'content_type'=>$f->getClientMediaType()
                                        ,'order_no' => 1
                                        ,'file_size'=>number_format($f->getSize()/1024, 2)

                                    ];
                        // print_r($AttachFile);exit;
                        AttachFileService::addAttachFiles($AttachFile);
                        $f->moveTo('../../' . $FilePath);
                        
                    }
                }

                $f = $AttachFileObj['attachFileEN'];
                // print_r($f);
                if($f != null && !empty($f)){
                    if($f->getClientFilename() != ''){

                        // if(!empty($OldAttachFile[1]['id'])){
                        //     $id_en = $OldAttachFile[1]['id'];
                        //     AttachFileService::removeAttachFile($id_en);
                        // }

                        $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = $id . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/attach-files/'.$FileName;

                        $AttachFile = ['parent_id'=>$id
                                        ,'menu_id'=>$id
                                        ,'page_type'=>$page_type
                                        ,'file_language'=>'EN'
                                        ,'file_name'=>(empty($file_name_en)?$f->getClientFilename():$file_name_en)
                                        ,'file_path'=>$FilePath
                                        ,'content_type'=>$f->getClientMediaType()
                                        ,'order_no' => 2
                                        ,'file_size'=>number_format($f->getSize()/1024, 2)

                                    ];
                        // print_r($AttachFile);exit;
                        AttachFileService::addAttachFiles($AttachFile);
                        $f->moveTo('../../' . $FilePath);
                        
                    }
                }

                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateComment($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $_Data = $params['obj']['Data'];
                $listening_id =  $params['obj']['id'];
                $_Data['listening_id'] = $listening_id;
                $id = ListeningService::updateComment($_Data);
                $this->data_result['DATA']['result'] = $id;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function viewComment($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $listening_id =  $params['obj']['listening_id'];
                
                $List = ListeningService::viewComment($listening_id);
                $this->data_result['DATA']['List'] = $List;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $_emailID = $params['obj']['id'];
                ListeningService::removeData($_emailID);
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteListeningCommodityData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $_emailCommodityID = $params['obj']['id'];
                $result = ListeningService::removeListeningCommodityData($_emailCommodityID);
                $this->data_result['DATA']['result'] = $result;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    
    }