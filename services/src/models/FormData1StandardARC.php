<?php  

namespace App\Model;
class FormData1StandardARC extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Form_Data1_StandardARC';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'detail_id'
  							, 'arc_name'
  						);
    
    
}