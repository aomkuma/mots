<?php

namespace App\Service;

use App\Model\QuestionAnswer;
use App\Model\Appeal;
use App\Model\Questionaire;
use App\Model\Visitor;
use Illuminate\Database\Capsule\Manager as DB;

class ChartService {

    public static function getAppealData($appeal_date) {
       
        return Appeal::where(function($query) use ($appeal_date) {
                            if (!empty($appeal_date)) {
                                $query->whereBetween('create_date', $appeal_date);
                            }
                        })
                        ->get()
                        ->toArray()
        ;
    }
    public static function getQAData($date) {
       
        return QuestionAnswer::where(function($query) use ($date) {
                            if (!empty($date)) {
                                $query->whereBetween('question_date', $date);
                            }
                        })
                        ->get()
                        ->toArray()
        ;
    }
     public static function getQn($date) {
       
        return Questionaire::where(function($query) use ($date) {
                            if (!empty($date)) {
                                $query->whereBetween('create_date', $date);
                            }
                        })
                        ->get()
                        ->toArray()
        ;
    }
     public static function getVisit($date) {
       
        return Visitor::where(function($query) use ($date) {
                            if (!empty($date)) {
                                $query->whereBetween('date', $date);
                            }
                        })
                        ->get()
                        ->toArray()
        ;
    }

}
