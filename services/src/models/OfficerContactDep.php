<?php  

namespace App\Model;
class OfficerContactDep extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Officer_Contact_Dep';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'dep_name_th'
  							, 'dep_name_en'
  							, 'order_no'
  						);

    public function officerContactPerson()
    {
      return $this->hasMany('App\Model\OfficerContactPerson', 'dep_id');
    }
    
}