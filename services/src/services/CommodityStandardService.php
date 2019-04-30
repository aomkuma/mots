<?php
    
    namespace App\Service;
    
    use App\Model\CommodityStandard;
    use App\Model\CommodityStandardCancelled;
    use App\Model\CommodityKeyword;
    use App\Model\APICaller;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class CommodityStandardService {

        public static function getListInUse(){
            return CommodityStandard::where('status' , 'Active')
                    ->whereIn('step', [9,11])
                    ->orderBy('Commodity_Standards.standardID', 'DESC')
                    ->get();
        }

        public static function getstandardCommodityStatus($years, $standardID){
            return CommodityStandard::where('status' , 'Active')
                    ->where(function($query) use ($standardID){
                        if(!empty($standardID)){
                            $query->where('standardID', $standardID);
                        }
                        })
                    ->where('years', $years)
                    ->orderBy('Commodity_Standards.standardID', 'DESC')
                    ->get();
        }

        public static function getListForQuestionnaire($keyword){
            return CommodityStandard::where('status' , 'Active')
                    ->where(function($query) use ($keyword){
                        if(!empty($keyword)){
                            $query->where('standardNameThai', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                        }
                        })
                    ->where('step', '<>' ,10)
                    ->join("Questionnaires", 'Questionnaires.standardID', '=', 'Commodity_Standards.standardID')
                    ->orderBy('Commodity_Standards.standardID', 'DESC')
                    ->get();
        }

        public static function getListReplace($standardID){
            return CommodityStandard::where('status' , 'Active')
                    ->where('standardID' , '<>', $standardID)
                    ->whereIn('step' , [9,11])
                    ->orderBy('standardID', 'DESC')
                    ->get();
        }

        public static function getListActive($years){
            return CommodityStandard::where('status' , 'Active')
                    ->where('years', $years)
                    ->orderBy('standardID', 'DESC')
                    ->get();
        }

        public static function getCommodityStandardListSearch($currentPage, $limitRowPerPage, $keyword, $standardType, $standardDefineType){
            // 
            $limit = $limitRowPerPage;
            $offset = $currentPage;
            $skip = $offset * $limit;
            $totalRows = CommodityStandard::leftJoin("Commodity_Keywords", 'Commodity_Keywords.standardID', '=', 'Commodity_Standards.standardID')
                        ->where(function($query) use ($standardType){
                            if(!empty($standardType)){
                                $query->where('standardType', $standardType);
                            }
                        })
                        ->where(function($query) use ($standardDefineType){
                            if(!empty($standardDefineType)){
                                $query->where('standardDefineType', $standardDefineType);
                            }
                        })
                        ->where(function($query) use ($stepList, $keyword, $standardDefineType){

                            if(!empty($standardDefineType)){
                                $query->where('standardDefineType', $standardDefineType);
                            }
                            //$query->where('step', '9');
                            if(!empty($keyword)){
                                $query->where('standardNameThai', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                                $query->orWhere('noThai', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                                $query->orWhere('noEng', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                                $query->orWhere('Commodity_Keywords.keyword', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                            }
                        })
                        ->where('status', 'Active')
                        ->where('step', '<>', '11')
                        ->groupBy('Commodity_Standards.standardID')
                        ->orderBy('Commodity_Standards.standardID', 'DESC')
                        ->get();
            $totalRows = count($totalRows);
            // $totalPage = ceil($totalRows / $limitRowPerPage);
            $DataList = CommodityStandard::leftJoin("Commodity_Keywords", 'Commodity_Keywords.standardID', '=', 'Commodity_Standards.standardID')
                        ->where(function($query) use ($standardType){
                            if(!empty($standardType)){
                                $query->where('standardType', $standardType);
                            }
                        })
                        ->where(function($query) use ($standardDefineType){
                            if(!empty($standardDefineType)){
                                $query->where('standardDefineType', $standardDefineType);
                            }
                        })
                        ->where(function($query) use ($stepList, $keyword, $standardDefineType){
                            //$query->where('step', '9');
                            if(!empty($keyword)){
                                $query->where('standardNameThai', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                                $query->orWhere('noThai', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                                $query->orWhere('noEng', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                                $query->orWhere('Commodity_Keywords.keyword', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                            }
                        })
                        ->where('status', 'Active')
                        ->where('step', '<>', '11')
                        ->groupBy('Commodity_Standards.standardID')
                        ->orderBy('Commodity_Standards.standardID', 'DESC')
                        ->skip($skip)
                        ->take($limit)
                        ->get();      
            // print_r($DataList);exit;
            return ['DataList'=>$DataList, 'Total' => $totalRows];
        }

        public static function searchCommodityStandard($keyword){
            // $totalPage = ceil($totalRows / $limitRowPerPage);
            return CommodityStandard::where(function($query) use ($keyword){
                            //$query->where('step', '9');
                            $query->where('status', 'Active');
                            if(!empty($keyword)){
                                $query->where('standardNameThai', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                                $query->orWhere('standardNameEng', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                            }
                        })
                        ->orderBy('standardID', 'DESC')
                        ->get();      
        }

        public static function getCommodityStandardListPlan($currentPage, $limitRowPerPage, $keyword){
            // 
            $limit = $limitRowPerPage;
            $offset = $currentPage;
            $skip = $offset * $limit;
            $totalRows = CommodityStandard::
                        where(function($query) use ($stepList, $keyword){
                            //$query->where('step', '9');
                            $query->where('status', 'Active');
                            if(!empty($keyword)){
                                $query->where('standardNameThai', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                            }
                        })
                        ->count();

            // $totalPage = ceil($totalRows / $limitRowPerPage);
            $DataList = CommodityStandard::where(function($query) use ($stepList, $keyword){
                            //$query->where('step', '9');
                            $query->where('status', 'Active');
                            if(!empty($keyword)){
                                $query->where('standardNameThai', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                            }
                        })
                        ->orderBy('standardID', 'DESC')
                        ->skip($skip)
                        ->take($limit)
                        ->get();      
            // print_r($DataList);exit;
            return ['DataList'=>$DataList, 'Total' => $totalRows];
        }

        public static function getCommodityStandardListByType($currentPage, $limitRowPerPage, $keyword, $defineType, $standardType,$stepList){
            // 
            $limit = $limitRowPerPage;
            $offset = $currentPage;
            $skip = $offset * $limit;
            $totalRows = CommodityStandard::
                        where(function($query) use ($keyword){
                            //$query->where('step', '9');
                            if(!empty($keyword)){
                                $query->where('standardNameThai', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                                $query->orWhere('Commodity_Keywords.keyword', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                            }
                            
                        })
                        ->where(function($query) use ($standardType){
                            //$query->where('step', '9');
                            
                            if(!empty($standardType)){
                                $query->where('standardType', $standardType);
                            }
                        })
                        ->where('status', 'Active')
                        ->whereIn('step', $stepList)
                        ->where('standardDefineType', $defineType)
                        ->leftJoin("Commodity_Keywords", 'Commodity_Keywords.standardID', '=', 'Commodity_Standards.standardID')
                        ->count();

            // $totalPage = ceil($totalRows / $limitRowPerPage);
            $DataList = CommodityStandard::
                        where(function($query) use ($keyword){
                            //$query->where('step', '9');
                            if(!empty($keyword)){
                                $query->where('standardNameThai', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                                $query->orWhere('Commodity_Keywords.keyword', 'LIKE', DB::raw("'%" . $keyword . "%'"));
                            }
                            
                        })
                        ->where(function($query) use ($standardType){
                            //$query->where('step', '9');
                            
                            if(!empty($standardType)){
                                $query->where('standardType', $standardType);
                            }
                        })
                        ->where('status', 'Active')
                        ->whereIn('step', $stepList)
                        ->where('standardDefineType', $defineType)
                        ->leftJoin("Commodity_Keywords", 'Commodity_Keywords.standardID', '=', 'Commodity_Standards.standardID')
                        ->groupBy('Commodity_Keywords.standardID')
                        ->orderBy('Commodity_Standards.standardID', 'DESC')
                        ->skip($skip)
                        ->take($limit)
                        ->get();      
            // print_r($DataList);exit;
            return ['DataList'=>$DataList, 'Total' => $totalRows];
        }

    	public static function getCommodityStandardList($currentPage, $limitRowPerPage, $_standardIDToIgnore, $stepList){
            // 
            $limit = $limitRowPerPage;
            $offset = $currentPage;
            $skip = $offset * $limit;
            $totalRows = CommodityStandard::whereNotIn("standardID", $_standardIDToIgnore)
                        ->where(function($query) use ($stepList){
                            if($stepList[0] == 11){
                                $query->where('status', 'Inactive');
                            }else{
                                $query->whereIn('step', $stepList);
                                $query->where('status', 'Active');
                            }
                        })
                        ->count();

            // $totalPage = ceil($totalRows / $limitRowPerPage);
            $DataList = CommodityStandard::whereNotIn("standardID", $_standardIDToIgnore)
                        ->where(function($query) use ($stepList){
                            if($stepList[0] == 11){
                                $query->where('status', 'Inactive');
                            }else{
                                $query->whereIn('step', $stepList);
                                $query->where('status', 'Active');
                            }
                        })
                        ->orderBy('standardID', 'DESC')
                        ->skip($skip)
                        ->take($limit)
                		->get();      

            return ['DataList'=>$DataList, 'Total' => $totalRows];
        }

        public static function getCommodityStandardListWithCheckDate($currentPage, $limitRowPerPage){
            // 
            $limit = $limitRowPerPage;
            $offset = $currentPage;
            $skip = $offset * $limit;
            $totalRows = CommodityStandard::where(DB::raw("DATEDIFF('".date('Y-m-d')."',createDate)"), '>', '1735')
                        ->count();

            // $totalPage = ceil($totalRows / $limitRowPerPage);
            $DataList = CommodityStandard::where( DB::raw("DATEDIFF('".date('Y-m-d')."',createDate)"), '>', '1735')
                        ->orderBy('standardID', 'DESC')
                        ->skip($skip)
                        ->take($limit)
                        ->get();      

            return ['DataList'=>$DataList, 'Total' => $totalRows];
        }

        public static function getCommodityStandardListForUser($userID, $currentPage, $limitRowPerPage, $_standardIDToIgnore){
            $limit = $limitRowPerPage;
            $offset = $currentPage;
            $skip = $offset * $limit;
            $totalRows = CommodityStandard::whereNotIn("Commodity_Standards.standardID", $_standardIDToIgnore)
                        ->join("Academic_Boards", 'Academic_Boards.standardID', '=', 'Commodity_Standards.standardID')
                        ->count();
            // $totalPage = ceil($totalRows / $limitRowPerPage);
            $DataList = CommodityStandard::select("Commodity_Standards.*")
                        ->whereNotIn("Commodity_Standards.standardID", $_standardIDToIgnore)
                        ->join("Academic_Boards", 'Academic_Boards.standardID', '=', 'Commodity_Standards.standardID')
                        ->groupBy('Commodity_Standards.standardID')
                        ->orderBy('Commodity_Standards.standardID', 'DESC')
                        ->skip($skip)
                        ->take($limit)
                        ->get();      

            return ['DataList'=>$DataList, 'Total' => $totalRows];
        }

        public static function getCommodityStandardListWithCheckDateForUser($userID, $currentPage, $limitRowPerPage){
            $limit = $limitRowPerPage;
            $offset = $currentPage;
            $skip = $offset * $limit;
            $totalRows = CommodityStandard::where(DB::raw("DATEDIFF('".date('Y-m-d')."',Commodity_Standards.createDate)"), '>', '1735')
                        ->join("Academic_Boards", 'Academic_Boards.standardID', '=', 'Commodity_Standards.standardID')
                        ->count();
            // $totalPage = ceil($totalRows / $limitRowPerPage);
            $DataList = CommodityStandard::select("Commodity_Standards.*")
                        ->where(DB::raw("DATEDIFF('".date('Y-m-d')."',Commodity_Standards.createDate)"), '>', '1735')
                        ->join("Academic_Boards", 'Academic_Boards.standardID', '=', 'Commodity_Standards.standardID')
                        ->groupBy('Commodity_Standards.standardID')
                        ->orderBy('Commodity_Standards.standardID', 'DESC')
                        ->skip($skip)
                        ->take($limit)
                        ->get();      

            return ['DataList'=>$DataList, 'Total' => $totalRows];
        }

        public static function getListAcademicBoard($currentPage, $limitRowPerPage){
            // 
            $limit = $limitRowPerPage;
            $offset = $currentPage;
            $skip = $offset * $limit;
            $totalRows = CommodityStandard::where('academicBoardName', '<>', '')
                        ->whereNotNull('academicBoardName')
                        ->count();

            // $totalPage = ceil($totalRows / $limitRowPerPage);
            $DataList = CommodityStandard::where('academicBoardName', '<>', '')
                        ->whereNotNull('academicBoardName')
                        ->with(array('academicBoard' => function($query){
                                    $query->join('Stakeholders', 'Stakeholders.stakeholderID', '=', 'Academic_Boards.stakeholderID');
                                }))
                        ->orderBy('academicBoardName', 'ASC')
                        ->skip($skip)
                        ->take($limit)
                        ->get();      
            // print_r($DataList);exit;
            return ['DataList'=>$DataList, 'Total' => $totalRows];
        }

        public static function getCommodityStandard($standardID){
            return CommodityStandard::find($standardID); 
        }

        public static function getCommodityKeywords($standardID, $keywordLang){
            return CommodityKeyword::where('standardID', $standardID)->where('keywordLang', $keywordLang)->get(); 
        }

        public static function updateCommodityStandard($CommodityStandard){
            if(empty($CommodityStandard['standardID'])){
                $CommodityStandard['createDate'] = date('Y-m-d H:i:s');
                $CommodityStandard['updateDate'] = date('Y-m-d H:i:s');
                $model = CommodityStandard::create($CommodityStandard);
                return $model->standardID;
            }else{
                $CommodityStandard['updateDate'] = date('Y-m-d H:i:s');
                CommodityStandard::where('standardID', $CommodityStandard['standardID'])->update($CommodityStandard);
                return $CommodityStandard['standardID'];
            }
            
        }

        public static function updateCommodityKeyword($CommodityKeyword){
            if(empty($CommodityKeyword['keywordID'])){
                $CommodityKeyword['createDate'] = date('Y-m-d H:i:s');
                $CommodityKeyword['updateDate'] = date('Y-m-d H:i:s');
                $model = CommodityKeyword::create($CommodityKeyword);
                return $model->keywordID;
            }else{
                $CommodityKeyword['updateDate'] = date('Y-m-d H:i:s');
                $model = CommodityKeyword::where('keywordID', $CommodityKeyword['keywordID'])->update($CommodityKeyword);
                return $CommodityKeyword['keywordID'];
            }
            
        }

        public static function removeCommodityStandard($id){
            return CommodityStandard::find($id)->delete();
        }

        public static function getListAPI(){
            return CommodityStandard::where('status' , 'Active')
                    ->with(array('academicBoard' => function($query){
                                    $query->with('stakeholders');
                                }))
                    ->with('meeting')
                    ->orderBy('standardID', 'DESC')
                    ->get()->toArray();
        }

        public static function updateAPICaller($obj){
            $obj['call_datetime'] = date('Y-m-d H:i:s');
            $model = APICaller::create($obj);
            return $model->id;
        }

        public static function updateCommodityStandardCancelled($obj){
            $model = CommodityStandardCancelled::create($obj);
            return $model->id;
        }

        public static function findCommodityStandardCancelled($id){
            return CommodityStandardCancelled::where('id_replaced', $id)
                ->join('Commodity_Standards', 'Commodity_Standards.standardID', '=' ,'Commodity_Standard_Cancelled.id_cancelled')
                ->first();
        }

    }