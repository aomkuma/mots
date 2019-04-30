<?php  

namespace App\Model;
class MenuFavourite extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Menu_Favourite';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'menu_id'
  							, 'email'
  							, 'menu_count'
  						);
    
}