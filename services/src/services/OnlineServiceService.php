<?php
    
    namespace App\Service;
    
    use App\Model\OnlineService;
    use App\Model\OnlineServiceType;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class OnlineServiceService {

    	public static function getList($create_date){
            return OnlineService::where(function($query) use ($create_date){
                        if(!empty($create_date)){
                            $query->whereBetween('create_date', $create_date);
                        }
                    })
                    ->with('onlineServiceType')
                    ->orderBy('id', 'DESC')
            		->get();      
        }

        public static function updateData($obj){

        	if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = OnlineService::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                OnlineService::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        }

        public static function addOnlineServiceType($obj){
            $model = OnlineServiceType::create($obj);
            return $model->id;    
        }

        public static function removeData($id){
            return OnlineService::find($id)->delete();
        }

    }