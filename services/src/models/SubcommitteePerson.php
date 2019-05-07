<?php  

namespace App\Model;
class SubcommitteePerson extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Subcommittee_Person';
  	protected $primaryKey = 'subcommitteePersonID';
  	public $timestamps = false;
  	protected $fillable = array('subcommitteePersonID'
  							, 'subcommitteeID'
  							, 'stakeholderID'
  							, 'positionName'
  						);
  	
}