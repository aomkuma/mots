<?php

    namespace App\Service;
    
    use App\Model\Subcommittee;
    use App\Model\SubcommitteePerson;
	
    use Illuminate\Database\Capsule\Manager as DB;
    
    class SubcommitteeService {

        public static function getListActive(){
            return Subcommittee::all();
        }
        
        public static function getList($currentPage, $limitRowPerPage){
            
            $limit = $limitRowPerPage;
            $offset = $currentPage;
            $skip = $offset * $limit;
            $totalRows = Subcommittee::count();
            $totalPage = ceil($totalRows / $limitRowPerPage);
            $DataList = Subcommittee::skip($skip)
                        ->take($limit)
                        ->get();

            return ['DataList'=>$DataList, 'Total' => $totalPage];
        }

        public static function getData($id){   
            return Subcommittee::where('subcommitteeID', $id)
                            // ->with('subcommitteePerson')
                        ->with(array('subcommitteePerson' => function($query){
                                $query
                                // ->select("Subcommittee_Person.stakeholderID", "nameThai", "lastNameThai")
                                ->join('Stakeholders', 'Stakeholders.stakeholderID', '=', 'Subcommittee_Person.stakeholderID');
                            }))
                        ->first();
        }     

        public static function updateData($obj){
            if(empty($obj['subcommitteeID'])){
                $model = Subcommittee::create($obj);
                return $model->subcommitteeID;    
               
            }else{
                Subcommittee::where('subcommitteeID', $obj['subcommitteeID'])->update($obj);
                return $obj['subcommitteeID'];
            }
        }

        public static function removeData($subcommitteeID){
            SubcommitteePerson::where('subcommitteeID', $subcommitteeID)->delete();
            return Subcommittee::find($subcommitteeID)->delete();
        }

        public static function addSubcommitteePerson($obj){
            // find and cannot add if exist
            $model = SubcommitteePerson::create($obj);
            return $model->subcommitteePersonID;    
          
        }

        public static function removeSubcommitteePerson($subcommitteePersonID){
            return SubcommitteePerson::find($subcommitteePersonID)->delete();
        }

    }    

?>