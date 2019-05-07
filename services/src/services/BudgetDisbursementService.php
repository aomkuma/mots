<?php
    
    namespace App\Service;
    
    use App\Model\BudgetDisbursement;
    use App\Model\BudgetDisbursementItem;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class BudgetDisbursementService {

    	public static function getList(){
            return BudgetDisbursement::
                    //->orderBy('order_no', 'ASC')
                    // ->orderBy('order_no', 'ASC')
                    orderBy('id', 'DESC')
            		->get();      
        }

        public static function getData($condition){
            return BudgetDisbursement::where(function($query) use ($condition){
                            
                        $query->where('years', $condition['years']);
                        $query->where('months', $condition['months']);
                            
                    })
                    ->with('item')
                    ->orderBy('id', 'DESC')
                    ->first();      
        }

        public static function updateData($obj){

        	if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $model = BudgetDisbursement::create($obj);
                return $model->id;    
               
            }else{
                BudgetDisbursement::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        }

        public static function updateItemData($obj){
            $model = BudgetDisbursementItem::create($obj);
            return $model->id;    
        }


        public static function removeData($id){
            return BudgetDisbursement::find($id)->delete();
        }

    }