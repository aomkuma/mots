<?php
    
    namespace App\Service;
    
    use App\Model\FreqQuestion;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class FreqQuestionService {

    	public static function getList($question_type,$keyword){
            return FreqQuestion::where('question_type', $question_type)
                            ->where(function($query) use($keyword) {
                                if(!empty($keyword)){
                                    $query->where('question_th', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                                    $query->orWhere('question_en', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                                }
                            })
                            ->get();
        }

        public static function updateData($obj){
            
            if(empty($obj['id'])){
                $model = FreqQuestion::create($obj);
                return $model->id;    
               
            }else{
                FreqQuestion::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function removeData($id){
            return FreqQuestion::find($id)->delete();
        }

    }
