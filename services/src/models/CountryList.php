<?php  

namespace App\Model;
class CountryList extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Country_List';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'menu_type'
  							, 'org_th'
  							, 'org_en'
  							, 'country_th'
  							, 'country_en'
  							, 'standard_name'
                , 'standard_name_th'
                , 'standard_name_en'
  							, 'link_name'
  							, 'link_url'
                , 'file_name'
                , 'file_path'
                , 'release_date'
  							, 'create_date'
  							, 'update_date'
  						);
    
}