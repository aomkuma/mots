<?php  

namespace App\Model;
class AcademicBoard extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Academic_Boards';
  	protected $primaryKey = 'academicBoardID';
  	public $timestamps = false;
  	protected $fillable = array('academicBoardID'
  							, 'stakeholderID'
  							, 'standardID'
  							, 'createBy'
  							, 'createDate'
  							, 'updateBy'
  							, 'updateDate'
  						);

    public function stakeholders()
    {
     return $this->hasMany('App\Model\Stakeholder', 'stakeholderID');
    }
    
}