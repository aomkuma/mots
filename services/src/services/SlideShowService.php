<?php

namespace App\Service;

use App\Model\SlideShow;
use Illuminate\Database\Capsule\Manager as DB;

class SlideShowService {

    public static function getSlideShow() {
        return SlideShow::
                        //->orderBy('order_no', 'ASC')
                        orderBy('id', 'ASC')
                        ->get();
    }

    public static function getSlideShowView($number=0) {
        $currentDate = date('Y-m-d');
        $actives = 'Y';
        return SlideShow::
                        where(function($query) use ( $actives, $currentDate) {

                            if (!empty($actives)) {
                                $query->where('actives', $actives);
                            }

                            if (!empty($currentDate)) {
                                $query->where('start_date', '<=', $currentDate);
                                $query->where('end_date', '>=', $currentDate);
                            }
                        })
                        ->orderBy('order_no', 'ASC')
                        ->orderBy('id', 'ASC')
                        ->limit($number)
                        ->get();
    }

    public static function updateSlideShow($obj) {

        $model = SlideShow::find($obj['id']);
        if (empty($model)) {
            $model = new SlideShow;
        }

        $model->contents_type = $obj['contents_type'];
        $model->file_name = $obj['file_name'];
        $model->file_path = $obj['file_path'];
        $model->text_desc = $obj['text_desc'];
        $model->order_no = $obj['order_no'];
        $model->actives = $obj['actives'];
        $model->start_date = $obj['start_date'];
        $model->end_date = $obj['end_date'];
        $model->save();
        return $model->id;
    }

    public static function removeSlideShow($id) {
        return SlideShow::find($id)->delete();
    }

}
