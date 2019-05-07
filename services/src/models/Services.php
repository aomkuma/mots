<?php  

namespace App\Model;
class Services extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'service';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	
  	protected $fillable = ['id'
  							, 'service_name'
  							, 'url'
  							, 'actives'
  						];

}
