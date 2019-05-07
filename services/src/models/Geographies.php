<?php  

namespace App\Model;
class Geographies extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Geographies';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'name'
              );
}