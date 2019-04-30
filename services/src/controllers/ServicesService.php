<?php
    
    namespace App\Service;
    
    use App\Model\Services;
    use App\Model\Questionaire;
    use App\Model\QuestionaireDetail;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class ServicesService {

        public static function getServicesList($actives){
            return Services::where(function($query) use ($actives){
                            if(!empty($actives)){
                                $query->where('actives', $actives);
                            }
                        })
                        ->orderBy('ID', 'ASC')
                        ->get();
        }

    	public static function getServices($id){
            return Services::find($id); 
        }

        public static function updateServices($obj){
            if(empty($obj['id'])){
                $model = Services::create($obj);
                return $model->id;
            }else{
                Services::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        }

        public static function removeServices($id){
            return Services::find($id)->delete();
        }

        public static function addQuestion($obj){
            $model = Questionaire::create($obj);
            return $model->id;
        }

        public static function addQuestionDetail($obj){
            $model = QuestionaireDetail::create($obj);
            return $model->id;
        }
    }