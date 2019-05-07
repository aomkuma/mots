<?php  

namespace App\Model;
class Email extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Emails';
  	protected $primaryKey = 'emailID';
  	public $timestamps = false;
  	protected $fillable = array('emailID'
                , 'email'
                , 'password'
                , 'createBy'
                , 'createDate'
                , 'updateBy'
                , 'updateDate'
              );
}