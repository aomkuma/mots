<?php  

namespace App\Model;
class Province extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Province';
  	protected $primaryKey = 'ProvinceID';
  	public $timestamps = false;
  	protected $fillable = array('ProvinceID'
                , 'ProvinceName'
              );
}