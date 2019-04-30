<?php

    namespace App\Controller;
    
    use App\Service\BudgetDisbursementService;
    use PhpOffice\PhpSpreadsheet\Spreadsheet;
    use PhpOffice\PhpSpreadsheet\Reader\Xlsx;

    class BudgetDisbursementController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function getList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                //$emailID = $params['obj']['emailID'];
                
                $_List = BudgetDisbursementService::getList();

                $this->data_result['DATA']['Data'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $condition = $params['obj']['condition'];
                
                $_List = BudgetDisbursementService::getData($condition);

                $this->data_result['DATA']['Data'] = $_List;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        

        public function updateData($request, $response, $args){
            $_WEB_IMAGE_PATH = 'files/img';
            $_WEB_FILE_PATH = 'files/files';
            try{
                // error_reporting(E_ERROR);
                // error_reporting(E_ALL);
                // ini_set('display_errors','On');
                $params = $request->getParsedBody();
                $_BudgetDisbursement = $params['obj']['Data'];
                $user_session = $params['user_session'];

                // Update Attach files
                $files = $request->getUploadedFiles();
                $f = $files['obj']['AttachFile'];
                // print_r($f);
                // exit;
                if($f != null){
                    if($f->getClientFilename() != ''){
                        // Unset old image if exist
                        
                        $ext = pathinfo($f->getClientFilename(), PATHINFO_EXTENSION);
                        $FileName = date('YmdHis').'_'.rand(100000,999999). '.'.$ext;
                        $FilePath = $_WEB_FILE_PATH . '/budget-disbursement/'.$FileName;
                        
                        $_BudgetDisbursement['fileName'] = $f->getClientFilename();
                        $_BudgetDisbursement['filePath'] = $FilePath;
                        
                        $f->moveTo('../../' . $FilePath);
                    }        
                }
                $_BudgetDisbursement['createBy'] = $user_session['adminID'];
                $id = BudgetDisbursementService::updateData($_BudgetDisbursement);

                // read file 
                $file = '../../' . $FilePath;
                $ItemList = $this->readExcelFile($file, $id);

                // add Items
                foreach ($ItemList as $key => $value) {
                    BudgetDisbursementService::updateItemData($value);
                }
                
                
                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function deleteData($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                $id = $params['obj']['id'];
                $result = BudgetDisbursementService::removeData($id);
                $this->data_result['DATA']['result'] = $result;
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        private function readExcelFile($file, $budget_id){

            $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($file);
            $sheetData = $spreadsheet->getActiveSheet()->toArray();

            $field_array = ['item', 'staff', 'operating', 'investing', 'subsidy', 'other', 'subtotal'];
            $cnt_row = 1;

            $ItemList = [];
            foreach ($sheetData as $key => $value) {
                
                if($cnt_row >= 4){
                    
                    $cnt_col = 0;
                    $cnt_field = 0;
                    $Item = [];
                    $Item[ 'budget_id' ] = $budget_id;

                    foreach ($value as $k => $v) {
                        if($cnt_col >= 1 && $cnt_col <= 7){
                            
                            $Item[ $field_array[$cnt_field] ] = $v;
                            $cnt_field++;
                            
                        }
                        $cnt_col++;
                    }
                    
                    array_push($ItemList, $Item);
                    
                }

                $cnt_row++;

            }
            
            return $ItemList;
        }

    
    }