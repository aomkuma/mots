<?php  

namespace App\Model;
class CommodityStandardCancelled extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Commodity_Standard_Cancelled';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'id_cancelled'
  							, 'id_replaced'
  						);
  	// public function attachFiles()
   //  {
  	// 	return $this->hasMany('App\Model\AttachFile', 'parent_id');
   //  }
    
}
