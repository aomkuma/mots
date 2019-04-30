<?php
    
    namespace App\Service;
    
    use App\Model\Question;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class QuestionService {

        public static function getQuestionList($question_type, $question_picked = ''){
            return Question::where(function($query) use ($question_picked, $question_type){
                            if(!empty($question_picked)){
                                $query->where('question_picked', $question_picked);
                            }
                            if(!empty($question_type)){
                                $query->where('question_type', $question_type);
                            }
                        })
                        ->orderBy('question_date', 'DESC')
                        ->get();
        }

    	public static function getQuestion($id){
            return Question::find($id); 
        }

        public static function updateQuestion($obj){
            if(empty($obj['id'])){
                $model = Question::create($obj);
                return $model->id;
            }else{
                Question::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        }

        public static function removeQuestion($id){
            return Question::find($id)->delete();
        }
    }