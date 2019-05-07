<?php  

namespace App\Model;
class APICaller extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Api_Caller';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'caller_name'
  							, 'api_called'
  							, 'call_datetime'
  						);
}
