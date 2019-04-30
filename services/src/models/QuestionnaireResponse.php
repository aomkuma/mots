<?php  

namespace App\Model;
class QuestionnaireResponse extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Questionnaire_Response';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'questionnaire_id'
                , 'q_id'
                , 'q_response'
                , 'q_response_comment'
                , 'response_by'
                , 'response_date'
                );
}