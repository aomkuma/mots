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
            print_r($id);
            exit;
            foreach ($_Detail as $item){
                $iddetail = FormGeneratorService::updateDetail($_Detail,$id); 
                
            }

            $this->data_result['DATA']['id'] = $id;

            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

}
