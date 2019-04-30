<?php  

namespace App\Model;
class Purchase extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Purchase';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'page_type'
                , 'org_th'
                , 'org_en'
                , 'office_th'
                , 'office_en'
                , 'project_th'
                , 'project_en'
                , 'item_no'
                , 'project_no'
                , 'change_desc_th'
                , 'change_desc_en'
                , 'auction_place_th'
                , 'auction_place_en'
                , 'winning_name_th'
                , 'winning_name_en'
                , 'winning_reason_th'
                , 'winning_reason_en'
                , 'budget_limit'
                , 'main_price'
                , 'estimate_date'
                , 'release_date'
                , 'actives'
                , 'echo_status'
                , 'create_by'
                , 'update_by'
                , 'create_date'
                , 'update_date'
              );

   
}