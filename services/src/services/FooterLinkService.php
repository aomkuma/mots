<?php
    
    namespace App\Service;
    
    use App\Model\FooterLink;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class FooterLinkService {

        public static function getTypeList(){
            return FooterLink::groupBy('link_type')
                            ->orderBy('order_no', 'ASC')
                            ->get();
        }

        public static function getListByType($type){
            return FooterLink::where('link_type', $type)
                            ->orderBy('order_no', 'ASC')
                            ->get();
        }

    	public static function getList($menu_type, $condition){
            return FooterLink::orderBy('order_no', 'ASC')
                            ->get();
        }

        public static function updateData($obj){
            if(empty($obj['id'])){
                $model = FooterLink::create($obj);
                return $model->id;    
               
            }else{
                FooterLink::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }
        public static function removeData($id){
            
            return FooterLink::find($id)->delete();
            
        }


    }
