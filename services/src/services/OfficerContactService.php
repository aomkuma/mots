<?php
    
    namespace App\Service;
    
    use App\Model\OfficerContactDep;
    use App\Model\OfficerContactPerson;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class OfficerContactService {

    	public static function getDepList(){
            return OfficerContactDep::orderBy('order_no', 'DESC')->get();
        }

        public static function updateDepData($obj){
            
            if(empty($obj['id'])){
                $model = OfficerContactDep::create($obj);
                return $model->id;    
               
            }else{
                OfficerContactDep::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        }

        public static function deleteDepData($id){
            return OfficerContactDep::find($id)->delete();
        }

        public static function getOfficerList($dep_id){
            return OfficerContactPerson::where('dep_id', $dep_id)->get();
        }

        public static function updateOfficerData($obj){
            
            if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = OfficerContactPerson::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                OfficerContactPerson::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        }

        public static function deleteOfficerData($id){
            return OfficerContactPerson::find($id)->delete();
        }

    }
