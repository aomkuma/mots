<?php  

namespace App\Model;
class FormData1Certification extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Form_Data1_Certification';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'scope_id'
  							, 'certification'
  						);
    
}