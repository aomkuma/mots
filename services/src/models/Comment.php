<?php  

namespace App\Model;
class Comment extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Comment';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'listening_id'
  							, 'firstname'
  							, 'lastname'
  							, 'tel'
  							, 'email'
  							, 'job'
  							, 'other_job'
  							, 'workplace'
  							, 'province'
  							, 'postcode'
  							, 'comment'
  							, 'agree_comment'
  							, 'disagree_comment'
  							, 'create_date'
  						);
    
}