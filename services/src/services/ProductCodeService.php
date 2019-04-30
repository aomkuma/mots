<?php
    
    namespace App\Service;
    
    use App\Model\ProductCode;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class ProductCodeService {

    	public static function getList($condition){
            return ProductCode::
                            where(function($query) use($condition) {
                                if(!empty($condition['keyword'])){
                                    $query->where('product_th', 'LIKE', DB::raw("'%" . $condition['keyword'] . "%'"));
                                    $query->orWhere('product_en', 'LIKE', DB::raw("'%" . $condition['keyword'] . "%'"));
                                }
                                if(!empty($condition['product_type'])){
                                    $query->where('product_type' , $condition['product_type']);
                                }
                            })
                            ->get();
        }

        public static function updateData($obj){
            
            if(empty($obj['id'])){

                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = ProductCode::create($obj);
                return $model->id;    
               
            }else{

                $obj['update_date'] = date('Y-m-d H:i:s');
                ProductCode::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function removeData($id){
            return ProductCode::find($id)->delete();
        }

    }
