<?php  

namespace App\Model;
class FormData1ProductInspect extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Form_Data1_Product_Inspect';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'standard_id'
  							, 'inspect_name'
  							
  						);
}