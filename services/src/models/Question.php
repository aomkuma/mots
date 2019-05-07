<?php  

namespace App\Model;
class Question extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'question';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	
  	protected $fillable = ['id'
  							, 'question_by'
  							, 'question_date'
  							, 'question'
  							, 'question_reply'
  							, 'question_reply_date'
  							, 'question_type'
                , 'question_picked'
  						];

}
