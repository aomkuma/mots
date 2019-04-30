<?php  

namespace App\Model;
class LicenseRegister extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'License_Register';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'reference'
  							, 'name'
  							, 'idcard'
  							, 'email'
  							, 'tel'
  							, 'check_name'
  							, 'check_address'
                , 'description'
                , 'file_name'
                , 'file_path'
                , 'status'
                , 'approve_description'
                , 'create_date'
                , 'update_date'
  						);
    
}