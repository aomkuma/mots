<?php

namespace App\Service;

use App\Model\Calendar;
use Illuminate\Database\Capsule\Manager as DB;

class CalendarService {

    public static function getList() {
        return Calendar::orderBy('id', 'DESC')
                        ->get();
    }

}
