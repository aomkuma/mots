<?php

    namespace App\Controller;
    
    use App\Service\AttachFileService;

    class AttachFileController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function removeAttachFile($request, $response, $args){
            try{

                $id = $request->getAttribute('id');
                AttachFileService::removeAttachFile($id);
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    
    }