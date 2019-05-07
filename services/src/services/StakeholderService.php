<?php
    
    namespace App\Service;
    
    use App\Model\Stakeholder;


    use Illuminate\Database\Capsule\Manager as DB;
    
    class StakeholderService {

    	public static function getList($currentPage, $limitRowPerPage){
            $limit = $limitRowPerPage;
            $offset = $currentPage;
            $skip = $offset * $limit;
            $totalRows = Stakeholder::count();
            $totalPage = ceil($totalRows / $limitRowPerPage);
            $DataList = Stakeholder::skip($skip)
                        ->take($limit)
                        ->get();

            return ['DataList'=>$DataList, 'Total' => $totalPage];
        }

        public static function getListByBranch($branch){
            return Stakeholder::where('branch', $branch)
                        ->get();

            
        }

        public static function getData($stakeholderID){
            return Stakeholder::find($stakeholderID);
        }

        public static function updateData($obj){
            if(empty($obj['stakeholderID'])){
                // generate stakeholderID
                $stakeholderID = StakeholderService::generateKeyID();
                // Check duplicate
                $stakeholder = StakeholderService::checkDuplicateID($stakeholderID);
                while(!empty($stakeholder)){
                    $stakeholderID = StakeholderService::generateKeyID();
                    $stakeholder = checkDuplicateID($stakeholderID);
                }
                $obj['stakeholderID'] = $stakeholderID;
                $obj['createDate'] = date('Y-m-d H:i:s');
                $obj['updateDate'] = date('Y-m-d H:i:s');
                $model = Stakeholder::create($obj);
                return $stakeholderID;    
               
            }else{
                unset($obj['createBy']);
                $obj['updateDate'] = date('Y-m-d H:i:s');
                Stakeholder::where('stakeholderID', $obj['stakeholderID'])->update($obj);
                return $obj['stakeholderID'];
            }
        }

        public static function removeData($stakeholderID){
            return Stakeholder::find($stakeholderID)->delete();
        }

        public static function checkDuplicateID($stakeholderID){
            return Stakeholder::find($stakeholderID);
        }

        private static function generateKeyID(){
            return rand(1000000, 9999999);
        }
    }
