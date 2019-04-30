<?php  

namespace App\Model;
class MainContent extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Main_Content';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'contents'
  							, 'order_no'
  						);
    
}