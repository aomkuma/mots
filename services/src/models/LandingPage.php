<?php  

namespace App\Model;
class LandingPage extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'LandingPage';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'landing_name'
                , 'file_path'
                , 'start_date'
                , 'end_date'
                , 'actives'
              );
}