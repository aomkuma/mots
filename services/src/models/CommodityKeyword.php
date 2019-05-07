<?php  

namespace App\Model;
class CommodityKeyword extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Commodity_Keywords';
  	protected $primaryKey = 'keywordID';
  	public $timestamps = false;
  	protected $fillable = array('standardID'
  							, 'keywordLang'
  							, 'keyword'
  							, 'createBy'
  							, 'createDate'
  							, 'updateBy'
  							, 'updateDate'
  						);
  	// public function attachFiles()
   //  {
  	// 	return $this->hasMany('App\Model\AttachFile', 'parent_id');
   //  }
    
}
