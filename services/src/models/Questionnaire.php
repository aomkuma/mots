<?php  

namespace App\Model;
class Questionnaire extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Questionnaires';
  	protected $primaryKey = 'questionnaireID';
  	public $timestamps = false;
  	protected $fillable = array('questionnaireID'
                , 'standardID'
                , 'questionName'
                , 'fileName'
                , 'filePath'
                , 'questionnaireType'
                , 'questionnaireSubType'
                , 'subcommitteeID'
                , 'openDate'
                , 'closeDate'
                , 'createBy'
                , 'createDate'
                , 'updateBy'
                , 'updateDate'
              );

    public function questionnairePerson()
    {
      return $this->hasMany('App\Model\QuestionnairePerson', 'questionaireID');
    }

    public function question()
    {
      return $this->hasMany('App\Model\Question', 'questionaireID');
    }
}