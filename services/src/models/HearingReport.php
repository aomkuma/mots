<?php  

namespace App\Model;
class HearingReport extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Hearing_Report';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'firstname'
                , 'lastname'
                , 'service_type'
                , 'gender'
                , 'age'
                , 'visit_website_time'
                , 'total_visit'
                , 'time_visit'
                , 'color_font_size'
                , 'picture_symbol'
                , 'group_data'
                , 'external_link'
                , 'user_friendly'
                , 'up_to_date'
                , 'correction'
                , 'attractive'
                , 'clarity'
                , 'speed_data'
                , 'benefit'
                , 'comment'
                , 'create_date'
              );
    public function hearingReportDetail()
    {
        return $this->hasMany('App\Model\HearingReportDetail', 'hearing_report_id');
    }
    
}