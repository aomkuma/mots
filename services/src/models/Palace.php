<?php  

namespace App\Model;
class Palace extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Palaces';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'prefix_name_th'
                , 'prefix_name_en'
                , 'firstname_th'
                , 'firstname_en'
                , 'lastname_th'
                , 'lastname_en'
                , 'position_th'
                , 'position_en'
                , 'position_start_date'
                , 'position_end_date'
                , 'picture_name'
                , 'picture_path'
                , 'picture_path'
                , 'update_date'
                , 'palace_type'
                , 'mission_th'
                , 'mission_en'
                , 'vision_th'
                , 'vision_en'
                , 'contact_th'
                , 'contact_en'
                , 'order_no'
                , 'actives'
              );
}