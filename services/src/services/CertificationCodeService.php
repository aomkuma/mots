<?php
    
    namespace App\Service;
    
    use App\Model\CertificationCode;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class CertificationCodeService {

    	public static function getList($page_type, $condition){
            return CertificationCode::where(function($query) use ($condition){
                        if(!empty($condition['keyword'])){
                            $query->where('operator_name_th' , 'LIKE' , DB::raw("'%" . $condition['keyword'] . "%'"));
                            $query->orWhere('operator_name_en' , 'LIKE' , DB::raw("'%" . $condition['keyword'] . "%'"));
                            $query->orWhere('standard_th' , 'LIKE' , DB::raw("'%" . $condition['keyword'] . "%'"));
                        }
                    })
                    ->where('page_type' , $page_type)
                    ->get();
        }

        public static function updateData($obj){
            if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = CertificationCode::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                CertificationCode::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }
        public static function removeData($id){
            
            return CertificationCode::find($id)->delete();
            
        }


    }
