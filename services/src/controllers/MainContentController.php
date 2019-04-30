<?php

    namespace App\Controller;
    
    use App\Service\MainContentService;
    
    class MainContentController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }
       
        public function getList($request, $response, $args){
            try{
                $loginObj = $request->getParsedBody();
                
                $this->data_result['DATA'] = MainContentService::getList();
                
                return $this->returnResponse(200, $this->data_result, $response, false);
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $e, $response);
            }
            
        }

        public function updateOrderNo($request, $response, $args){
            try{
                $loginObj = $request->getParsedBody();
                
                $Data = $loginObj['obj']['Data'];

                $order_no = 1;
                foreach ($Data as $key => $value) {
                    MainContentService::updateOrderNo($value['id'], $order_no);
                    $order_no++;
                }

                
                
                return $this->returnResponse(200, $this->data_result, $response, false);
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $e, $response);
            }
            
        }
        
    }

?>