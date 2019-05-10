<?php  

namespace App\Model;
class FormGeneratorValue extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'form_generator_value';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'item_id'
            
                , 'value'
               
               
              );

   
}