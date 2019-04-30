<?php  

namespace App\Model;
class Video extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'video';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'video_url'
  							, 'video_date'
  							, 'visit_count'
  							, 'actives'
  							, 'video_caption_th'
                , 'video_caption_en'
  							, 'video_content_th'
                , 'video_content_en'
  						);
    
}