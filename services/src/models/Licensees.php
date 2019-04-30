<?php  

namespace App\Model;
class Licensees extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Licensees';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'reference'
                , 'authorized_name'
                , 'license_type'
                , 'license_status'
                , 'license_expire_date'
                , 'cert_status'
                , 'cert_expire_date'
                , 'standard_code'
                , 'office_address'
                , 'production_name'
                , 'region'
                , 'province'
                , 'production_address'
                , 'updateBy'
                , 'updateDate'
              );
}