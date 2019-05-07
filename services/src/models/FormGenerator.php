<?php  

namespace App\Model;
class FormGenerator extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'form_generator';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'form_name'
                , 'start_date'
                , 'end_date'
                , 'create_date'
                , 'email'
                , 'description'
              
               
              );

   
}