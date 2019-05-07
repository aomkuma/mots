<?php

    namespace App\Controller;
    
    use App\Service\FooterLinkService;
    use App\Service\MenuService;
    
    class FooterLinkController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getListView($request, $response, $args){
            try{
                $params = $request->getParsedBody();

                // $_TypeList = [['link_type'=>'พ.ร.บ.มาตรฐานสินค้าเกษตร']
                //                 ,['link_type'=>'การรับรอง']
                //                 ,['link_type'=>'ความปลอดภัยอาหาร']
                //                 ,['link_type'=>'ข่าวและกิจกรรม']
                //                 ,['link_type'=>'การส่งเสริมและประชาสัมพันธ์']];
                // $DataList = [];
                // foreach ($_TypeList as $key => $value) {
                //     
                //     $value['Links'] = $List;
                //     array_push($DataList, $value);
                // }
                
                $DataList = FooterLinkService::getList();

                $this->data_result['DATA']['List'] = $DataList;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                //$emailID = $params['obj']['emailID'];
                $menu_type = $params['obj']['menu_type'];
                $condition = $params['obj']['condition'];
                
                $_List = FooterLinkService::getList();

                $this->data_result['DATA']['List'] = $_List;

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
                
                $id = FooterLinkService::updateData($_Data);

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
                $result = FooterLinkService::removeData($id);
                $this->data_result['DATA']['result'] = $result;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

    }
