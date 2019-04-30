<?php
    
    namespace App\Service;
    
    use App\Model\QuestionAnswer;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class QuestionAnswerService {

    	public static function getList(){
            return QuestionAnswer::all();
        }

        public static function updateData($obj){
            
            if(empty($obj['id'])){
                $model = QuestionAnswer::create($obj);
                return $model->id;    
               
            }else{
                QuestionAnswer::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function removeData($id){
            return QuestionAnswer::find($id)->delete();
        }

    }
