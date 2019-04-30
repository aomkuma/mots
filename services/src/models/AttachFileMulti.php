<?php  

namespace App\Model;
class AttachFileMulti extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'AttachFiles_Multi';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	
  	protected $fillable = ['id'
  							, 'menu_type'
                , 'file_type'
                , 'file_date'
                , 'order_no'
  							, 'actives'
  							, 'create_date'
  							, 'update_date'
  						];

  	public function attachFiles()
    {
  		return $this->hasMany('App\Model\AttachFile', 'parent_id');
    }

}
