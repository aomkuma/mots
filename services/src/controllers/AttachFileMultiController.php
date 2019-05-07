<?php

    namespace App\Controller;
    
    use App\Service\AttachFileMultiService;
    use App\Service\AttachFileService;
    use App\Service\MenuService;
    
    class AttachFileMultiController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $menu_type = $params['obj']['menu_type'];
                $actives = $params['obj']['actives'];
                $condition =  $params['obj']['condition'];
                $file_type = $params['obj']['file_type'];

                if($menu_type == 'skr' || $menu_type == 'rule-food' || $menu_type == 'manual-inspection'){
                    $_List = AttachFileMultiService::getList($menu_type, $actives);
                    $_DataList = [];
                    foreach($_List as $k => $v){
                        $_AttachFiles = AttachFileService::getAttachFiles($v['id'], $v['menu_type'], $condition);
                        if(!empty($_AttachFiles)){
                            $v['AttachFiles'] = $_AttachFiles;
                            array_push($_DataList, $v);
                        }
                    }
                }else if($menu_type == 'patrol'){

                    $_List = AttachFileMultiService::getList($menu_type, $actives, $condition, $file_type);
                    $_DataList = [];
                    foreach($_List as $k => $v){
                        $_AttachFiles = AttachFileService::getAttachFiles($v['id'], $v['menu_type'], $condition);
                        if(!empty($_AttachFiles)){
                            $v['AttachFiles'] = $_AttachFiles;
                            array_push($_DataList, $v);
                        }
                    }

                }else{
                    $_List = AttachFileMultiService::getList($menu_type, $actives, $condition);
                    $_DataList = [];
                    foreach($_List as $k => $v){
                        $_AttachFiles = AttachFileService::getAttachFiles($v['id'], $v['menu_type'], $condition);
                        if(!empty($_AttachFiles)){
                            $v['AttachFiles'] = $_AttachFiles;
                            array_push($_DataList, $v);
                        }
                    }
                }
                

                $this->data_result['DATA']['DataList'] = $_DataList;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getMasterList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $menu_type = $params['obj']['menu_type'];

                $_List = AttachFileMultiService::getMasterList($menu_type);
                
                $this->data_result['DATA']['DataList'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        

        public function updateData($request, $response, $args){
            $_WEB_FILE_PATH = 'files/files';
            try{

                $params = $request->getParsedBody();
                $Data = $params['obj']['Data'];
                $FileName = $params['obj']['FileName'];
                $FileCode = $params['obj']['FileCode'];
                $user_session = $params['user_session'];

                // find menu id from page type
                $Menu = MenuService::getMenuByType($Data['menu_type']);
                $menu_id = $Menu['id'];
                // print_r($FileName);
                // exit;
                $order_no = $Data['order_no'];
                // Upload meeting files if exists
                $files = $request->getUploadedFiles();
                if($files != null){
                    foreach($files as $key => $val){
                        $cnt = 0;
                        foreach($val['AttachFileList'] as $k => $v){
                            $Data['order_no'] = $order_no;
                            unset($Data['AttachFiles']);
                            $id = AttachFileMultiService::updateData($Data);
                            $page_type = $Data['menu_type'];
                            
                            $file_name_th = $FileName[$cnt]['name_th'];
                            $file_name_en = $FileName[$cnt]['name_en'];

                            $file_code_th = $FileCode[$cnt]['code_th'];
                            $file_code_en = $FileCode[$cnt]['code_en'];                            
                            // print_r($v);
                            // exit;
                            $f = $v['attachFileTH'];
                            // print_r($f);
                            if($f != null){
                                if($f->getClientFilename() != ''){

                                    $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                                    $FileName = $id . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                                    $FilePath = $_WEB_FILE_PATH . '/attach-files/'.$FileName;

                                    $AttachFile = ['parent_id'=>$id
                                                    ,'menu_id'=>$menu_id
                                                    ,'page_type'=>$page_type
                                                    ,'file_language'=>'TH'
                                                    ,'file_code'=>$file_code_th
                                                    //,'file_name'=>(empty($file_name_th)?$f->getClientFilename():$file_name_th)
                                                    ,'file_name'=>$f->getClientFilename()
                                                    ,'display_name'=>(empty($file_name_th)?$f->getClientFilename():$file_name_th)
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

                            $f = $v['attachFileEN'];
                            // print_r($f);
                            if($f != null){
                                if($f->getClientFilename() != ''){

                                    $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                                    $FileName = $id . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                                    $FilePath = $_WEB_FILE_PATH . '/attach-files/'.$FileName;

                                    $AttachFile = ['parent_id'=>$id
                                                    ,'menu_id'=>$id
                                                    ,'page_type'=>$page_type
                                                    ,'file_language'=>'EN'
                                                    ,'file_code'=>$file_code_en
                                                    ,'file_name'=>$f->getClientFilename()
                                                    ,'display_name'=>(empty($file_name_en)?$f->getClientFilename():$file_name_en)
                                                    ,'file_path'=>$FilePath
                                                    ,'content_type'=>$f->getClientMediaType()
                                                    ,'order_no' => 2
                                                    ,'file_size'=>number_format($f->getSize()/1024, 2)

                                                ];
                                    // print_r($AttachFile);exit;
                                    AttachFileService::updateAttachFiles($AttachFile);
                                    $f->moveTo('../../' . $FilePath);
                                    
                                }
                            }
                            $order_no++;
                            $cnt++;
                        }
                    }
                }else{
                    $AttachFileList = $Data['AttachFiles'];
                    unset($Data['AttachFiles']);
                    $id = AttachFileMultiService::updateData($Data);

                    $cnt = 0;
                    foreach($AttachFileList as $k => $v){
                        // if($cnt == 0){
                        $file_name_th = $FileName[$cnt]['name_th'];
                        $file_code_th = $FileCode[$cnt]['code_th'];
                        if($cnt%2==0){
                            if(!empty($file_name_th)){
                                $v['display_name'] = $file_name_th;
                            }
                            if(!empty($file_code_th)){
                                $v['file_code'] = $file_code_th;
                            }
                            $cnt++;
                        }else{
                            $file_name_en = $FileName[$cnt - 1]['name_en'];
                            $file_code_en = $FileCode[$cnt - 1]['code_en'];

                            if(!empty($file_name_en)){
                                
                                $v['display_name'] = $file_name_en;
                            }
                            if(!empty($file_code_en)){
                                
                                $v['file_code'] = $file_code_en;
                            }
                            
                        }
                          
                        AttachFileService::updateAttachFiles($v);
                        
                    }
                }

                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }

        }

        public function updateActiveStatus($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
                $active_status = $params['obj']['active_status'];

                $result = AttachFileMultiService::updateActiveStatus($id, $active_status);

                $this->data_result['DATA']['result'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }

        }

        public function updateSortData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $DataList = $params['obj']['DataList'];

                $order = 1;
                foreach ($DataList as $key => $value) {
                    AttachFileMultiService::updateSort($value['id'], $order);
                    $order++;
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

                $result = AttachFileMultiService::removeAttachFileMulti($id);

                $this->data_result['DATA']['result'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }

        }


    }
