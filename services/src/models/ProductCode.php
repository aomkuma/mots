<?php  

namespace App\Model;
class ProductCode extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Product_Code';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'product_th'
                , 'product_en'
                , 'code'
                , 'product_type'
                , 'product_subtype'
                , 'create_date'
                , 'update_date'
              );

}