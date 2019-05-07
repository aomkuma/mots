<?php
    
    namespace App\Service;
    
    use App\Model\AcademicBoard;
    use App\Model\SubstituteAcademicBoard;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class AcademicBoardService {

    	public static function getAcademicBoardList($standardID){
            return AcademicBoard::select('Academic_Boards.academicBoardID'
            							,'Stakeholders.*'
        								)
            		->join("Stakeholders", 'Stakeholders.stakeholderID', '=', 'Academic_Boards.stakeholderID')
            		->where('standardID' , $standardID)
            		->orderBy('academicBoardID', 'ASC')
            		->get();      
        }

        public static function getSubtituteList($academicBoardID){
            return SubstituteAcademicBoard::select('Substitute_Academic_Boards.substituteID'
            							,'Substitute_Academic_Boards.academicBoardID'
            							,'Stakeholders.*'
        								)
            		->join("Stakeholders", 'Stakeholders.stakeholderID', '=', 'Substitute_Academic_Boards.stakeholderID')
            		->where('academicBoardID' , $academicBoardID)
            		->orderBy('substituteID', 'ASC')
            		->get();      
        }

        public static function updateAcademicBoard($AcademicBoard){
        	// print_r($AcademicBoard);exit;
            if(empty($AcademicBoard['academicBoardID'])){
                $AcademicBoard['createDate'] = date('Y-m-d H:i:s');
                $AcademicBoard['updateDate'] = date('Y-m-d H:i:s');
                $model = AcademicBoard::create($AcademicBoard);
                return $model->academicBoardID;
            }else{
            	unset($AcademicBoard['createBy']);
                $AcademicBoard['updateDate'] = date('Y-m-d H:i:s');
                AcademicBoard::where('academicBoardID', $AcademicBoard['academicBoardID'])->update($AcademicBoard);
                return $AcademicBoard['academicBoardID'];
            }
            
        }

        public static function updateSubstituteAcademicBoard($SubstituteAcademicBoard){
            if(empty($SubstituteAcademicBoard['substituteID'])){
                $model = SubstituteAcademicBoard::create($SubstituteAcademicBoard);
                return $model->substituteID;
            }else{
                SubstituteAcademicBoard::where('substituteID', $SubstituteAcademicBoard['substituteID'])->update($SubstituteAcademicBoard);
                return $SubstituteAcademicBoard['substituteID'];
            }
            
        }

        public static function removeAcademicBoard($academicBoardID){
        	AcademicBoard::find($academicBoardID)->delete();
        	SubstituteAcademicBoard::where('academicBoardID', $academicBoardID)->delete();
        }

    }
