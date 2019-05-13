<?php

namespace App\Service;

use App\Model\FormGenerator;
use App\Model\FormGeneratorItem;
use App\Model\FormGeneratorValue;

use App\Model\FormData;

use Illuminate\Database\Capsule\Manager as DB;

class FormGeneratorService {

    public static function getList() {
        return FormGenerator::orderBy('id', 'DESC')
                        ->get();
    }

    public static function getdetail($id) {
        return FormGeneratorItem::where("form_generetor_id", $id)
                        ->orderBy('seq', 'ASC')
                        ->get()
                        ->toArray();
    }
 public static function getvaue($id) {
     
        return FormGeneratorValue::where("item_id", $id)
                       
                        ->get()
                        ->toArray();
    }
    public static function update($obj) {

        $model = FormGenerator::find($obj['id']);
        if (empty($model)) {
            $model = new FormGenerator;
        }

        // $model->update_date = date('Y-m-d H:i:s');
        $model->form_name = $obj['form_name'];
        $model->start_date = $obj['start_date'];
        $model->end_date = $obj['end_date'];

        $model->email = $obj['email'];
        $model->showpage = $obj['showpage'];
        $model->reply_email = $obj['reply_email'];

        $model->save();
        return $model->id;
    }

    public static function updateDetail($obj, $id, $key) {

        $model = FormGeneratorItem::find($obj['id']);
        if (empty($model)) {
            $model = new FormGeneratorItem;
        }
        // $model->update_date = date('Y-m-d H:i:s');
        $model->form_generetor_id = $id;

        $model->name = $obj['name'];
        $model->type = $obj['type'];

        $model->maxlenght = $obj['maxlenght'];
        $model->seq = $key;
        $model->req = $obj['req'];
        $model->ck_mail = $obj['ck_mail'];
        $model->save();
        return $model->id;
    }

    public static function updatevalue($obj, $id) {

        $model = FormGeneratorValue::find($obj['id']);
        if (empty($model)) {
            $model = new FormGeneratorValue;
        }
        // $model->update_date = date('Y-m-d H:i:s');
        $model->item_id = $id;

        $model->value = $obj['value'];
        

       
        $model->save();
        return $model->id;
    }

    public static function removeData($id) {
        return FormGenerator::find($id)->delete();
    }

    public static function getData($id) {
        return FormGenerator::find($id);
    }

    public static function getFormDataList($form_generator_id, $keyword) {
        return FormData::where('form_generator_id', $form_generator_id)
                    ->where(function($query) use ($keyword){
                        if(!empty($keyword)){
                            $query->where('data_description', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                        }
                    })
                    ->get();
    }

    public static function updateFormData($obj){
            if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = FormData::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                FormData::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

}
