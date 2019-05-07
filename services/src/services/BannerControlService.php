<?php

namespace App\Service;

use App\Model\BannerControl;
use Illuminate\Database\Capsule\Manager as DB;

class BannerControlService {

    public static function getControl() {
        return BannerControl::get()->first();
    }

    public static function updateControl($obj) {
        if (empty($obj['id'])) {
            $model = BannerControl::create($obj);
            $model->shownumber = $obj['shownumber'];
            $model->type = $obj['type'];
            $model->delay = $obj['delay'];
            return $model->id;
        } else {
            BannerControl::where('id', $obj['id'])->update($obj);
            return $obj['id'];
        }
    }

    public static function removeControl($id) {
        return BannerControl::find($id)->delete();
    }

}
