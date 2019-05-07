<?php  

namespace App\Model;
class AppealList extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Appeal_List';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'appeal_id'
                , 'appeal_text'
                );
}