<?php

    namespace App\Controller;
    
    use App\Service\EmailService;

    class EmailController extends Controller {
        
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

                $_List = EmailService::getList();

                $this->data_result['DATA']['Email'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $emailID = $params['obj']['id'];
                $_Data = EmailService::getData($emailID);
                $_EmailCommodityData = EmailService::getEmailCommodityData($emailID);
                $this->data_result['DATA']['Email'] = $_Data;
                $this->data_result['DATA']['EmailCommodity'] = $_EmailCommodityData;

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
                $_Email = $params['obj']['Email'];
                $_EmailCommodity = $params['obj']['EmailCommodity'];
                $user_session = $params['user_session'];

                foreach ($_Email as $key => $value) {
                    if($value == 'null' || $value == ''){
                        $_Email[$key] = NULL;
                    }
                }
                
                $emailID = EmailService::updateData($_Email);

                foreach ($_EmailCommodity as $key => $value) {
                    if(empty($value['emailCommodityID'])){
                        
                        unset($value['standardNameThai']);
                        $value['emailID'] = $emailID;

                        foreach ($value as $k => $v) {
                            if($v == 'null' || $v == ''){
                                $value[$v] = NULL;
                            }
                        }

                        EmailService::updateEmailCommodityData($value);
                    }
                }
                $this->data_result['DATA']['emailID'] = $emailID;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $_emailID = $params['obj']['id'];
                EmailService::removeData($_emailID);
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteEmailCommodityData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $_emailCommodityID = $params['obj']['id'];
                $result = EmailService::removeEmailCommodityData($_emailCommodityID);
                $this->data_result['DATA']['result'] = $result;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    
    }