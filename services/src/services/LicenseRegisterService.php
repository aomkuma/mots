<?php
    
    namespace App\Service;
    
    use App\Model\LicenseRegister;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class LicenseRegisterService {

        public static function getList($condition){
            return LicenseRegister::where(function($query) use ($condition){
                        if(!empty($condition['keyword'])){
                            $query->where('reference', 'LIKE', DB::raw("'%" . $condition['keyword'] . "%'"));
                            $query->orWhere('name', 'LIKE', DB::raw("'%" . $condition['keyword'] . "%'"));
                            $query->orWhere('email', 'LIKE', DB::raw("'%" . $condition['keyword'] . "%'"));
                            $query->orWhere('check_name', 'LIKE', DB::raw("'%" . $condition['keyword'] . "%'"));
                        }
                    })
                    ->get();
        }

    	public static function getData($condition){
            return LicenseRegister::where(function($query) use ($condition){
                        // if(!empty($condition['keyword'])){
                            $query->where('reference', $condition['keyword']);
                        // }
                    })
                    ->first();
        }

        public static function requestData($obj){
            
            $obj['create_date'] = date('Y-m-d H:i:s');
            $obj['update_date'] = date('Y-m-d H:i:s');
            $model = LicenseRegister::create($obj);
            // Generate reference
            
            do{
                $ref = LicenseRegisterService::generateReference();
                $dup = LicenseRegisterService::checkDuplicateRef($ref);
            }while(!empty($dup));

            $model->reference = $ref;
            $model->save();
            return $model;    
            
        }

        private static function generateReference(){
            return rand(1000000, 9999999);
        }

        private static function checkDuplicateRef($ref){
            return LicenseRegister::where('reference', $ref)->first();
        }

        public static function updateData($obj){
        
            $obj['update_date'] = date('Y-m-d H:i:s');
            LicenseRegister::where('id', $obj['id'])->update($obj);
            return $obj['id'];
        
        
        }

        public static function removeData($id){
            
            return LicenseRegister::find($id)->delete();
            
        }

    }
