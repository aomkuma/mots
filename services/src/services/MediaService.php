<?php
    
    namespace App\Service;
    
    use App\Model\Media;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class MediaService {

    	public static function getList($appeal_date){
            return Media::where(function($query) use ($appeal_date){
                        
                    })
                    ->orderBy('id', 'DESC')
                    ->get();
        }

        public static function updateData($obj){
            if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = Media::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                Media::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function updateVisitCount($id){
            
            $model = Media::find($id);
            $model->visit_count = intval($model->visit_count) + 1;
            return $model->save();
            
        }

        public static function removeData($id){
            
            return Media::find($id)->delete();
            
        }

        public static function removeVideoData($id){
            
            $model = Media::find($id);

            // remove file
            unlink('../' . $model->file_path);
            $model->file_name = '';
            $model->file_path = '';
            $model->file_type = '';
            return $model->save();
            
        }


    }
