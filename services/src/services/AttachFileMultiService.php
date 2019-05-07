<?php
    
    namespace App\Service;
    
    use App\Model\AttachFileMulti;
    use App\Model\MasterType;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class AttachFileMultiService {

    	public static function getList($menu_type, $actives = '', $condition = [], $file_type = ''){
            return AttachFileMulti::where('menu_type', $menu_type)
                    ->where(function($query) use ($actives, $condition, $file_type){
                            if(!empty($actives)){
                                $query->where('actives', $actives);
                            }
                            if(!empty($condition['type'])){
                                $query->where('file_type', $condition['type']);
                            }
                            if(!empty($file_type)){
                                $query->where('file_type', $file_type);
                            }
                        })
                    ->orderBy('order_no', 'ASC')
            		->get();      
        }

        public static function getMasterList($menu_type){
            return MasterType::where('menu_type', $menu_type)
                    ->where('actives', 'Y')
                    ->orderBy('id', 'ASC')
                    ->get();      
        }

        public static function updateData($AttachFileMulti){
            if(empty($AttachFileMulti['id'])){
                $AttachFileMulti['create_date'] = date('Y-m-d H:i:s');
                $AttachFileMulti['update_date'] = date('Y-m-d H:i:s');
                $model = AttachFileMulti::create($AttachFileMulti);
                return $model->id;
            }else{
                $AttachFileMulti['update_date'] = date('Y-m-d H:i:s');
                AttachFileMulti::where('id', $AttachFileMulti['id'])->update($AttachFileMulti);
                return $AttachFileMulti['id'];
            }
        }

        public static function removeAttachFileMulti($id){
            return AttachFileMulti::find($id)->delete();
        }

        public static function updateActiveStatus($id, $active_status){
            $model = AttachFileMulti::find($id);
            $model->actives = $active_status;
            return $model->save();
        }

        public static function updateSort($id, $orderNo){
            $model = AttachFileMulti::find($id);
            $model->order_no = $orderNo;
            return $model->save();
        }
    }