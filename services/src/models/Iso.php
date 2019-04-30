<?php  

namespace App\Model;
class Iso extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Iso';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'iso_type'
                , 'iso_name'
              );

}