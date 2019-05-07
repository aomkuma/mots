<?php

    namespace App\Controller;
    
    use App\Service\FormData1Service;

    class FormData1Controller extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $condition = $params['obj']['condition'];
                $iso = $params['obj']['condition']['iso'];
                $keyword = $params['obj']['condition']['keyword'];
                $menu_type = $params['obj']['menu_type'];

// print_r($condition);
//             exit;
                $_List = FormData1Service::getList($menu_type, $keyword, $iso, $condition);

                $this->data_result['DATA']['List'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListOperator($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $keyword = $params['obj']['condition']['keyword'];
                $operator_type = $params['obj']['operator_type'];
                
                $_List = FormData1Service::getListOperator($keyword, $operator_type);

                $this->data_result['DATA']['List'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListCustomer($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $keyword = $params['obj']['condition']['keyword'];
                
                $_List = FormData1Service::getListCustomer($keyword);

                $this->data_result['DATA']['List'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getListIso($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $type = $params['obj']['type'];

                if(!empty($type)){
                    $_List = FormData1Service::getListIso('');    

                    $this->data_result['DATA']['List'] = $_List;
                }else{
                    $_List1 = FormData1Service::getListIso('ISO');
                    $_List2 = FormData1Service::getListIso('ขอบข่าย');
                    $_List3 = FormData1Service::getListIso('ขอบข่ายย่อย');    

                    $this->data_result['DATA']['List1'] = $_List1;
                    $this->data_result['DATA']['List2'] = $_List2;
                    $this->data_result['DATA']['List3'] = $_List3;
                }
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
                
                $_Data = FormData1Service::getData($id);

                $this->data_result['DATA'] = $_Data;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getCustomerData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
                
                $_Data = FormData1Service::getCustomerData($id);

                $this->data_result['DATA'] = $_Data;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getOperatorData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
                
                $_Data = FormData1Service::getOperatorData($id);

                $this->data_result['DATA'] = $_Data;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateIso($request, $response, $args){
            try{
                // error_reporting(E_ERROR);
                // error_reporting(E_ALL);
                // ini_set('display_errors','On');
                $params = $request->getParsedBody();
                $ISO = $params['obj']['ISO'];

                $id = FormData1Service::updateIso($ISO);
                
                $this->data_result['DATA']['id'] = $id;

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

                $upload_files = $request->getUploadedFiles();
                $upload_files = $upload_files['obj']['form_data1_detail'];
                // print_r($files);
                // exit;
                $FormData1 = $params['obj']['FormData1'];
                $page_type = $FormData1['menu_type'];
                $form_data1_detail = $params['obj']['form_data1_detail'];
                // $form_data1_detail = $params['obj']['form_data1_scope'];
                // $form_data1_sub_scope = $params['obj']['form_data1_sub_scope'];
                // $form_data1_certification = $params['obj']['form_data1_certification'];

                $user_session = $params['user_session'];
                unset($FormData1['form_data1_detail']);
                unset($FormData1['$hashKey']);

                foreach ($FormData1 as $key => $value) {
                    if($value == 'null'){
                        $FormData1[$key] = '';
                    }
                }

                $form_data1_id = FormData1Service::updateData($FormData1);

                $cnt = 0;
                foreach ($form_data1_detail as $key => $value) {

                    // Update attach file
                    //$files = $request->getUploadedFiles();
                    $f = $upload_files[$cnt]['AttachFile'];
                    // print_r($f);
                    // exit;
                    if($f != null){
                        if($f->getClientFilename() != ''){
                            $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                            $FileName = $form_data1_id . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                            $FilePath = $_WEB_FILE_PATH . '/form-data1/'.$FileName;

                            $value['file_name'] = $FileName;
                            $value['file_path'] = $FilePath;
                            // print_r($AttachFile);exit;
                            
                            $f->moveTo('../../' . $FilePath);
                            
                        }
                    }

                    $Scope = $value['form_data1_scope'];
                    $StandardARC = $value['form_data1_standard_a_r_c'];
                    
                    unset($value['form_data1_scope']);
                    unset($value['form_data1_standard_a_r_c']);
                    unset($value['form_data1_standard_a_r_c']);
                    unset($value['open_start_date']);
                    unset($value['open_end_date']);
                    unset($value['$hashKey']);

                    $value['form_data1_id'] = $form_data1_id;
                    $detail_id = FormData1Service::updateDetail($value);

                    foreach ($Scope as $key1 => $value1) {
                        
                        $SubScope = $value1['form_data1_sub_scope'];
                        unset($value1['form_data1_sub_scope']);

                        $Certification = $value2['form_data1_certification'];
                        unset($value1['form_data1_certification']);

                        $value1['detail_id'] = $detail_id;
                        $value1['form_data1_id'] = $form_data1_id;
                        unset($value1['$hashKey']);
                        $scope_id = FormData1Service::updateScope($value1);

                        foreach ($SubScope as $key2 => $value2) {
                            
                            $value2['scope_id'] = $scope_id;
                            unset($value2['$hashKey']);
                            $subscope_id = FormData1Service::updateSubScope($value2);

                        }

                        foreach ($Certification as $key2 => $value2) {
                            
                            $value2['scope_id'] = $scope_id;
                            unset($value2['$hashKey']);
                            $certification_id = FormData1Service::updateCertification($value2);

                        }
                    }

                    // Update Standard ARC
                    foreach ($StandardARC as $key1 => $value1) {
                        $value1['detail_id'] = $detail_id;
                        unset($value1['$hashKey']);
                        $standardARC_id = FormData1Service::updateStandardARC($value1);
                    }
                    
                    $cnt++;

                }

                $this->data_result['DATA']['form_data1_id'] = $form_data1_id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateOperatorData($request, $response, $args){
            
            $_WEB_FILE_PATH = 'files/files';

            try{
                // error_reporting(E_ERROR);
                // error_reporting(E_ALL);
                // ini_set('display_errors','On');
                $params = $request->getParsedBody();

                $upload_files = $request->getUploadedFiles();
                $FormData1_file = $upload_files['obj']['FormData1']['AttachFile'];
                $upload_files = $upload_files['obj']['FormData1License'];
                
                // print_r($FormData1_file);
                // exit;
                $FormData1 = $params['obj']['FormData1'];
                $page_type = 'operator-list';
                $FormData1License = $params['obj']['FormData1License'];
                
                $user_session = $params['user_session'];

                $f = $FormData1_file;
                if($f != null){
                    if($f->getClientFilename() != ''){
                        $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = $form_data1_id . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/form-data1/'.$FileName;

                        $FormData1['file_name'] = $FileName;
                        $FormData1['file_path'] = $FilePath;
                        // print_r($AttachFile);exit;
                        
                        $f->moveTo('../../' . $FilePath);
                        
                    }
                }
                
                unset($FormData1['form_data1_license']);
                unset($FormData1['form_data1_scope']);
                
                $form_data1_id = FormData1Service::updateData($FormData1);

                $cnt = 0;
                foreach ($FormData1License as $key => $value) {

                    // Update attach file
                    //$files = $request->getUploadedFiles();
                    $f = $upload_files[$cnt]['AttachFile'];
                    // print_r($f);
                    // exit;
                    if($f != null){
                        if($f->getClientFilename() != ''){
                            $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                            $FileName = $form_data1_id . '_' . date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                            $FilePath = $_WEB_FILE_PATH . '/form-data1/'.$FileName;

                            $value['file_name'] = $FileName;
                            $value['file_path'] = $FilePath;
                            // print_r($AttachFile);exit;
                            
                            $f->moveTo('../../' . $FilePath);
                            
                        }
                    }

                    $StandardChecked = $value['FormData1StandardChecked'];
                    unset($value['FormData1StandardChecked']);
                    

                    $value['form_data1_id'] = $form_data1_id;
                    $license_id = FormData1Service::updateLicense($value);

                    foreach ($StandardChecked as $key1 => $value1) {
                        
                        $ProductInspect = $value1['FormData1ProductInspect'];
                        unset($value1['FormData1ProductInspect']);

                        $value1['license_id'] = $license_id;
                        $standard_id = FormData1Service::updateStandardChecked($value1);

                        foreach ($ProductInspect as $key2 => $value2) {
                            
                            $value2['standard_id'] = $standard_id;
                            $subscope_id = FormData1Service::updateProductInspect($value2);

                        }

                    }

                    $cnt++;

                }

                $form_data1_scope = $params['obj']['form_data1_scope'];
                $cnt = 0;
                foreach ($form_data1_scope as $key => $value) {

                    $SubScope = $value['form_data1_sub_scope'];
                    unset($value['form_data1_sub_scope']);
                    
                    $value['form_data1_id'] = $form_data1_id;

                    $scope_id = FormData1Service::updateScope($value);

                    foreach ($SubScope as $key2 => $value2) {
                        
                        $value2['scope_id'] = $scope_id;
                        $subscope_id = FormData1Service::updateSubScope($value2);

                    }
                }                

                $this->data_result['DATA']['form_data1_id'] = $form_data1_id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function updateCustomerData($request, $response, $args){
            
            $_WEB_FILE_PATH = 'files/files';

            try{
                // error_reporting(E_ERROR);
                // error_reporting(E_ALL);
                // ini_set('display_errors','On');
                $params = $request->getParsedBody();

                // print_r($FormData1_file);
                // exit;
                $FormData1 = $params['obj']['FormData1'];
                $page_type = 'customer-list';
                
                $user_session = $params['user_session'];

                unset($FormData1['form_data1_scope']);
                
                $form_data1_id = FormData1Service::updateData($FormData1);
                
                $form_data1_scope = $params['obj']['form_data1_scope'];
                $cnt = 0;
                foreach ($form_data1_scope as $key => $value) {

                    $SubScope = $value['form_data1_sub_scope'];
                    unset($value['form_data1_sub_scope']);
                    unset($value['$hashKey']);
                    $value['form_data1_id'] = $form_data1_id;

                    $scope_id = FormData1Service::updateScope($value);

                    foreach ($SubScope as $key2 => $value2) {
                        
                        $value2['scope_id'] = $scope_id;
                        unset($value2['$hashKey']);
                        // print_r($value2);
                        $subscope_id = FormData1Service::updateSubScope($value2);

                    }
                }                
                // exit;
                $this->data_result['DATA']['form_data1_id'] = $form_data1_id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteData($request, $response, $args){
            
            try{
                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
                
                $result = FormData1Service::removeData($id);

                $this->data_result['DATA']['result'] = $result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    }