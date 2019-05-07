<?php

    namespace App\Controller;
    
    use App\Service\OfficerContactService;
    
    class OfficerContactController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }


        public function getDepList($request, $response, $args){
            try{
                $params = $request->getParsedBody();

                $_List = OfficerContactService::getDepList();

                $this->data_result['DATA'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getOfficerList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $dep_id = $params['obj']['dep_id'];
                $_List = OfficerContactService::getOfficerList($dep_id);

                $this->data_result['DATA'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateDepData($request, $response, $args){
            
            try{
                $params = $request->getParsedBody();
                $_Data = $params['obj']['Data'];
                foreach ($_Data as $key => $value) {
                    if($value == 'null'){
                        $_Data[$key] = '';
                    }
                }

                $id = OfficerContactService::updateDepData($_Data);

                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateOfficerData($request, $response, $args){
            
            try{
                $params = $request->getParsedBody();
                $_Data = $params['obj']['Data'];
                foreach ($_Data as $key => $value) {
                    if($value == 'null'){
                        $_Data[$key] = '';
                    }
                }

                $id = OfficerContactService::updateOfficerData($_Data);

                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteDepData($request, $response, $args){
            
            try{
                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
               
                $result = OfficerContactService::deleteDepData($id);

                $this->data_result['DATA']['result'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteOfficerData($request, $response, $args){
            
            try{
                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
               
                $result = OfficerContactService::deleteOfficerData($id);

                $this->data_result['DATA']['result'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

    }
