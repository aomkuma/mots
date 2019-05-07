<?php
    
    namespace App\Service;
    
    use App\Model\Licensees;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class LicenseesService {

    	public static function getList($condition, $actives){
            return Licensees::where(function($query) use ($condition){
                        
                        if(!empty($condition['license_type'])){
                            $query->where('license_type', $condition['license_type']);
                        }
                        if(!empty($condition['license_status'])){
                            $query->where('license_status', $condition['license_status']);
                        }
                        if(!empty($condition['cert_status'])){
                            $query->where('cert_status', 'LIKE', "'%" . DB::raw($condition['cert_status'] . "%'"));
                        }
                        if(!empty($condition['region'])){
                            $query->where('region', $condition['region']);
                        }
                        if(!empty($condition['province'])){
                            $query->where('province', $condition['province']);
                        }
                        if(!empty($condition['authorized_name'])){
                            $query->where('authorized_name', 'LIKE', DB::raw("'%" . $condition['authorized_name'] . "%'"));
                        }
                    })
                    ->orderBy('id', 'DESC')
                    ->get();
        }

        public static function updateData($obj){
            if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = Licensees::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                Licensees::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function removeData($id){
            
            return Licensees::find($id)->delete();
            
        }


    }
