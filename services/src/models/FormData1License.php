<?php  

namespace App\Model;
class FormData1License extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Form_Data1_License';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'form_data1_id'
  							, 'license_no'
  							, 'file_name'
  							, 'file_path'
                , 'start_date'
                , 'end_date'
  						);
    
    public function formData1StandardChecked()
    {
      return $this->hasMany('App\Model\FormData1StandardChecked', 'license_id');
    }
}