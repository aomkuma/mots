<?php
    
    namespace App\Service;
    
    use App\Model\UserRole;
    use App\Model\UserRoleDetail;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class UserRoleService {

    	public static function getList($actives){
            return UserRole::where(function($query) use ($actives){
                        if(!empty($actives)){
                            $query->where('actives', $actives);
                        }
                    })->get();
        }

        public static function getData($role_id){
            return UserRole::find($role_id);
        }

        public static function getDetails($role_id){
            return UserRoleDetail::where('role_id', $role_id)->get();
        }

        public static function updateData($obj){
            if(empty($obj['id'])){
                // $obj['create_date'] = date('Y-m-d H:i:s');
                // $obj['update_date'] = date('Y-m-d H:i:s');
                $model = UserRole::create($obj);
                return $model->id;    
               
            }else{
                // $obj['update_date'] = date('Y-m-d H:i:s');
                UserRole::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function updateDataDetail($role_id, $menu_id, $checked_menu){
            // echo "$role_id, $menu_id, $checked_menu\n";
            $model = UserRoleDetail::where('role_id', $role_id)->where('menu_id', $menu_id)->first();
            if(empty($model)){
                
                $model = new UserRoleDetail;
                $model->role_id = $role_id;
                $model->menu_id = $menu_id;
                
            }

            $model->actives = $checked_menu;
            $model->save();
            return $model->id;    
        
        }
        public static function removeData($id){
            
            return UserRole::find($id)->delete();
            
        }


    }
