<?php  

namespace App\Model;
class Questionaire extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'questionaire';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	
  	protected $fillable = ['id'
  							, 'gender'
  							, 'status'
  							, 'age'
  							, 'suggestion'
  							, 'create_date'
  						];

    public function QuestionaireDetail()
    {
      return $this->hasMany('App\Model\QuestionaireDetail', 'question_id');
    }

}
