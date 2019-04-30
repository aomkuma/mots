<?php  

namespace App\Model;
class Stakeholder extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Stakeholders';
  	protected $primaryKey = 'stakeholderID';
  	public $timestamps = false;
  	protected $fillable = array('stakeholderID'
  							, 'nameThai'
  							, 'lastNameThai'
  							, 'nameEng'
  							, 'lastNameEng'
  							, 'positionThai'
  							, 'positionEng'
  							, 'responsible'
  							, 'experience'
                , 'branch'
  							, 'institution'
  							, 'address'
  							, 'phone'
  							, 'fax'
  							, 'email'
  							, 'status'
  							, 'createBy'
  							, 'createDate'
  							, 'updateBy'
  							, 'updateDate'
  						);
  	
}