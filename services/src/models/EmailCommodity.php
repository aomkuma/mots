<?php  

namespace App\Model;
class EmailCommodity extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Email_Commodity';
  	protected $primaryKey = 'emailCommodityID';
  	public $timestamps = false;
  	protected $fillable = array('emailCommodityID'
                , 'emailID'
                , 'standardID'
              );
}