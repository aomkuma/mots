<?php  

namespace App\Model;
class Subcommittee extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Subcommittee';
  	protected $primaryKey = 'subcommitteeID';
  	public $timestamps = false;
  	protected $fillable = array('subcommitteeID'
  							, 'subcommitteeName'
  						);

  	public function subcommitteePerson()
    {
  		return $this->hasMany('App\Model\SubcommitteePerson', 'subcommitteeID');
    }
  	
}