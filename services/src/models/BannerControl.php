<?php  

namespace App\Model;
class BannerControl extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'banner_control';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	
  	protected $fillable = ['id'
  							, 'shownumber'
  							, 'type'
  							, 'delay'
  						];

}
