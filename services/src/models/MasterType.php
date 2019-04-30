<?php  

namespace App\Model;
class MasterType extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'MasterType';
  	protected $primaryKey = 'id';
  	public $timestamps = false;

  	protected $fillable = array('id'
  							, 'menu_type'
  							, 'type_name'
  							, 'actives'
  							
  						);
    
  	
}