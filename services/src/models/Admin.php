<?php  

namespace App\Model;
class Admin extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Admin_Users';
  	protected $primaryKey = 'adminID';
  	public $timestamps = false;
  	protected $fillable = array('adminID'
                , 'adminType'
                , 'name'
                , 'lastName'
                , 'position'
                , 'department'
                , 'phone'
                , 'email'
                , 'password'
                , 'createBy'
                , 'createDate'
                , 'updateBy'
                , 'updateDate'
              );
}