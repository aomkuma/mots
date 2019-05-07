<?php

    namespace App\Controller;
    
    use App\Service\HearingReportService;
    
    class HearingReportController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        
        public function getWebsiteSurveyList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                //$emailID = $params['obj']['emailID'];
                $condition = $params['obj']['condition'];
                
                if(!empty($condition['months']) && !empty($condition['years'])){
                    $date_from = $condition['years'] . '-' . str_pad($condition['months'], 2, '0', STR_PAD_LEFT) . '-01'; 
                    $maxDay = date('t', strtotime($date_from));
                    $date_to = $condition['years'] . '-' . str_pad($condition['months'], 2, '0', STR_PAD_LEFT) . '-' . $maxDay; 
                    $create_date = [$date_from, $date_to];
                }
                
                $_List = HearingReportService::getWebsiteSurveyList($create_date);

                $Result = [];
                $Result['user_friendly']['max'] = 0;
                $Result['user_friendly']['medium'] = 0;
                $Result['user_friendly']['min'] = 0;

                $Result['up_to_date']['max'] = 0;
                $Result['up_to_date']['medium'] = 0;
                $Result['up_to_date']['min'] = 0;

                $Result['correction']['max'] = 0;
                $Result['correction']['medium'] = 0;
                $Result['correction']['min'] = 0;

                $Result['clarity']['max'] = 0;
                $Result['clarity']['medium'] = 0;
                $Result['clarity']['min'] = 0;

                $Result['benefit']['max'] = 0;
                $Result['benefit']['medium'] = 0;
                $Result['benefit']['min'] = 0;
                foreach ($_List as $key => $value) {
                    if(!empty($value['user_friendly'])){
                        if($value['user_friendly'] == 'ดี'){    //, 'พอใช้', 'ควรปรับปรุง'
                            $Result['user_friendly']['max']++;
                        }else if($value['user_friendly'] == 'พอใช้'){
                            $Result['user_friendly']['medium']++;
                        }else if($value['user_friendly'] == 'ควรปรับปรุง'){
                            $Result['user_friendly']['min']++;
                        }
                    }

                    if(!empty($value['up_to_date'])){
                        if($value['up_to_date'] == 'ดี'){    //, 'พอใช้', 'ควรปรับปรุง'
                            $Result['up_to_date']['max']++;
                        }else if($value['up_to_date'] == 'พอใช้'){
                            $Result['up_to_date']['medium']++;
                        }else if($value['up_to_date'] == 'ควรปรับปรุง'){
                            $Result['up_to_date']['min']++;
                        }
                    }

                    if(!empty($value['correction'])){
                        if($value['correction'] == 'ดี'){    //, 'พอใช้', 'ควรปรับปรุง'
                            $Result['correction']['max']++;
                        }else if($value['correction'] == 'พอใช้'){
                            $Result['correction']['medium']++;
                        }else if($value['correction'] == 'ควรปรับปรุง'){
                            $Result['correction']['min']++;
                        }
                    }

                    if(!empty($value['clarity'])){
                        if($value['clarity'] == 'ดี'){    //, 'พอใช้', 'ควรปรับปรุง'
                            $Result['clarity']['max']++;
                        }else if($value['clarity'] == 'พอใช้'){
                            $Result['clarity']['medium']++;
                        }else if($value['clarity'] == 'ควรปรับปรุง'){
                            $Result['clarity']['min']++;
                        }
                    }

                    if(!empty($value['benefit'])){
                        if($value['benefit'] == 'ดี'){    //, 'พอใช้', 'ควรปรับปรุง'
                            $Result['benefit']['max']++;
                        }else if($value['benefit'] == 'พอใช้'){
                            $Result['benefit']['medium']++;
                        }else if($value['benefit'] == 'ควรปรับปรุง'){
                            $Result['benefit']['min']++;
                        }
                    }
                    
                }

                $totalComment = count($_List);
                $Result['user_friendly']['max'] = number_format(($Result['user_friendly']['max']) / $totalComment * 100, 2, '.',',');
                $Result['user_friendly']['medium'] = number_format(($Result['user_friendly']['medium']) / $totalComment * 100, 2, '.',',');
                $Result['user_friendly']['min'] = number_format(($Result['user_friendly']['min']) / $totalComment * 100, 2, '.',',');

                $Result['up_to_date']['max'] = number_format(($Result['up_to_date']['max']) / $totalComment * 100, 2, '.',',');
                $Result['up_to_date']['medium'] = number_format(($Result['up_to_date']['medium']) / $totalComment * 100, 2, '.',',');
                $Result['up_to_date']['min'] = number_format(($Result['up_to_date']['min']) / $totalComment * 100, 2, '.',',');

                $Result['correction']['max'] = number_format(($Result['correction']['max']) / $totalComment * 100, 2, '.',',');
                $Result['correction']['medium'] = number_format(($Result['correction']['medium']) / $totalComment * 100, 2, '.',',');
                $Result['correction']['min'] = number_format(($Result['correction']['min']) / $totalComment * 100, 2, '.',',');

                $Result['clarity']['max'] = number_format(($Result['clarity']['max']) / $totalComment * 100, 2, '.',',');
                $Result['clarity']['medium'] = number_format(($Result['clarity']['medium']) / $totalComment * 100, 2, '.',',');
                $Result['clarity']['min'] = number_format(($Result['clarity']['min']) / $totalComment * 100, 2, '.',',');

                $Result['benefit']['max'] = number_format(($Result['benefit']['max']) / $totalComment * 100, 2, '.',',');
                $Result['benefit']['medium'] = number_format(($Result['benefit']['medium']) / $totalComment * 100, 2, '.',',');
                $Result['benefit']['min'] = number_format(($Result['benefit']['min']) / $totalComment * 100, 2, '.',',');

                $this->data_result['DATA']['List'] = $_List;
                $this->data_result['DATA']['Result'] = $Result;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

        public function getList($request, $response, $args){
            try{
                $params = $request->getParsedBody();
                //$emailID = $params['obj']['emailID'];
                $condition = $params['obj']['condition'];
                
                if(!empty($condition['months']) && !empty($condition['years'])){
                    $date_from = $condition['years'] . '-' . str_pad($condition['months'], 2, '0', STR_PAD_LEFT) . '-01'; 
                    $maxDay = date('t', strtotime($date_from));
                    $date_to = $condition['years'] . '-' . str_pad($condition['months'], 2, '0', STR_PAD_LEFT) . '-' . $maxDay; 
                    $create_date = [$date_from, $date_to];
                }
                
                $_List = HearingReportService::getList($create_date);

                $this->data_result['DATA']['List'] = $_List;

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
                $_Data = $params['obj']['Data'];
                foreach ($_Data as $key => $value) {
                    if($value == 'null'){
                        $_Data[$key] = '';
                    }
                }
                
                $_Chanel = $params['obj']['Chanel'];
                $_DataType = $params['obj']['DataType'];
                
                $id = HearingReportService::updateData($_Data);

                // Add HearingReport Callback
                foreach ($_Chanel as $value) {
                    $data['hearing_report_id'] = $id;
                    $data['detail_desc'] = $value;
                    $data['hearing_report_type'] = 'Chanel';
                    HearingReportService::addHearingReportDetail($data);
                }

                // Add HearingReport List
                foreach ($_DataType as $value) {
                    $data['hearing_report_id'] = $id;
                    $data['detail_desc'] = $value;
                    $data['hearing_report_type'] = 'DataType';
                    HearingReportService::addHearingReportDetail($data);
                }

                $this->data_result['DATA']['id'] = $id;

                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }

    }
