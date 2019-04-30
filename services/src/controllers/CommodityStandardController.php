<?php

    namespace App\Controller;
    
    use App\Service\CommodityStandardService;
    use App\Service\AttachFileService;

    class CommodityStandardController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getListInUse($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                
                $List = CommodityStandardService::getListInUse();
                $this->data_result['DATA']['List'] = $List;
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListForQuestionnaire($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $keyword = filter_var($params['obj']['keyword'], FILTER_SANITIZE_STRING);
                
                $List = CommodityStandardService::getListForQuestionnaire($keyword);
                $this->data_result['DATA']['List'] = $List;
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListReplace($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $standardID = filter_var($params['obj']['standardID'], FILTER_SANITIZE_NUMBER_INT);
                
                $List = CommodityStandardService::getListReplace($standardID);
                $this->data_result['DATA']['List'] = $List;
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListActive($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $years = filter_var($params['obj']['years'], FILTER_SANITIZE_NUMBER_INT);
                $years += 543;
                $CommodityStandard = CommodityStandardService::getListActive($years);
                $this->data_result['DATA']['CommodityStandard'] = $CommodityStandard;
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
        public function getListForHomepage($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $userType = filter_var($params['obj']['userType'], FILTER_SANITIZE_STRING);
                $userID = filter_var($params['obj']['userID'], FILTER_SANITIZE_NUMBER_INT);
                $currentPage = filter_var($params['obj']['currentPage'], FILTER_SANITIZE_NUMBER_INT);
                $limitRowPerPage = filter_var($params['obj']['limitRowPerPage'], FILTER_SANITIZE_NUMBER_INT);
                $standardIDToIgnore = $params['obj']['standardIDToIgnore'];

                $stepList = [1,2,3,4,5,6,7,8,9,11];
                $CommodityStandard = [];
                $Total = 0;
                if($userType == 'admin'){

                    // Check data compare create date with current date
                    /*
                    */
                    $limitRow = $limitRowPerPage;
                    $_Result = CommodityStandardService::getCommodityStandardList($currentPage, $limitRow, $standardIDToIgnore, $stepList);
                    $_CommodityStandard = $_Result['DataList'];
                    $_Total = $_Result['Total'];

                    foreach ($_CommodityStandard as $key => $value) {
                        array_push($CommodityStandard, $value);
                    }
                    $Total += $_Total;

                }else{
                    /*
                    */
                    $limitRow = $limitRowPerPage;
                    $_Result = CommodityStandardService::getCommodityStandardListForUser($userID, $currentPage, $limitRow, $standardIDToIgnore, $stepList);
                    $_CommodityStandard = $_Result['DataList'];
                    $_Total = $_Result['Total'];

                    foreach ($_CommodityStandard as $key => $value) {
                        array_push($CommodityStandard, $value);
                    }
                    $Total += $_Total;

                }

                $Total = ceil($Total / $limitRowPerPage);
                $this->data_result['DATA']['CommodityStandard'] = $CommodityStandard;
                $this->data_result['DATA']['Total'] = $Total;
                $this->data_result['DATA']['standardIDToIgnore'] = $standardIDToIgnore;
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getList($request, $response, $args){
            try{
            	$params = $request->getParsedBody();
            	$userType = filter_var($params['obj']['userType'], FILTER_SANITIZE_STRING);
                $userID = filter_var($params['obj']['userID'], FILTER_SANITIZE_NUMBER_INT);
                $currentPage = filter_var($params['obj']['currentPage'], FILTER_SANITIZE_NUMBER_INT);
                $limitRowPerPage = filter_var($params['obj']['limitRowPerPage'], FILTER_SANITIZE_NUMBER_INT);
                $viewType = filter_var($params['obj']['viewType'], FILTER_SANITIZE_STRING);
                if($viewType == 'pending'){
                    $stepList = [1,2,3,4,5,6,7,8,11];
                }else if($viewType == 'inuse'){
                    $stepList = [9,11];
                }else if($viewType == 'cancelled'){
                    $stepList = [10];
                }
                $CommodityStandard = [];
                $Total = 0;

                /*
                // Check data compare create date with current date
                $_Result = CommodityStandardService::getCommodityStandardListWithCheckDate($currentPage, $limitRowPerPage);
                $_CommodityStandard = $_Result['DataList'];
                // print_r($_Result);exit;
                $_Total = $_Result['Total'];
                // $standardIDToIgnore = [];
                foreach ($_CommodityStandard as $key => $value) {
                    $standardIDToIgnore[] = $value['standardID'];
                    $value['step'] = 11;
                    array_push($CommodityStandard, $value);
                }
                $Total += $_Total;
                */
                $limitRow = $limitRowPerPage - $Total;
                $_Result = CommodityStandardService::getCommodityStandardList($currentPage, $limitRow, $standardIDToIgnore, $stepList);
                $_CommodityStandard = $_Result['DataList'];
                $_Total = $_Result['Total'];
                foreach ($_CommodityStandard as $key => $value) {
                    array_push($CommodityStandard, $value);
                }
                $Total += $_Total;

                $Total = ceil($Total / $limitRowPerPage);
                $this->data_result['DATA']['CommodityStandard'] = $CommodityStandard;
                $this->data_result['DATA']['Total'] = $Total;
                $this->data_result['DATA']['standardIDToIgnore'] = $standardIDToIgnore;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListSearch($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $currentPage = filter_var($params['obj']['currentPage'], FILTER_SANITIZE_NUMBER_INT);
                $limitRowPerPage = filter_var($params['obj']['limitRowPerPage'], FILTER_SANITIZE_NUMBER_INT);
                $keyword = filter_var($params['obj']['keyword'], FILTER_SANITIZE_STRING);
                $standardType = filter_var($params['obj']['standardType'], FILTER_SANITIZE_STRING);
                $standardDefineType = filter_var($params['obj']['standardDefineType'], FILTER_SANITIZE_STRING);
                $stepList = [1,2,3,4,5,6,7,8,9,11];
                
                $CommodityStandard = [];
                $Total = 0;

                $limitRow = $limitRowPerPage - $Total;
                $_Result = CommodityStandardService::getCommodityStandardListSearch($currentPage, $limitRow, $keyword, $standardType, $standardDefineType);
                $_CommodityStandard = $_Result['DataList'];
                $_Total = $_Result['Total'];
                foreach ($_CommodityStandard as $key => $value) {
                    array_push($CommodityStandard, $value);
                }
                $Total += $_Total;

                $Total = ceil($Total / $limitRowPerPage);
                $this->data_result['DATA']['CommodityStandard'] = $CommodityStandard;
                $this->data_result['DATA']['Total'] = $Total;
                $this->data_result['DATA']['standardIDToIgnore'] = $standardIDToIgnore;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListPlan($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $currentPage = filter_var($params['obj']['currentPage'], FILTER_SANITIZE_NUMBER_INT);
                $limitRowPerPage = filter_var($params['obj']['limitRowPerPage'], FILTER_SANITIZE_NUMBER_INT);
                $keyword = filter_var($params['obj']['keyword'], FILTER_SANITIZE_STRING);
                $stepList = [1,2,3,4,5,6,7,8,9,11];
                
                $CommodityStandard = [];
                $Total = 0;

                $limitRow = $limitRowPerPage - $Total;
                $_Result = CommodityStandardService::getCommodityStandardListPlan($currentPage, $limitRow, $keyword);
                $_CommodityStandard = $_Result['DataList'];
                $_Total = $_Result['Total'];
                foreach ($_CommodityStandard as $key => $value) {
                    array_push($CommodityStandard, $value);
                }
                $Total += $_Total;

                $Total = ceil($Total / $limitRowPerPage);
                $this->data_result['DATA']['CommodityStandard'] = $CommodityStandard;
                $this->data_result['DATA']['Total'] = $Total;
                $this->data_result['DATA']['standardIDToIgnore'] = $standardIDToIgnore;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListGeneral($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $currentPage = filter_var($params['obj']['currentPage'], FILTER_SANITIZE_NUMBER_INT);
                $limitRowPerPage = filter_var($params['obj']['limitRowPerPage'], FILTER_SANITIZE_NUMBER_INT);
                $keyword = filter_var($params['obj']['keyword'], FILTER_SANITIZE_STRING);
                $standardType = filter_var($params['obj']['standardType'], FILTER_SANITIZE_STRING);
                $stepList = ['9','11'];//[1,2,3,4,5,6,7,8,9];
                $defineType = 'ทั่วไป';
                $CommodityStandard = [];
                $Total = 0;

                $limitRow = $limitRowPerPage - $Total;
                $_Result = CommodityStandardService::getCommodityStandardListByType($currentPage, $limitRow, $keyword, $defineType, $standardType, $stepList);
                $_CommodityStandard = $_Result['DataList'];
                $_Total = $_Result['Total'];
                foreach ($_CommodityStandard as $key => $value) {
                    // Find cancelled history
                    $replace_id = $value['standardID'];
                    $replace_title = $value['standardNameThai'];
                    $cancelled_description = '';
                    do{
                        $cancelled_data = CommodityStandardService::findCommodityStandardCancelled($replace_id);
                        if(!empty($cancelled_data)){
                            $cancelled_description .= $replace_title . ' ใช้แทน ' . $cancelled_data['standardNameThai'] . '<br>';
                            $replace_id = $cancelled_data['id_cancelled'];
                            $replace_title = $cancelled_data['standardNameThai'];
                        }

                    }while(!empty($cancelled_data));
                    $value['cancelled_data'] = $cancelled_description;
                    array_push($CommodityStandard, $value);
                }
                $Total += $_Total;

                $Total = ceil($Total / $limitRowPerPage);
                $this->data_result['DATA']['CommodityStandard'] = $CommodityStandard;
                $this->data_result['DATA']['Total'] = $Total;
                $this->data_result['DATA']['standardIDToIgnore'] = $standardIDToIgnore;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListMandatory($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $currentPage = filter_var($params['obj']['currentPage'], FILTER_SANITIZE_NUMBER_INT);
                $limitRowPerPage = filter_var($params['obj']['limitRowPerPage'], FILTER_SANITIZE_NUMBER_INT);
                $keyword = filter_var($params['obj']['keyword'], FILTER_SANITIZE_STRING);
                $standardType = filter_var($params['obj']['standardType'], FILTER_SANITIZE_STRING);
                $defineType = 'บังคับ';
                $stepList = ['9','11'];//[1,2,3,4,5,6,7,8,9];
                
                $CommodityStandard = [];
                $Total = 0;

                $limitRow = $limitRowPerPage - $Total;
                $_Result = CommodityStandardService::getCommodityStandardListByType($currentPage, $limitRow, $keyword, $defineType, $standardType, $stepList);
                $_CommodityStandard = $_Result['DataList'];
                $_Total = $_Result['Total'];
                foreach ($_CommodityStandard as $key => $value) {
                    // Find cancelled history
                    $replace_id = $value['standardID'];
                    $replace_title = $value['standardNameThai'];
                    $cancelled_description = '';
                    do{
                        $cancelled_data = CommodityStandardService::findCommodityStandardCancelled($replace_id);
                        if(!empty($cancelled_data)){
                            $cancelled_description .= $replace_title . ' ใช้แทน ' . $cancelled_data['standardNameThai'] . '<br>';
                            $replace_id = $cancelled_data['id_cancelled'];
                            $replace_title = $cancelled_data['standardNameThai'];
                        }

                    }while(!empty($cancelled_data));
                    $value['cancelled_data'] = $cancelled_description;
                    array_push($CommodityStandard, $value);
                }
                $Total += $_Total;

                $Total = ceil($Total / $limitRowPerPage);
                $this->data_result['DATA']['CommodityStandard'] = $CommodityStandard;
                $this->data_result['DATA']['Total'] = $Total;
                $this->data_result['DATA']['standardIDToIgnore'] = $standardIDToIgnore;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListAcademicBoard($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $currentPage = filter_var($params['obj']['currentPage'], FILTER_SANITIZE_NUMBER_INT);
                $limitRowPerPage = filter_var($params['obj']['limitRowPerPage'], FILTER_SANITIZE_NUMBER_INT);
                
                $AcademicBoard = [];
                $Total = 0;

                $limitRow = $limitRowPerPage - $Total;
                $_Result = CommodityStandardService::getListAcademicBoard($currentPage, $limitRow);
                $_AcademicBoard = $_Result['DataList'];
                $_Total = $_Result['Total'];
                foreach ($_AcademicBoard as $key => $value) {
                    array_push($AcademicBoard, $value);
                }
                $Total += $_Total;

                $Total = ceil($Total / $limitRowPerPage);
                $this->data_result['DATA']['AcademicBoard'] = $AcademicBoard;
                $this->data_result['DATA']['Total'] = $Total;
                $this->data_result['DATA']['standardIDToIgnore'] = $standardIDToIgnore;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getData($request, $response, $args){
            try{
            	$params = $request->getParsedBody();
            	$id = $params['obj']['id'];
                $_CommodityStandard = CommodityStandardService::getCommodityStandard($id);
                $_Commodity_Keywords_TH = CommodityStandardService::getCommodityKeywords($id, 'TH');
                $_Commodity_Keywords_EN = CommodityStandardService::getCommodityKeywords($id, 'EN');

                $this->data_result['DATA']['CommodityStandard'] = $_CommodityStandard;
                $this->data_result['DATA']['Commodity_Keywords_TH'] = $_Commodity_Keywords_TH;
                $this->data_result['DATA']['Commodity_Keywords_EN'] = $_Commodity_Keywords_EN;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getDataAPI($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $RequestDescription = $params['obj']['RequestDescription'];
                $RequestName = $RequestDescription['RequestName'];

                $_CommodityStandard = CommodityStandardService::getListAPI();
                
                // Update caller
                // $RequestName = 'test';
                $caller['caller_name'] = $RequestName;
                $caller['api_called'] = '-';
                CommodityStandardService::updateAPICaller($caller);
                
                $this->data_result['DATA']['CommodityStandard'] = $_CommodityStandard;
                

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateData($request, $response, $args){
            
            $_WEB_FILE_PATH = 'files/files';

            try{
                // error_reporting(E_ERROR);
                // error_reporting(E_ALL);
                // ini_set('display_errors','On');
                $params = $request->getParsedBody();

                // print_r($params);exit;
                $_CommodityStandard = $params['obj']['Commodity_Standards']; 
                $_Commodity_Keywords_TH = $params['obj']['Commodity_Keywords_TH']; 
                $_Commodity_Keywords_EN = $params['obj']['Commodity_Keywords_EN']; 
                foreach ($_CommodityStandard as $key => $value) {
                    if($value == 'null'){
                        $_CommodityStandard[$key] = NULL;
                    }
                }
                $files = $request->getUploadedFiles();
                $f = $files['obj']['AttachFile'];
                // print_r($f);
                // exit;
                if($f != null){
                    if($f->getClientFilename() != ''){
                        // Unset old image if exist
                        
                        $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/commodity-standard/'.$FileName;
                        
                        $_CommodityStandard['standardFileName'] = $f->getClientFilename();
                        $_CommodityStandard['standardFilePath'] = $FilePath;
                        
                        $f->moveTo('../../' . $FilePath);
                    }        
                }


                $f = $files['obj']['AttachFileEN'];
                if($f != null){
                    if($f->getClientFilename() != ''){
                        // Unset old image if exist
                        
                        $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/commodity-standard/'.$FileName;
                        
                        $_CommodityStandard['standardFileNameEN'] = $f->getClientFilename();
                        $_CommodityStandard['standardFilePathEN'] = $FilePath;
                        
                        $f->moveTo('../../' . $FilePath);
                    }        
                }

                $id = CommodityStandardService::updateCommodityStandard($_CommodityStandard);
                foreach($_Commodity_Keywords_TH as $k => $v){
                	$v['standardID'] = $id;
                	unset($v['$hashKey']);
                	CommodityStandardService::updateCommodityKeyword($v);
                }
                foreach($_Commodity_Keywords_EN as $k => $v){
                	$v['standardID'] = $id;
                	unset($v['$hashKey']);
                	CommodityStandardService::updateCommodityKeyword($v);
                }

                // UPdate when cancelled
                if($_CommodityStandard['step'] == '10' && !empty($params['obj']['ID_Replaced'])){

                    $id_replaced = $params['obj']['ID_Replaced']; 
                    $cancelled_data = [];
                    $cancelled_data['id_cancelled'] = $id;
                    $cancelled_data['id_replaced'] = $id_replaced;
                    CommodityStandardService::updateCommodityStandardCancelled($cancelled_data);
                }

                $this->data_result['DATA']['standardID'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    }