<?php  

namespace App\Model;
class QuestionaireDetail extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'questionaire_detail';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	
  	protected $fillable = ['id'
  							, 'question_id'
  							, 'question_desc'
  							, 'points'
  						];
}