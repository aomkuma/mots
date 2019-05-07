<?php  

namespace App\Model;
class MeetingResult extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Meeting_Result';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'meeting_type'
  							, 'meeting_name_th'
  							, 'meeting_name_en'
                , 'times'
  							, 'meeting_start_date'
  							, 'meeting_end_date'
                , 'meeting_place_th'
                , 'meeting_place_en'
                , 'essence_th'
                , 'essence_en'
                , 'file_name_th'
                , 'file_path_th'
                , 'file_name_en'
                , 'file_path_en'
  							, 'create_date'
  							, 'update_date'
  						);
    
}