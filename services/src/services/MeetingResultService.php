<?php
    
    namespace App\Service;
    
    use App\Model\MeetingResult;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class MeetingResultService {

    	public static function getList($meeting_type){
            return MeetingResult::where('meeting_type', $meeting_type)
                    ->orderBy('id', 'DESC')
                    ->get();
        }

        public static function updateData($obj){
            if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = MeetingResult::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                MeetingResult::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

    }
