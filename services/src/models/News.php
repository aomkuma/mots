<?php  

namespace App\Model;
class News extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'News';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'news_type'
  						);
    
}
