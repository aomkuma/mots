<?php  

namespace App\Model;
class FooterLink extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'FooterLink';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'link_type'
                , 'link_name'
                , 'link_url'
                , 'order_no'
              );
}