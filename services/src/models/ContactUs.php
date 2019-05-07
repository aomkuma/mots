<?php  

namespace App\Model;
class ContactUs extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'ContactUs';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'address_th'
  							, 'address_en'
  							, 'tel'
  							, 'email'
  							, 'url_google'
                , 'image_name'
                , 'image_path'
                , 'map_name'
                , 'map_path'
  							, 'update_date'
  						);
    
}