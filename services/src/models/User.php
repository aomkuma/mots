<?php  

namespace App\Model;
class User extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Users';
  	protected $primaryKey = 'userID';
  	public $timestamps = false;
  	protected $fillable = array('userID'
                , 'stakeholderID'
                , 'email'
                , 'password'
                , 'actives'
                , 'createBy'
                , 'createDate'
                , 'updateBy'
                , 'updateDate'
              );
    
}