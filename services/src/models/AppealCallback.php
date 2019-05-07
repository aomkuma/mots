<?php  

namespace App\Model;
class AppealCallback extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Appeal_Callback';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'appeal_id'
                , 'callback_name'
                );
}