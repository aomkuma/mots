<?php  

namespace App\Model;
class FormData1 extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Form_Data1';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'menu_type'
  							, 'group_name'
  							, 'group_address'
                , 'code_number'
                , 'operator_type'
                , 'contact_name'
                , 'contact_phone'
                , 'contact_fax'
                , 'cert_number'
                , 'file_name'
                , 'file_path'
  							, 'actives'
                , 'create_date'
  							, 'update_date'
  						);

    public function formData1Detail()
    {
      return $this->hasMany('App\Model\FormData1Detail', 'form_data1_id');
    }

    public function formData1License()
    {
      return $this->hasMany('App\Model\FormData1License', 'form_data1_id');
    }

    public function formData1Scope()
    {
      return $this->hasMany('App\Model\FormData1Scope', 'form_data1_id');
    }
    
}