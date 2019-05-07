<?php  

namespace App\Model;
class QuestionnairePerson extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Questionnaire_Person';
  	protected $primaryKey = 'questionnairePersonID';
  	public $timestamps = false;
  	protected $fillable = array('questionnairePersonID'
  							, 'questionaireID'
  							, 'stakeholderID'
  						);
  	
}