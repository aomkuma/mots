<?php
    
    namespace App\Service;
    
    use App\Model\Listening;
    use App\Model\Comment;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class ListeningService {

    	public static function getList($listening_type, $view_type = '', $condition = []){
            // echo $listening_type;exit;
            return Listening::where(function($query) use ($listening_type, $view_type, $condition){
                        if(!empty($listening_type)){
                            $query->where('listening_type', DB::raw("N'".$listening_type."'"));
                        }
                        if(!empty($condition['keyword'])){
                            $query->where('title_th', 'LIKE', DB::raw("'%".$condition['keyword']."%'"));
                        }
                        if($view_type == 'view'){
                            $query->where('actives', 'Y');
                            // $curDate = date('Y-m-d');
                            // $query->where('start_date', '<=', $curDate);
                            // $query->where('end_date', '>=', $curDate);
                        }
                    })
                    //->orderBy('order_no', 'ASC')
                    
                    ->orderBy('id', 'DESC')
            		->get();      
        }

        public static function getData($id){
            return Listening::find($id);
        }

        public static function viewComment($listening_id){
            return Comment::where('listening_id', $listening_id)->get();
        }

        public static function updateComment($obj){
            $obj['create_date'] = date('Y-m-d H:i:s');
            $model = Comment::create($obj);
            return $model->id;    
        }

        public static function updateData($obj){

            if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = Listening::create($obj);
                return $model->id;    
               
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                Listening::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        }

        public static function removeData($id){
            return Listening::find($id)->delete();
        }

    }