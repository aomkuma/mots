<?php

    namespace App\Controller;
    
    use App\Service\NewsService;
    use App\Service\AttachFileService;

    class NewsController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getNewsListRSS($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                
                $_News = NewsService::getNewsList($news_type);
                
                $this->data_result['DATA']['News'] = $_News;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getNewsCategoryList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                
                $DataList = NewsService::getNewsCategoryList();
                
                $this->data_result['DATA']['DataList'] = $DataList;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getNewsList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $news_type  =$params['obj']['news_type'];
                $actives  =$params['obj']['actives'];
                $currentDate = $params['obj']['currentDate'];

                $_News = NewsService::getNewsList($news_type, $actives, $currentDate);
                $_NewsList = [];
                foreach($_News as $k => $v){
                    $_AttachFiles = AttachFileService::getAttachFiles($v['id'], 'news');
                    $v['AttachFiles'] = $_AttachFiles;
                    // print_r($v);exit;
                    array_push($_NewsList, $v);
                }
                // print_r($_NewsList);exit;
                $this->data_result['DATA']['News'] = $_NewsList;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getNewsListHomepage($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $news_type  =$params['obj']['news_type'];
                $actives  =$params['obj']['actives'];
                $currentDate = $params['obj']['currentDate'];

                $_News = NewsService::getNewsList('ข่าวเด่นรัฐมนตรีว่าการกระทรวงการท่องเที่ยวและกีฬาจากสื่อต่างๆ', 'Y', $currentDate);
                $_NewsList1 = [];
                foreach($_News as $k => $v){
                    $_AttachFiles = AttachFileService::getAttachFiles($v['id'], 'news');
                    $v['AttachFiles'] = $_AttachFiles;
                    // print_r($v);exit;
                    array_push($_NewsList1, $v);
                }
                // print_r($_NewsList);exit;
                $this->data_result['DATA']['NewsList1'] = $_NewsList1;

                $_News = NewsService::getNewsList('ข่าวประชาสัมพันธ์รัฐมนตรีว่าการกระทรวงการท่องเที่ยวและกีฬาจากสื่อต่างๆ', 'Y', $currentDate);
                $_NewsList2 = [];
                foreach($_News as $k => $v){
                    $_AttachFiles = AttachFileService::getAttachFiles($v['id'], 'news');
                    $v['AttachFiles'] = $_AttachFiles;
                    // print_r($v);exit;
                    array_push($_NewsList2, $v);
                }
                // print_r($_NewsList);exit;
                $this->data_result['DATA']['NewsList2'] = $_NewsList2;

                $_News = NewsService::getNewsList('ข่าวประชาสัมพันธ์ปลัดกระทรวงการท่องเที่ยวและกีฬา', 'Y', $currentDate);
                $_NewsList3 = [];
                foreach($_News as $k => $v){
                    $_AttachFiles = AttachFileService::getAttachFiles($v['id'], 'news');
                    $v['AttachFiles'] = $_AttachFiles;
                    // print_r($v);exit;
                    array_push($_NewsList3, $v);
                }
                // print_r($_NewsList);exit;
                $this->data_result['DATA']['NewsList3'] = $_NewsList3;

                $_News = NewsService::getNewsList('ข่าวประชาสัมพันธ์ของจังหวัด', 'Y');
                $_NewsList4 = [];
                foreach($_News as $k => $v){
                    $_AttachFiles = AttachFileService::getAttachFiles($v['id'], 'news');
                    $v['AttachFiles'] = $_AttachFiles;
                    // print_r($v);exit;
                    array_push($_NewsList4, $v);
                }
                // print_r($_NewsList);exit;
                $this->data_result['DATA']['NewsList4'] = $_NewsList4;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getNews($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $id  = $params['obj']['id'];
                $viewer = $params['obj']['viewer'];
                
                if($viewer == 'visitor'){
                    NewsService::updateNewsView($id);
                }

                $_News = NewsService::getNews($id);
                $_AttachFiles = AttachFileService::getAttachFiles($_News['id'], 'news');
                $_News['AttachFiles'] = $_AttachFiles;



                $this->data_result['DATA']['News'] = $_News;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateNewsCategory($request, $response, $args){
            try{
                
                $params = $request->getParsedBody();
                $Data = $params['obj']['Data'];

                // update all new reference with news type
                if(!empty($Data['id'])){
                    $NewsCategory = NewsService::getNewsCategory($Data['id']);    
                    NewsService::updateNewsType($NewsCategory['category_name'], $Data['category_name']);
                }
                
                NewsService::updateNewsCategory($Data);

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateNews($request, $response, $args){
            
            $_WEB_IMAGE_PATH = 'files/img';
            $_WEB_FILE_PATH = 'files/files';

            try{
                // error_reporting(E_ERROR);
                // error_reporting(E_ALL);
                // ini_set('display_errors','On');
                $params = $request->getParsedBody();

                // print_r($params);exit;
                $_News = $params['obj']['NewsObj']; 
                unset($_News['AttachFiles']);

                // Save News 
                $id = NewsService::updateNews($_News);
                // Update Attach files
                $files = $request->getUploadedFiles();
                if($files != null){
                    foreach($files as $key => $val){
                        foreach($val['AttachFileList'] as $k => $v){
                            // print_r($v['attachFile']);
                            $f = $v['attachFile'];
                            // print_r($f);
                            if($f != null){
                                if($f->getClientFilename() != ''){
                                    $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                                    $FileName = $id . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                                    $FilePath = $_WEB_FILE_PATH . '/news/'.$FileName;

                                    $AttachFile = ['parent_id'=>$id
                                                    ,'page_type'=>'news'
                                                    ,'file_name'=>$f->getClientFilename()
                                                    ,'file_path'=>$FilePath
                                                    ,'content_type'=>$f->getClientMediaType()
                                                    ,'file_size'=>number_format($f->getSize()/1024, 2)

                                                ];
                                    // print_r($AttachFile);exit;
                                    AttachFileService::addAttachFiles($AttachFile);
                                    $f->moveTo('../../' . $FilePath);
                                    
                                }
                            }
                        }
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
                        $delete_file_path = '../../' . $_WEB_IMAGE_PATH . $_News['image_cover_path'];
                        unset($delete_file_path);

                        $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_IMAGE_PATH . '/news/'.$FileName;
                        NewsService::updateNewsImagePath($id, $FilePath);
                        $f->moveTo('../../' . $FilePath);
                    }        
                }

                // exit;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    }