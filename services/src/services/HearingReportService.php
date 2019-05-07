<?php
    
    namespace App\Service;
    
    use App\Model\HearingReport;
    use App\Model\HearingReportDetail;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class HearingReportService {

        public static function getWebsiteSurveyList($create_date){
            return HearingReport::where(function($query) use ($create_date){
                        if(!empty($create_date)){
                            $query->whereBetween('create_date', $create_date);
                        }
                    })
                    ->where('report_type', 'comment')
                    ->get();
        }

    	public static function getList($create_date){
            return HearingReport::where(function($query) use ($create_date){
                        if(!empty($create_date)){
                            $query->whereBetween('create_date', $create_date);
                        }
                    })
                    ->where('report_type', 'hearing')
                    ->with("hearingReportDetail")
                    ->get();
        }

        public static function getCountReport($create_date){
            return HearingReport::where(function($query) use ($create_date){
                        if(!empty($create_date)){
                            $query->whereBetween('create_date', $create_date);
                        }
                    })
                    ->where('report_type', 'hearing')
                    ->count();
        }

        public static function getReportDataByColumn($column_name, $where_value, $create_date){
            
            return HearingReport::
                    select(
                        DB::raw($column_name ." AS " . $column_name)
                        , DB::raw("COUNT(" . $column_name . ") AS totals")
                    )
                    ->where(function($query) use ($create_date, $column_name, $where_value){
                        if(!empty($create_date)){
                            $query->whereBetween('create_date', $create_date);
                        }
                        if(!empty($where_value)){
                            $query->where($column_name, $where_value);
                        }
                    })
                    ->where('report_type', 'hearing')
                    ->groupBy($column_name)
                    ->first();
        }

        public static function getSumReportDataByColumn($column_name, $create_date){
            
            return HearingReport::
                    select(
                        DB::raw("SUM(" . $column_name . ") AS totals")
                    )
                    ->where(function($query) use ($create_date, $column_name){
                        if(!empty($create_date)){
                            $query->whereBetween('create_date', $create_date);
                        }
                    })
                    ->where('report_type', 'hearing')
                    // ->groupBy($column_name)
                    ->first();
        }

        public static function getReportDetailDataByColumn($where_value, $detail_type, $create_date){
            
            return HearingReport::
                    select(
                        DB::raw("COUNT(detail_desc) AS totals")
                    )
                    ->join("Hearing_Report_Detail", "Hearing_Report.id", '=', "Hearing_Report_Detail.hearing_report_id")
                    ->where(function($query) use ($create_date, $detail_type, $where_value){
                        if(!empty($create_date)){
                            $query->whereBetween('create_date', $create_date);
                        }
                        if(!empty($where_value)){
                            $query->where('detail_desc', $where_value);
                        }
                        $query->where('hearing_report_type', $detail_type);
                    })
                    ->where('report_type', 'hearing')
                    ->groupBy('detail_desc')
                    ->first();
        }

        public static function updateData($obj){
            $obj['create_date'] = date('Y-m-d H:i:s');
            $model = HearingReport::create($obj);
            return $model->id;
        
        }


        public static function addHearingReportDetail($obj){
            $model = HearingReportDetail::create($obj);
            return $model->id;
        }

    }
