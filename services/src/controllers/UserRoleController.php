<?php

    namespace App\Controller;
    
    use App\Service\UserRoleService;
    
    class UserRoleController extends Controller {
        
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
                $actives = $params['obj']['actives'];
                
                $_List = UserRoleService::getList($actives);

                $this->data_result['DATA']['List'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                //$emailID = $params['obj']['emailID'];
                $role_id = $params['obj']['role_id'];
                
                $_Data = UserRoleService::getData($role_id);

                // get detail
                $_Details = UserRoleService::getDetails($role_id);

                $this->data_result['DATA']['Head'] = $_Data;
                $this->data_result['DATA']['Detail'] = $_Details;

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
                $_MenuList = $params['obj']['MenuList'];
                foreach ($_Data as $key => $value) {
                    if($value == 'null'){
                        $_Data[$key] = '';
                    }
                }
                
                $id = UserRoleService::updateData($_Data);
                $role_id = $id;
                // Update menu role
                // print_r($_MenuList);
                // exit;
                foreach ($_MenuList as $key => $value) {
                    // print_r($value['checked_menu']);
                    $checked_menu = $value['checked_menu'];
                    $menu_id = $value['id'];
                    

                    UserRoleService::updateDataDetail($role_id, $menu_id, $checked_menu);

                    foreach ($value['sub_menu'] as $key1 => $value1) {
                        // print_r($value['checked_menu']);
                        $checked_menu = $value1['checked_menu'];
                        $menu_id = $value1['id'];
                        
                        UserRoleService::updateDataDetail($role_id, $menu_id, $checked_menu);

                        foreach ($value1['sub_menu'] as $key2 => $value2) {
                            // print_r($value['checked_menu']);
                            $checked_menu = $value2['checked_menu'];
                            $menu_id = $value2['id'];
                            
                            UserRoleService::updateDataDetail($role_id, $menu_id, $checked_menu);

                            foreach ($value2['sub_menu'] as $key3 => $value3) {
                                // print_r($value['checked_menu']);
                                $checked_menu = $value3['checked_menu'];
                                $menu_id = $value3['id'];
                                
                                UserRoleService::updateDataDetail($role_id, $menu_id, $checked_menu);
                            }
                        }
                    }
                }
                // exit;
                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

    }
