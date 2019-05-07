<?php  

namespace App\Model;
class UserAccount extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'User_Account';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'username'
                , 'password'
                , 'firstname'
                , 'lastname'
                , 'position'
                , 'org'
                , 'tel'
                , 'email'
                , 'role'
                , 'actives'
                , 'create_date'
                , 'update_date'
              );
}