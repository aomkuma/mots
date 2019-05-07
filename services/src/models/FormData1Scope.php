<?php  

namespace App\Model;
class FormData1Scope extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Form_Data1_Scope';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'form_data1_id'
  							, 'detail_id'
  							, 'iso'
                , 'scope_name'
  						);
    
    public function formData1SubScope()
    {
      return $this->hasMany('App\Model\FormData1SubScope', 'scope_id');
    }
}