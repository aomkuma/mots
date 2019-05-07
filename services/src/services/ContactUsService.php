<?php
    
    namespace App\Service;
    
    use App\Model\ContactUs;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class ContactUsService {

    	public static function getData(){
            return ContactUs::first();
        }

        public static function updateData($obj){
            
            if(empty($obj['id'])){
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = ContactUs::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                ContactUs::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

    }
