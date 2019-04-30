<?php
    
    namespace App\Service;
    
    use App\Model\LinkUrl;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class LinkUrlService {

        public static function getLinkUrl(){
            return LinkUrl::orderBy('order_no', 'ASC')
                    ->orderBy('id', 'DESC')
                    ->get();      
        }

        public static function getLinkUrlType(){
            return LinkUrl::groupBy('link_type')
                    ->orderBy('order_no', 'ASC')
                    ->orderBy('link_type', 'ASC')
                    ->get();      
        }

    	public static function getLinkUrlByType($link_type){
            return LinkUrl::where('link_type', $link_type)
            		->orderBy('id', 'DESC')
            		->get()->toArray();      
        }

        public static function updateLinkUrl($obj){

        	$model = LinkUrl::find($obj['id']);
        	if(empty($model)){
        		$model = new LinkUrl;
        		$model->create_date = date('Y-m-d H:i:s');
                $model->link_type = $obj['link_type'];
        	}
            // $model->update_date = date('Y-m-d H:i:s');
            $model->link_url = $obj['link_url'];
            $model->link_type = $obj['link_type'];
            $model->image_path = $obj['image_path'];
            $model->order_no = $obj['order_no'];
            $model->update_date = date('Y-m-d H:i:s');
            $model->save();
            return $model->id;
        }

        public static function removeLinkUrl($id){
            return LinkUrl::find($id)->delete();
        }
    }