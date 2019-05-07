<?php  

namespace App\Model;
class OnlineService extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Online_Services';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'prefix'
  							, 'firstname'
  							, 'lastname'
  							, 'occupation'
  							, 'id_card'
  							, 'student_card'
                , 'work_place'
                , 'address'
                , 'province'
                , 'postcode'
                , 'tel'
                , 'email'
                , 'section'
                , 'request_description'
                , 'status'
                , 'create_date'
                , 'update_date'
  						);
    public function onlineServiceType()
    {
     return $this->hasMany('App\Model\OnlineServiceType', 'online_service_id');
    }
    
}