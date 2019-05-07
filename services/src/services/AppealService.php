<?php

namespace App\Service;

use App\Model\Appeal;
use App\Model\AppealList;
use App\Model\AppealCallback;
use Illuminate\Database\Capsule\Manager as DB;

class AppealService {

    public static function getList($appeal_date, $page_type) {
        return Appeal::where(function($query) use ($appeal_date) {
                            if (!empty($appeal_date)) {
                                $query->whereBetween('create_date', $appeal_date);
                            }
                        })
                        ->where('page_type', $page_type)
                        ->with('appealList')
                        ->with('appealCallback')
                        ->get();
    }

    public static function updateData($obj) {
        $obj['create_date'] = date('Y-m-d H:i:s');
        $model = Appeal::create($obj);
        return $model->id;
    }

    public static function addAppealCallback($obj) {
        $model = AppealCallback::create($obj);
        return $model->id;
    }

    public static function addAppealList($obj) {
        $model = AppealList::create($obj);
        return $model->id;
    }

    public static function callback($obj) {
        $model = Appeal::find($obj['id']);
        $model->res_description = $obj['res_description'];
        $model->res_date = $obj['res_date'];
        $model->res_status = $obj['res_status'];
        $model->res_file = $obj['res_file'];
        $model->res_name = $obj['res_name'];
         $model->save();
        return $model->id;
    }

}
