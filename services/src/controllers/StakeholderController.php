<?php

    namespace App\Controller;
    
    use App\Service\StakeholderService;
    use App\Service\UserAccountService;

    class StakeholderController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                //$stakeholderID = $params['obj']['stakeholderID'];
                $currentPage = filter_var($params['obj']['currentPage'], FILTER_SANITIZE_NUMBER_INT);
                $limitRowPerPage = filter_var($params['obj']['limitRowPerPage'], FILTER_SANITIZE_NUMBER_INT);

                $_Result = StakeholderService::getList($currentPage, $limitRowPerPage);
                $_List = $_Result['DataList'];
                $_Total = $_Result['Total'];

                $this->data_result['DATA']['Stakeholder'] = $_List;
                $this->data_result['DATA']['Total'] = $_Total;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $stakeholderID = $params['obj']['id'];
                $_Data = StakeholderService::getData($stakeholderID);

                $this->data_result['DATA']['Stakeholder'] = $_Data;

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
                $_Stakeholder = $params['obj']['Stakeholder'];
                $user_session = $params['user_session'];
                
                $stakeholderID = StakeholderService::updateData($_Stakeholder);

                // Prepare data to update user table
                $userData = UserAccountService::getUserDataByStakeholderID($stakeholderID);
                $update_data['userID'] = $userData['userID'];
                $update_data['stakeholderID'] = $stakeholderID;
                $update_data['email'] = $_Stakeholder['email'];
                // $update_data['password'] = $_User['password'];
                // $update_data['createBy'] = $_User['createBy'];
                // $update_data['createDate'] = $_User['createDate'];
                $update_data['updateBy'] = $user_session['adminID'];
                $update_data['updateDate'] = date('Y-m-d H:i:s');

                $userID = UserAccountService::updateUserData($update_data);

                $this->data_result['DATA']['stakeholderID'] = $stakeholderID;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $_stakeholderID = $params['obj']['id'];
                StakeholderService::removeData($_stakeholderID);
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    
    }