<?php  

namespace App\Model;
class SubstituteAcademicBoard extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Substitute_Academic_Boards';
  	protected $primaryKey = 'substituteID';
  	public $timestamps = false;
    protected $fillable = array('substituteID'
  							, 'academicBoardID'
  							, 'stakeholderID'
  							, 'standardID'
  						);

}