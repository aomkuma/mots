<?php  

namespace App\Model;
class Visitor extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Visitor';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'visitor_count'
              );
}