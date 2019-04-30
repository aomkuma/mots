<?php  

namespace App\Model;
class BudgetDisbursement extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Budget_Disbursement';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'fileName'
                , 'filePath'
                , 'years'
                , 'months'
                , 'orderNo'
                , 'createDate'
                , 'createBy'
              );

    public function item()
    {
     return $this->hasMany('App\Model\BudgetDisbursementItem', 'budget_id');
    }
}