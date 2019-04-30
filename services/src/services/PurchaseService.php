<?php
    
    namespace App\Service;
    
    use App\Model\Purchase;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class PurchaseService {

        public static function searchPurchase($keyword){
            return Purchase::where('org_th', 'LIKE', DB::raw("'%" . $keyword . "%'"))
                        ->orWhere('office_th', 'LIKE', DB::raw("'%" . $keyword . "%'"))
                        ->orWhere('project_th', 'LIKE', DB::raw("'%" . $keyword . "%'"))
                        ->orWhere('item_no', 'LIKE', DB::raw("'%" . $keyword . "%'"))
                        ->orWhere('project_no', 'LIKE', DB::raw("'%" . $keyword . "%'"))
                        ->get();
        } 

    	public static function getList($page_type, $actives, $echo_status){
            return Purchase::where(function($query) use ($page_type, $actives, $echo_status){
                        if(!empty($actives)){
                            $query->where('actives', $actives);
                        }
                        if(!empty($echo_status)){
                            $query->where('echo_status', $echo_status);
                        }

                        if(!empty($page_type) && $page_type != 'cancelled-work'){
                            $query->where('page_type', $page_type);
                        }
                    })
                    
                    ->get();
        }

        public static function updateData($obj){
            if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = Purchase::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                Purchase::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function removeData($id){
            return Purchase::find($id)->delete();
        }

    }
