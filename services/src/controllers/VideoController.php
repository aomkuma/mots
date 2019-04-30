<?php

    namespace App\Controller;
    
    use App\Service\VideoService;

    class VideoController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getVideoList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $actives = $params['obj']['actives'];
                $_List = VideoService::getVideoList($actives);
                
                $this->data_result['DATA']['VideoList'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getVideo($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
                $view_type = $params['obj']['view_type'];

                if($view_type == 'viewer'){
                    // Update visit count
                    VideoService::updateVisitCount($id);                    
                }

                $_Video = VideoService::getVideo($id);
                
                $this->data_result['DATA']['Video'] = $_Video;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateVideo($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $VideoObj = $params['obj']['VideoObj'];

                $video_id = VideoService::updateVideo($VideoObj);
                
                $this->data_result['DATA']['video_id'] = $video_id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }        

        public function removeVideo($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $id = $params['obj']['id'];

                $result = VideoService::removeVideo($id);
                
                $this->data_result['DATA']['result'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    
    }