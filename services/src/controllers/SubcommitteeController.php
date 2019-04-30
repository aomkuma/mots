<?php

    namespace App\Controller;
    
    use App\Service\SubcommitteeService;
    use App\Service\UserAccountService;

    class SubcommitteeController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getListActive($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                
                $_List = SubcommitteeService::getListActive();
                
                $this->data_result['DATA']['Subcommittee'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                //$subcommitteeID = $params['obj']['subcommitteeID'];
                $currentPage = filter_var($params['obj']['currentPage'], FILTER_SANITIZE_NUMBER_INT);
                $limitRowPerPage = filter_var($params['obj']['limitRowPerPage'], FILTER_SANITIZE_NUMBER_INT);

                $_Result = SubcommitteeService::getList($currentPage, $limitRowPerPage);
                $_List = $_Result['DataList'];
                $_Total = $_Result['Total'];

                $this->data_result['DATA']['Subcommittee'] = $_List;
                $this->data_result['DATA']['Total'] = $_Total;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $subcommitteeID = $params['obj']['id'];
                $_Data = SubcommitteeService::getData($subcommitteeID);

                $this->data_result['DATA']['Subcommittee'] = $_Data;

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
                $_Subcommittee = $params['obj']['Subcommittee'];
                $user_session = $params['user_session'];
                $_Subcommittee_Person = $_Subcommittee['subcommittee_person'];
                unset($_Subcommittee['subcommittee_person']);
                $subcommitteeID = SubcommitteeService::updateData($_Subcommittee);

                // add subcommittee person if exist
                foreach ($_Subcommittee_Person as $key => $value) {
                    if(empty($value['subcommitteePersonID'])){
                        $data = [];
                        $data['subcommitteeID'] = $subcommitteeID;
                        $data['stakeholderID'] = $value['stakeholderID'];
                        $data['positionName'] = $value['positionName'];
                        SubcommitteeService::addSubcommitteePerson($data);
                    }
                }

                $this->data_result['DATA']['subcommitteeID'] = $subcommitteeID;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $_subcommitteeID = filter_var($params['obj']['id'], FILTER_SANITIZE_NUMBER_INT);
                
                $result = SubcommitteeService::removeData($_subcommitteeID);
                
                $this->data_result['DATA'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteSubcommitteePersonData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $id = filter_var($params['obj']['id'], FILTER_SANITIZE_NUMBER_INT);

                $result = SubcommitteeService::removeSubcommitteePerson($id);
                
                $this->data_result['DATA'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    
    }