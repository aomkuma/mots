<?php

namespace App\Controller;

use App\Service\ChartService;

class ChartController extends Controller {

    protected $logger;
    protected $db;

    public function __construct($logger, $db) {
        $this->logger = $logger;
        $this->db = $db;
    }

    public function getChart($request, $response, $args) {
        try {
            $params = $request->getParsedBody();
            //$emailID = $params['obj']['emailID'];
            $condition = $params['obj']['condition'];
            //   $years = $condition['years'];
            $Label = ['ม.ค.', 'ก.พ.', 'มี.ค.', 'ม.ย.', 'พ.ค.', 'มิ.ย.', 'ก.ค.', 'ส.ค.', 'ก.ย.', 'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.'];
            $month = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
            // Data
            $Data = [];
            foreach ($month as $m) {
                $date_from = $condition['years'] . '-' . str_pad($m, 2, '0', STR_PAD_LEFT) . '-01';
                $maxDay = date('t', strtotime($date_from));
                $date_to = $condition['years'] . '-' . str_pad($m, 2, '0', STR_PAD_LEFT) . '-' . $maxDay;
                $appeal_date = [$date_from, $date_to];
                $app = ChartService::getAppealData($appeal_date);
                $Data['app'][] = sizeof($app);
                $qa = ChartService::getQAData($appeal_date);
                $Data['qa'][] = sizeof($qa);
                $qn = ChartService::getQn($appeal_date);
                $Data['qn'][] = sizeof($qn);
                 $vi = ChartService::getVisit($appeal_date);
                $Data['vi'][] = sizeof($vi);
            }

            $this->data_result['DATA'] = $Data;

            $this->data_result['LABEL'] = $Label;



            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

}
