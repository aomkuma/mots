<?php

    namespace App\Controller;
    
    use App\Service\BannerControlService;

    class BannerControlController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

       

        public function getBannerControl($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $id = $params['obj']['id'];

                $_BannerControl = BannerControlService::getControl($id);
                
                $this->data_result['DATA']['BannerControl'] = $_BannerControl;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateControl($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $List = $params['obj']['List'];
               
                    $id = BannerControlService::updateControl($List);
              
                
                $this->data_result['DATA']['control_id'] = $id ;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
  

           

        public function remove($request, $response, $args){
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