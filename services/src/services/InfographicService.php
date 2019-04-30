<?php
    
    namespace App\Service;
    
    use App\Model\Infographic;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class InfographicService {

    	public static function getList($appeal_date){
            return Infographic::where(function($query) use ($appeal_date){
                        
                    })
                    ->get();
        }

        public static function updateData($obj){
            if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = Infographic::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                Infographic::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function updateVisitCount($id){
            
            $model = Infographic::find($id);
            $model->visit_count = intval($model->visit_count) + 1;
            return $model->save();
            
        }

        public static function removeData($id){
            
            return Infographic::find($id)->delete();
            
        }


    }
