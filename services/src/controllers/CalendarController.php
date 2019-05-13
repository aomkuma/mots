<?php

namespace App\Controller;

use App\Service\CalendarService;

class CalendarController extends Controller {

    protected $logger;
    protected $db;

    public function __construct($logger, $db) {
        $this->logger = $logger;
        $this->db = $db;
    }

     public function getList($request, $response, $args) {
        try {
            $params = $request->getParsedBody();


            $Data = CalendarService::getList();
            $this->data_result['DATA'] = $Data;

         

            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

}
