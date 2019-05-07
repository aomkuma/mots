<?php
    
    namespace App\Service;
    
    use App\Model\CountryList;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class CountryListService {

    	public static function getList($menu_type, $condition){
            return CountryList::where(function($query) use ($condition){
                        if(!empty($condition['keyword'])){
                            $query->where('org_th' , 'LIKE' , DB::raw("'%" . $condition['keyword'] . "%'"));
                            $query->orWhere('org_en' , 'LIKE' , DB::raw("'%" . $condition['keyword'] . "%'"));
                            $query->orWhere('country_th' , 'LIKE' , DB::raw("'%" . $condition['keyword'] . "%'"));
                            $query->orWhere('country_en' , 'LIKE' , DB::raw("'%" . $condition['keyword'] . "%'"));
                            $query->orWhere('standard_name' , 'LIKE' , DB::raw("'%" . $condition['keyword'] . "%'"));
                        }
                    })
                    ->where('menu_type' , $menu_type)
                    ->get();
        }

        public static function updateData($obj){
            if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = CountryList::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                CountryList::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }
        public static function removeData($id){
            
            return CountryList::find($id)->delete();
            
        }


    }
