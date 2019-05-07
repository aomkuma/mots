<?php
    
    namespace App\Service;
    
    use App\Model\LandingPage;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class LandingPageService {

    	public static function getListView($actives){
            return LandingPage::where(function($query) use ($actives) {
                        if(!empty($actives)){
                            $query->where('actives', $actives);
                        }
                        $curDate = date('Y-m-d');
                        $query->where('start_date', '<=', $curDate);
                        $query->where('end_date', '>=', $curDate);
                    })
                    ->orderBy("id", "DESC")
                    ->first();
        }

        public static function getList($actives){
            return LandingPage::where(function($query) use ($actives) {
                        if(!empty($actives)){
                            $query->where('actives', $actives);
                        }
                    })->get();
        }

        public static function updateData($obj){
            
            if(empty($obj['id'])){
                $model = LandingPage::create($obj);
                return $model->id;    
               
            }else{
                LandingPage::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function removeData($id){
            return LandingPage::find($id)->delete();
        }

    }
