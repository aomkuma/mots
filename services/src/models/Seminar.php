<?php  

namespace App\Model;
class Seminar extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Seminar';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'page_type'
                , 'title_th'
                , 'title_en'
                , 'content_th'
                , 'content_en'
                , 'schedule_filename_th'
                , 'schedule_filepath_th'
                , 'schedule_filename_en'
                , 'schedule_filepath_en'
                , 'start_date'
                , 'end_date'
                , 'accommodation'
                , 'participant_filename_th'
                , 'participant_filepath_th'
                , 'participant_filename_en'
                , 'participant_filepath_en'
                , 'actives'
                , 'create_date'
                , 'update_date'
              );

    public function responseList()
    {
     return $this->hasMany('App\Model\SeminarResponseList', 'seminar_id');
    }
}