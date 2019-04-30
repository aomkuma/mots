<?php
    
    namespace App\Service;
    
    use App\Model\MainContent;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class MainContentService {

    	public static function getList($appeal_date, $page_type){
            return MainContent::orderBy('order_no', 'ASC')
                    ->get();
        }

        public static function updateOrderNo($id, $order_no){
            $obj['order_no'] = date('Y-m-d H:i:s');
            $model = MainContent::find($id);
            $model->order_no = $order_no;
            $model->save();
        }
    }
