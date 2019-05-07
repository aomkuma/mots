<?php

    namespace App\Controller;
    
    use App\Service\MasterfileService;
    
    class MasterfileController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }
       
        public function getMasterfile($request, $response, $args){
            try{
                $loginObj = $request->getParsedBody();
                $masterType = $loginObj['obj']['masterType'];
                $masterType = filter_var($masterType, FILTER_SANITIZE_STRING);
                
                switch($masterType){
                    case 'AccreditationScope' : $this->data_result['DATA'] = MasterfileService::getAccreditationScope(); break;
                    case 'Branch' : $this->data_result['DATA'] = MasterfileService::getBranch(); break;
                    case 'Province' : $this->data_result['DATA'] = MasterfileService::getProvince(); break;
                    case 'AcademicBoard' : $this->data_result['DATA'] = MasterfileService::getAcademicBoard(); break;
                    default : $this->data_result['DATA'] = MasterfileService::getMasterfile($masterType); break;
                }
                
                return $this->returnResponse(200, $this->data_result, $response, false);
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $e, $response);
            }
            
        }

        public function addMasterfile($request, $response, $args){
            try{
                $loginObj = $request->getParsedBody();
                $Data = $loginObj['obj']['Data'];
                $id = MasterfileService::addMasterfile($Data);

                $this->data_result['DATA']['id'] = $id;
                
                return $this->returnResponse(200, $this->data_result, $response, false);
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $e, $response);
            }
            
        }

        public function updateMasterfile($request, $response, $args){
            try{
                $loginObj = $request->getParsedBody();
                $masterType = $loginObj['obj']['masterType'];
                $data = $loginObj['obj']['data'];

                $masterType = filter_var($masterType, FILTER_SANITIZE_STRING);
                
                switch($masterType){
                    case 'AccreditationScope' : $this->data_result['DATA'] = MasterfileService::updateAccreditationScope($data); break;
                    case 'Branch' : $this->data_result['DATA'] = MasterfileService::updateBranch($data); break;
                    default : null;
                }
                
                return $this->returnResponse(200, $this->data_result, $response, false);
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $e, $response);
            }
            
        }

        public function deleteMasterfile($request, $response, $args){
            try{
                $loginObj = $request->getParsedBody();
                $masterType = $loginObj['obj']['masterType'];
                $id = $loginObj['obj']['id'];
                $masterType = filter_var($masterType, FILTER_SANITIZE_STRING);
                $id = filter_var($id, FILTER_SANITIZE_NUMBER_INT);
                
                switch($masterType){
                    case 'AccreditationScope' : $this->data_result['DATA'] = MasterfileService::deleteAccreditationScope($id); break;
                    case 'Branch' : $this->data_result['DATA'] = MasterfileService::deleteBranch($id); break;
                    default : null;
                }
                
                return $this->returnResponse(200, $this->data_result, $response, false);
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $e, $response);
            }
            
        }
        
    }

?>