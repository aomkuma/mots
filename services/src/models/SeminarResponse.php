<?php  

namespace App\Model;
class SeminarResponse extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Seminar_Response';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'seminar_id'
                , 'status'
                , 'name'
                , 'position'
                , 'organize'
                , 'tel'
                , 'mobile'
                , 'fax'
                , 'email'
                , 'file_name'
                , 'file_path'
                , 'accommodation'
                , 'start_date'
                , 'end_date'
                , 'create_date'
              );

}