<?php  

namespace App\Model;
class OnlineServiceType extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Online_ServicesType';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'online_service_id'
  							, 'request_type'
  							, 'request_desc'
  						);
    
}