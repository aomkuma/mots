<?php  

namespace App\Model;
class CertificationCode extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Certification_Code';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'page_type'
  							, 'operator_name_th'
  							, 'operator_name_en'
  							, 'scope_th'
                , 'scope_en'
                , 'province_th'
                , 'province_en'
                , 'standard_th'
                , 'standard_en'
                , 'auditor_th'
                , 'auditor_en'
                , 'product_th'
                , 'product_en'
                , 'accredit_stadard_th'
                , 'accredit_stadard_en'
                , 'address_th'
                , 'address_en'
                , 'farm_th'
                , 'farm_en'
                , 'status_th'
                , 'status_en'
                , 'start_date'
                , 'end_date'
  							, 'create_date'
  							, 'update_date'
  						);
    
}