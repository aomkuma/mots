<?php
    
    namespace App\Service;
    
    use App\Model\Fruit;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class FruitService {

    	public static function getList($condition){
            return Fruit::where(function($query) use ($condition){
                        if(!empty($condition['column_name']) && !empty($condition['keyword'])){
                            $query->where($condition['column_name'], 'LIKE', DB::raw("'%" . $condition['keyword'] . "%'"));
                        }
                        else if(!empty($condition['keyword'])){
                            $query->where('name_th', 'LIKE', DB::raw("'%" . $condition['keyword'] . "%'"));
                            $query->orWhere('name_en', 'LIKE', DB::raw("'%" . $condition['keyword'] . "%'"));
                            $query->orWhere('name_science', 'LIKE', DB::raw("'%" . $condition['keyword'] . "%'"));
                        }
                    })
                    ->get();
        }

        public static function updateData($obj){
            if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = Fruit::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                Fruit::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function removeData($id){
            
            return Fruit::find($id)->delete();
            
        }


    }
