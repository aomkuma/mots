<?php  

namespace App\Model;
class FreqQuestion extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Freq_Question';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'question_type'
  							, 'question_th'
  							, 'question_en'
  							, 'answer_th'
  							, 'answer_en'
                , 'actives'
                , 'order_no'
                , 'create_date'
  							, 'update_date'
  						);
    
}