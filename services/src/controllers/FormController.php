<?php

namespace App\Controller;

use App\Service\FormGeneratorService;

class FormController extends Controller {

    protected $logger;
    protected $db;

    public function __construct($logger, $db) {
        $this->logger = $logger;
        $this->db = $db;
    }

    public function getList($request, $response, $args) {
        try {
            $params = $request->getParsedBody();


            $Data = FormGeneratorService::getList();
            $this->data_result['DATA'] = $Data;



            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

    public function save($request, $response, $args) {

        try {
            // error_reporting(E_ERROR);
            // error_reporting(E_ALL);
            // ini_set('display_errors','On');
            $params = $request->getParsedBody();
            $_Data = $params['obj']['Data'];
            $_Detail = $params['obj']['FileList'];


         
          
            $id = FormGeneratorService::update($_Data);

            foreach ($_Detail as $key => $item) {
                 print_r($item);
                $iddetail = FormGeneratorService::updateDetail($item, $id, $key);
                if(sizeof($item['value'])>0){
                    foreach ($item['value'] as $val){
                         
                        $idval=FormGeneratorService::updatevalue($val, $iddetail);
                    }
                    
                }
            }

            $this->data_result['DATA']['id'] = $id;

            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

    public function deleteData($request, $response, $args) {

        try {
            $params = $request->getParsedBody();
            $id = $params['obj']['id'];

            $result = FormGeneratorService::removeData($id);

            $this->data_result['DATA']['result'] = $result;

            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

    public function getListdetail($request, $response, $args) {

        try {
            $params = $request->getParsedBody();
            $id = $params['obj']['id'];
         
            $form = FormGeneratorService::getData($id);
            $item = FormGeneratorService::getdetail($id);
            foreach ($item as $key=>$data){
                if($data['type']!='text'){
                    print_r($data);
                    $item[$key]['value']=FormGeneratorService::getvaue($data['id']);
                }
            }
      
            $this->data_result['DATA']['form'] = $form;
            $this->data_result['DATA']['item'] = $item;
        
            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

}
