<?php  

namespace App\Model;
class UserRoleDetail extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'UserRole_Detail';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'role_id'
                , 'menu_id'
                , 'actives'
              );
}