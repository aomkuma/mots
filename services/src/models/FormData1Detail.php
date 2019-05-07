<?php  

namespace App\Model;
class FormData1Detail extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Form_Data1_Detail';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'form_data1_id'
  							, 'item_no'
  							, 'iso'
  							, 'normative'
                , 'file_name'
  							, 'file_path'
                , 'start_date'
                , 'end_date'
                , 'usage_status'
  						);
    
    public function formData1Scope()
    {
      return $this->hasMany('App\Model\FormData1Scope', 'detail_id');
    }

    public function formData1StandardARC()
    {
      return $this->hasMany('App\Model\FormData1StandardARC', 'detail_id');
    }
}