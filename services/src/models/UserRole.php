<?php  

namespace App\Model;
class UserRole extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'UserRole';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'role_name'
                , 'actives'
              );

    public function userRoleDetail()
    {
     return $this->hasMany('App\Model\UserRoleDetail', 'role_id');
    }
}