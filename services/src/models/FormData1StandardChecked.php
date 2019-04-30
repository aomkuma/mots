<?php  

namespace App\Model;
class FormData1StandardChecked extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Form_Data1_Standard_Checked';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'license_id'
  							, 'standard_name'
  							
  						);
    
    public function formData1ProductInspect()
    {
      return $this->hasMany('App\Model\FormData1ProductInspect', 'standard_id');
    }
}