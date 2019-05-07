<?php  

namespace App\Model;
class OfficerContactPerson extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Officer_Contact_Person';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'dep_id'
  							, 'name_th'
  							, 'name_en'
  							, 'position_th'
  							, 'position_en'
  							, 'email'
  							, 'hotline'
  							, 'tel'
  							, 'fax'
  							, 'create_date'
  							, 'update_date'
  						);

    
    
}