<?php  

namespace App\Model;
class FormData1SubScope extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Form_Data1_SubScope';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'scope_id'
  							, 'iso'
                , 'subscope_name'
  						);
    
    public function formData1Certification()
    {
      return $this->hasMany('App\Model\FormData1Certification', 'scope_id');
    }
}