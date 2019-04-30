<?php  

namespace App\Model;
class BudgetDisbursementItem extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Budget_Disbursement_Item';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'budget_id'
                , 'item'
                , 'staff'
                , 'operating'
                , 'investing'
                , 'subsidy'
                , 'other'
                , 'subtotal'
              );
}