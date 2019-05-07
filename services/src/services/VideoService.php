<?php
    
    namespace App\Service;
    
    use App\Model\Video;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class VideoService {

        public static function getVideoList($actives = ''){
            return Video::where(function($query) use ($actives){
                            if(!empty($actives)){
                                $query->where('actives', $actives);
                            }
                        })
                        ->orderBy('video_date', 'DESC')
                        ->get();
        }

    	public static function getVideo($id){
            return Video::find($id); 
        }

        public static function updateVideo($obj){
            if(empty($obj['id'])){
                $model = Video::create($obj);
                return $model->id;
            }else{
                Video::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        }

        public static function updateVisitCount($id){
            $model = Video::find($id);
            $model->visit_count = intval($model->visit_count) + 1;
            $model->update();
        }

        public static function removeVideo($id){
            return Video::find($id)->delete();
        }
    }