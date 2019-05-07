<?php

namespace App\Service;

use App\Model\FormGenerator;
use App\Model\FormGeneratorItem;
use Illuminate\Database\Capsule\Manager as DB;

class FormGeneratorService {

    public static function getList() {
        return FormGenerator::orderBy('id', 'DESC')
                        ->get();
    }

    public static function update($obj) {

        $model = FormGenerator::find($obj['id']);
        if (empty($model)) {
            $model = new FormGenerator;
        }
        print_r($obj);
        // $model->update_date = date('Y-m-d H:i:s');
        $model->form_name = $obj['form_name'];
        $model->start_date = $obj['start_date'];
        $model->end_date = $obj['end_date'];

        $model->email = $obj['email'];

        $model->save();
        return $model->id;
    }

    public static function updateDetail($obj, $id) {

        $model = FormGeneratorItem::find($obj['id']);
        if (empty($model)) {
            $model = new FormGeneratorItem;
        }
        // $model->update_date = date('Y-m-d H:i:s');
        $model->form_generator_id = $id;
        $model->name = $obj['name'];
        $model->type = $obj['type'];

        $model->maxlenght = $obj['maxlenght'];
        $model->seq = $obj['seq'];
        $model->req = $obj['req'];
        $model->save();
        return $model->id;
    }

}
