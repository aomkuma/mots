<?php  

namespace App\Model;
class FormGeneratorItem extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'form_generator_item';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'form_generetor_id'
                , 'name'
                , 'type'
                , 'maxlenght'
                , 'req'
                , 'seq'
              
               
              );

   
}