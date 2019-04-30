<?php

    namespace App\Controller;
    
    use App\Service\InfographicService;
    use App\Service\AttachFileService;
    
    class InfographicController extends Controller {
        
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
                $DEFAULT_LANGUAGE = $params['obj']['DEFAULT_LANGUAGE'];

                $_List = InfographicService::getList($actives);
                $_DataList = [];
                foreach($_List as $k => $v){
                    $_AttachFiles = AttachFileService::getAttachFilesWithLanguage($v['id'], 'infographic', $DEFAULT_LANGUAGE, $condition);
                    if(!empty($_AttachFiles)){
                        $v['AttachFiles'] = $_AttachFiles;
                        array_push($_DataList, $v);
                    }
                }

                $this->data_result['DATA']['DataList'] = $_DataList;

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
                $user_session = $params['user_session'];
                $page_type = 'infographic';
                // print_r($FileName);
                // exit;
                $order_no = $Data['order_no'];
                $cnt_index = 0;
                // Upload meeting files if exists
                $files = $request->getUploadedFiles();
                print_r($files);
                // exit;
                $UpdateAttachFileList = $Data['AttachFiles'];
                $AttachFileList  =$params['obj']['AttachFileList'];

                unset($Data['AttachFiles']);
                $id = InfographicService::updateData($Data);
                // Update attach file Modify
                $attachfile_order_no = 1;
                for($i = 0; $i < count($AttachFileList); $i++){
                    
                    $file_name_th = '';
                    $file_name_en = '';

                    if(!empty($FileName[$i]['name_th'])){
                        $file_name_th = $FileName[$i]['name_th'];
                    }
                    if(!empty($FileName[$i]['name_en'])){
                        $file_name_en = $FileName[$i]['name_en'];
                    }
                    
                    if(!empty($files['obj']['AttachFileList'][$i])){

                        $f = $files['obj']['AttachFileList'][$i]['AttachFile']['attachFileTH'];
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
                                                ,'file_code'=>$file_code_th
                                                //,'file_name'=>(empty($file_name_th)?$f->getClientFilename():$file_name_th)
                                                ,'file_name'=>$f->getClientFilename()
                                                ,'display_name'=>(empty($file_name_th)?$f->getClientFilename():$file_name_th)
                                                ,'file_path'=>$FilePath
                                                ,'content_type'=>$f->getClientMediaType()
                                                ,'order_no' => $attachfile_order_no
                                                ,'file_size'=>number_format($f->getSize()/1024, 2)

                                            ];
                                // print_r($AttachFile);exit;
                                AttachFileService::updateAttachFiles($AttachFile);
                                $f->moveTo('../../' . $FilePath);
                                
                            }
                        }
                        
                        // $attachfile_order_no++;
                        $f = $files['obj']['AttachFileList'][$i]['AttachFile']['attachFileEN'];
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
                                                ,'order_no' => $attachfile_order_no
                                                ,'file_size'=>number_format($f->getSize()/1024, 2)

                                            ];
                                // print_r($AttachFile);exit;
                                AttachFileService::updateAttachFiles($AttachFile);
                                $f->moveTo('../../' . $FilePath);
                                
                            }
                        }
                        

                    }
                    $attachfile_order_no++;
                }

                $cnt = 0;
                $loop = 0;
                echo "File name : ";
                $FileName = $params['obj']['FileName'];
                print_r($FileName);
                foreach($UpdateAttachFileList as $k => $v){
                    // if($cnt == 0){
                    
                    if($loop%2==0){
                        echo $file_name_th = $FileName[$cnt]['name_th'];
                        $file_code_th = $FileCode[$cnt]['code_th'];
                        if(!empty($file_name_th)){
                            $v['display_name'] = $file_name_th;
                        }
                        if(!empty($file_code_th)){
                            $v['file_code'] = $file_code_th;
                        }
                        
                    }else{
                        echo $file_name_en = $FileName[$cnt]['name_en'];
                        $file_code_en = $FileCode[$cnt]['code_en'];

                        if(!empty($file_name_en)){
                            
                            $v['display_name'] = $file_name_en;
                        }
                        if(!empty($file_code_en)){
                            
                            $v['file_code'] = $file_code_en;
                        }
                        $cnt++;
                    }
                    print_r($v);
                    AttachFileService::updateAttachFileName($v);
                    $loop++;
                }
                exit;
                $this->data_result['DATA']['id'] = $id;

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
                $result = InfographicService::updateVisitCount($id);

                $this->data_result['DATA']['result'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    }
