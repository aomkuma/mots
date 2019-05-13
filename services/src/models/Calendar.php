<?php  

namespace App\Model;
class Calendar extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'calendar';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'start_date'
                , 'end_date'
                , 'activity'
                , 'name'
                , 'description'
                , 'color'
              
               
              );

 
}