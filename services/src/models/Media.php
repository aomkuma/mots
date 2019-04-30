<?php  

namespace App\Model;
class Media extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Media';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'title_th'
                , 'title_en'
                , 'content_th'
                , 'content_en'
                , 'file_name'
                , 'file_path'
                , 'file_type'
                , 'visit_count'
                , 'actives'
                , 'create_date'
                , 'update_date'
              );

}