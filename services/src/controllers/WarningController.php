<?php

    namespace App\Controller;
    
    class WarningController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }


        public function getData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $url = $params['obj']['url'];
                $result = file_get_contents($url);

                $this->data_result['DATA'] = json_decode($result, true);

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

    }
