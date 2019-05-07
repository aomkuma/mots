<?php  

namespace App\Model;
class Infographic extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Infographic';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'title_th'
                , 'title_en'
                , 'publishing_date'
                , 'actives'
                , 'visit_count'
                , 'update_date'
                , 'create_date'
              );

   
}    