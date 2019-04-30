<?php

    namespace App\Controller;
    
    use App\Service\ServicesService;

    class ServicesController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getServicesList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $actives = $params['obj']['actives'];
                
                $_List = ServicesService::getServicesList($actives);
                
                $this->data_result['DATA']['ServicesList'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getServices($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $id = $params['obj']['id'];

                $_Services = ServicesService::getServices($id);
                
                $this->data_result['DATA']['Services'] = $_Services;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateServices($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $ServicesList = $params['obj']['ServicesList'];
                foreach ($ServicesList as $key => $value) {
                    $services_id = ServicesService::updateServices($value);
                }
                
                
                $this->data_result['DATA']['services_id'] = $services_id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function addQuestion($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $Question = $params['obj']['Question'];
                $QuestionDetail = $params['obj']['QuestionDetail'];

                $question_id = ServicesService::addQuestion($Question);
                foreach ($QuestionDetail as $key => $value) {
                    $value['question_id'] = $question_id;
                    ServicesService::addQuestionDetail($value);
                }
                
                $this->data_result['DATA']['question_id'] = $question_id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }     

           

        public function removeServices($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $id = $params['obj']['id'];

                $result = ServicesService::removeServices($id);
                
                $this->data_result['DATA']['result'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    
    }