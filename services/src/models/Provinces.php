<?php  

namespace App\Model;
class Provinces extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Provinces';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'code'
                , 'name_th'
                , 'name_en'
                , 'geography_id'
              );
}