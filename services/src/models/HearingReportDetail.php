<?php  

namespace App\Model;
class HearingReportDetail extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Hearing_Report_Detail';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'hearing_report_id'
  							, 'detail_desc'
  							, 'hearing_report_type'
  						);
    
}