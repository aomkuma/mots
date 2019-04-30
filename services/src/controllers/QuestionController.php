<?php

    namespace App\Controller;
    
    use App\Service\QuestionService;

    class QuestionController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getQuestionList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $question_picked = $params['obj']['question_picked'];
                $question_type = $params['obj']['question_type'];
                $_List = QuestionService::getQuestionList($question_type);
                
                $this->data_result['DATA']['QuestionList'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getQuestion($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $id = $params['obj']['id'];

                $_Question = QuestionService::getQuestion($id);
                
                $this->data_result['DATA']['Question'] = $_Question;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateQuestion($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $QuestionObj = $params['obj']['QuestionObj'];

                $question_id = QuestionService::updateQuestion($QuestionObj);
                
                $this->data_result['DATA']['question_id'] = $question_id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }        

        public function removeQuestion($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $id = $params['obj']['id'];

                $result = QuestionService::removeQuestion($id);
                
                $this->data_result['DATA']['result'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    
    }