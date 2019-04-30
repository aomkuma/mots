<?php  

namespace App\Model;
class Branch extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Branchs';
  	protected $primaryKey = 'branchID';
  	public $timestamps = false;
  	protected $fillable = array('branchID'
  							, 'branchNameThai'
  							, 'branchNameEng'
  						);
    
}