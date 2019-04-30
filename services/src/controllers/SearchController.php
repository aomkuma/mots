<?php

    namespace App\Controller;
    
    use App\Service\NewsService;
    use App\Service\PurchaseService;
    use App\Service\AttachFileService;
    use App\Service\CommodityStandardService;

    class SearchController extends Controller {
        
        protected $logger;
        protected $db;
        
        public function __construct($logger, $db){
            $this->logger = $logger;
            $this->db = $db;
        }

        public function search($request, $response, $args){
            try{

                $params = $request->getParsedBody();
                $keyword = $params['obj']['keyword']; 
                
                $SearchResult = [];
                $CommodityStandardResult = CommodityStandardService::searchCommodityStandard($keyword);
                foreach ($CommodityStandardResult as $key => $value) {
                    $value['title_th'] = $value['standardNameThai'];
                    $value['url'] = '#/standard-commodity/search';
                    array_push($SearchResult, $value);
                }

                $NewsResult = NewsService::searchNews($keyword);
                foreach ($NewsResult as $key => $value) {
                    $value['title_th'] = $value['project_th'];
                    $value['url'] = '#/news/detail/' . $value['id'];
                    array_push($SearchResult, $value);
                }

                $PurchaseResult = PurchaseService::searchPurchase($keyword);
                foreach ($PurchaseResult as $key => $value) {
                    $value['title_th'] = $value['prefix_name_th']. $value['firstname_th'] . ' ' . $value['lastname_th'];
                    $value['url'] = '#/palace';
                    array_push($SearchResult, $value);
                }

                $PolicyResult = AttachFileService::searchAttachFile($keyword);
                foreach ($PolicyResult as $key => $value) {
                    $value['title_th'] = (!empty($value['display_name'])?$value['display_name']:$value['file_name']);
                    $value['url'] = $value['file_path'];
                    array_push($SearchResult, $value);
                }

                $this->data_result['DATA'] = $SearchResult;
                
                return $this->returnResponse(200, $this->data_result, $response, false);
                
            }catch(\Exception $e){
                return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
            }
        }
    
    }