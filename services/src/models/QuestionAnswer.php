<?php  

namespace App\Model;
class QuestionAnswer extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Question_Answer';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'question_by'
  							, 'question_email'
  							, 'question_tel'
  							, 'question_desc'
  							, 'question_date'
                , 'answer_date'
                , 'answer_desc'
                , 'answer_by'
                , 'question_status'
  						);
    
}