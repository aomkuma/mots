<?php
    
    namespace App\Service;
    
    use App\Model\Palace;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class PalaceService {

    	public static function getList($palace_type, $actives){
            return Palace::where(function($query) use ($palace_type, $actives){
                        if(!empty($palace_type)){
                            $query->where('palace_type', $palace_type);
                        }
                        if(!empty($actives)){
                            $query->where('actives', $actives);
                        }
                    })
                    //->orderBy('order_no', 'ASC')
                    ->orderBy('order_no', 'ASC')
                    ->orderBy('id', 'DESC')
            		->get();      
        }

        public static function getMinisterData(){
            return Palace::where('position_th', 'รัฐมนตรีว่าการกระทรวงการท่องเที่ยวและกีฬา')
                    ->orderBy('id', 'DESC')
                    ->first();      
        }

        public static function updateData($obj){

        	if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = Palace::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                Palace::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        }

        public static function updateSort($id, $orderNo){
            $model = Palace::find($id);
            $model->order_no = $orderNo;
            return $model->save();
        }

        public static function removeData($id){
            return Palace::find($id)->delete();
        }

    }