<?php  

namespace App\Model;
class NewsCategory extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'new_category';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'category_name'
  							, 'actives'
  						);
}
