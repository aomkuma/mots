<?php  

namespace App\Model;
class Listening extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Listening';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'listening_type'
  							, 'title_th'
  							, 'title_en'
  							, 'content_th'
  							, 'content_en'
  							, 'start_date'
                , 'end_date'
                , 'create_date'
                , 'update_date'
                , 'actives'
  						);
    
}