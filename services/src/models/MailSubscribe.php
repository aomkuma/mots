<?php  

namespace App\Model;
class MailSubscribe extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Mail_Subscribe';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'email'
  							, 'actives'
  							, 'create_date'
  						);

}