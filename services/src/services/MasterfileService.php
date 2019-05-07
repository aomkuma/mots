<?php
    
    namespace App\Service;
    
    use App\Model\AccreditationScope;
    use App\Model\Branch;
    use App\Model\Stakeholder;
    use App\Model\Province;
    use App\Model\CommodityStandard;
    use App\Model\MasterType;
    
    use Illuminate\Database\Capsule\Manager as DB;
    
    class MasterfileService {

    	public static function getAccreditationScope(){
            return AccreditationScope::all();
        }

        public static function getBranch(){
            return Branch::all();
        }

        public static function getProvince(){
            return Province::all();
        }

        public static function getAcademicBoard(){
            return CommodityStandard::where('academicBoardName', '<>', '')
                        ->whereNotNull('academicBoardName')
                        ->get();
        }

        public static function updateBranch($obj){
            if(empty($obj['branchID'])){
                $model = Branch::create($obj);
                return $model->branchID;
            }else{
                // $find old branch name
                $model = Branch::find($obj['branchID']);
                Branch::where('branchID', $obj['branchID'])->update($obj);

                // Update stakeholder's branch if change
                $update_branch = ['branch' => $obj['branchNameThai']];
                Stakeholder::where('branch', $model->branchNameThai)->update($update_branch);
                return $obj['branchID'];
            }
        }

        public static function addMasterFile($obj){
            
            $model = MasterType::create($obj);
            return $model->id;
        
        }

        public static function deleteBranch($id){
            return Branch::find($id)->delete();
        }    

        public static function getMasterfile($master_type){
            
            return  MasterType::where('menu_type' ,$master_type)->get();
            
        }

        
    }
