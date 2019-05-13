<?php  

namespace App\Model;
class FormData extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'FormData';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'form_generator_id'
  							, 'data_description'
  							, 'create_date'
  							, 'update_date'
  						);
}
