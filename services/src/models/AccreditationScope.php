<?php  

namespace App\Model;
class AccreditationScope extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Accreditation_Scopes';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'val'
  						);
    
}