<?php

    namespace App\Controller;
    
    use App\Service\OnlineServiceService;
    
    class OnlineServiceController extends Controller {
        
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
                $condition = $params['obj']['condition'];
                
                if(!empty($condition['months']) && !empty($condition['years'])){
                    $date_from = $condition['years'] . '-' . str_pad($condition['months'], 2, '0', STR_PAD_LEFT) . '-01'; 
                    $maxDay = date('t', strtotime($date_from));
                    $date_to = $condition['years'] . '-' . str_pad($condition['months'], 2, '0', STR_PAD_LEFT) . '-' . $maxDay; 
                    $create_date = [$date_from, $date_to];
                }
                
                $_List = OnlineServiceService::getList($create_date);

                $this->data_result['DATA']['List'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function requestData($request, $response, $args){
            
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
                
                $_OnlineServiceTypeList = $params['obj']['ServiceTypeList'];
                if($_Data['prefix'] == 'อื่นๆ'){
                    $_Data['prefix'] = $_Data['other_prefix'];
                }
                if($_Data['occupation'] == 'อื่นๆ'){
                    $_Data['occupation'] = $_Data['other_occupation'];
                }

                unset($_Data['other_prefix']);
                unset($_Data['other_occupation']);
                // Update Attach files
                
                $id = OnlineServiceService::updateData($_Data);

                // Add OnlineServiceTypeList
                foreach ($_OnlineServiceTypeList as $key => $value) {
                    if($value['checked']){
                        $value['online_service_id'] = $id;
                        unset($value['checked']);
                        OnlineServiceService::addOnlineServiceType($value);
                    }
                }

                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateData($request, $response, $args){
            
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
                
                unset($_Data['online_service_type']);
                // Update Attach files
                
                $id = OnlineServiceService::updateData($_Data);

                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

    }
