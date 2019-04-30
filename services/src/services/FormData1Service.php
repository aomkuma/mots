<?php
    
    namespace App\Service;
    
    use App\Model\FormData1;
    use App\Model\FormData1Detail;
    use App\Model\FormData1Scope;
    use App\Model\FormData1SubScope;
    use App\Model\FormData1Certification;
    use App\Model\FormData1StandardARC;
    use App\Model\FormData1License;
    use App\Model\FormData1StandardChecked;
    use App\Model\FormData1ProductInspect;
    use App\Model\Iso;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class FormData1Service {

    	public static function getList($menu_type, $keyword, $iso, $condition){

            return FormData1::select("Form_Data1.*"
                                    , DB::raw("Form_Data1_Detail.iso AS detail_iso")
                                    , DB::raw("Form_Data1_Scope.iso AS scope_iso")
                                    , DB::raw("Form_Data1_SubScope.iso AS subscope_iso")
                                    
                                    , DB::raw("IsoDetail.iso_name AS detail_iso_name")
                                    , DB::raw("IsoScope.iso_name AS scope_iso_name")
                                    , DB::raw("IsoSubScope.iso_name AS subscope_iso_name")

                                    , DB::raw("(SELECT GROUP_CONCAT(Iso.iso_name) AS iso_name FROM Iso INNER JOIN Form_Data1_Scope ON Iso.id = Form_Data1_Scope.iso WHERE form_data1_id = Form_Data1.id GROUP BY Form_Data1_Scope.form_data1_id) AS iso_name")
                                    , "Form_Data1_Detail.item_no"
                                    , "Form_Data1_Detail.file_name"
                                    , "Form_Data1_Detail.file_path"
                                )
                    ->leftJoin("Form_Data1_Detail", "Form_Data1.id", "=", "form_data1_id")
                    ->leftJoin("Form_Data1_Scope", "Form_Data1_Detail.id", "=", "detail_id")
                    ->leftJoin("Form_Data1_SubScope", "Form_Data1_Scope.id", "=", "Form_Data1_SubScope.scope_id")
                    
                    ->leftJoin(DB::raw("Iso AS IsoDetail"), DB::raw("IsoDetail.id"), "=", "Form_Data1_Detail.iso")
                    ->leftJoin(DB::raw("Iso AS IsoScope"), DB::raw("IsoScope.id"), "=", "Form_Data1_Scope.iso")
                    ->leftJoin(DB::raw("Iso AS IsoSubScope"), DB::raw("IsoSubScope.id"), "=", "Form_Data1_SubScope.iso")

                    ->leftJoin("Form_Data1_Certification", "Form_Data1_SubScope.id", "=", "Form_Data1_Certification.scope_id")
                    ->where(function($query) use ($keyword, $iso, $condition){
                        if(!empty($iso)){
                            $query->where('Form_Data1_Detail.iso', $iso);
                            $query->orWhere('Form_Data1_Scope.iso', $iso);
                            $query->orWhere('Form_Data1_SubScope.iso', $iso);
                        }
                        if(!empty($keyword)){
                            $query->where("group_name", 'LIKE', DB::raw("'%" . $keyword . "%'"));
                        }

                        if(!empty($condition['start_date']) && empty($condition['end_date'])){
                            $query->where("Form_Data1_Detail.start_date", $condition['start_date']);
                        }
                        else if(!empty($condition['start_date']) && !empty($condition['end_date'])){
                            $query->where("Form_Data1_Detail.start_date", '>=', $condition['start_date']);
                            $query->where("Form_Data1_Detail.end_date", '<=', $condition['end_date']);
                        }
                        // $query->where("start_date", $condition['start_date']);
                        // $query->where("end_date", $condition['end_date']);
                    })
                    ->where('Form_Data1.menu_type', $menu_type)
                    ->get();
        }

        public static function getData($id){
            return FormData1::where('id', $id)
                            ->with(array('formData1Detail' => function($query){
                                $query->with(array('formData1Scope' => function($query1){
                                    $query1->with(array('formData1SubScope' => function($query2){
                                        $query2->with('formData1Certification');
                                    }));
                                }));
                                $query->with('formData1StandardARC');
                            }))
                            ->first();
        }

        public static function getCustomerData($id){
            return FormData1::where('id', $id)
                            ->with(array('formData1Scope' => function($query){
                                $query->with('formData1SubScope');
                                
                            }))
                            ->first();
        }

        public static function getOperatorData($id){
            return FormData1::where('id', $id)
                            ->with(array('formData1Scope' => function($query){
                                    $query->with('formData1SubScope');
                                }))
                            
                            ->with(array('formData1License' => function($query){
                                    $query->with(array('formData1StandardChecked' => function($query1){
                                        $query1->with('formData1ProductInspect');
                                    }));
                                }))
                            
                            ->first();
        }

        public static function updateData($obj){
            if(empty($obj['id'])){
                $obj['create_date'] = date('Y-m-d H:i:s');
                $obj['update_date'] = date('Y-m-d H:i:s');
                $model = FormData1::create($obj);
                return $model->id;
            }else{
                $obj['update_date'] = date('Y-m-d H:i:s');
                FormData1::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function updateDetail($obj){
            if(empty($obj['id'])){
                $model = FormData1Detail::create($obj);
                return $model->id;
            }else{
                FormData1Detail::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function updateScope($obj){
            if(empty($obj['id'])){
                $model = FormData1Scope::create($obj);
                return $model->id;
            }else{
                FormData1Scope::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function updateSubScope($obj){
            if(empty($obj['id'])){
                $model = FormData1SubScope::create($obj);
                return $model->id;
            }else{
                FormData1SubScope::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function updateCertification($obj){
            if(empty($obj['id'])){
                $model = FormData1Certification::create($obj);
                return $model->id;
            }else{
                FormData1Certification::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function updateStandardARC($obj){
            if(empty($obj['id'])){
                $model = FormData1StandardARC::create($obj);
                return $model->id;
            }else{
                FormData1StandardARC::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function updateIso($obj){
            if(empty($obj['id'])){
                $model = Iso::create($obj);
                return $model->id;
            }else{
                Iso::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function getListIso($iso_type){
            return Iso::where(function($query) use ($iso_type){
                        if(!empty($iso_type)){
                            $query->where('iso_type', $iso_type);
                        }
                    })
                    ->get();
        
        }

        public static function getListOperator($keyword, $operator_type){
            return FormData1::where('Form_Data1.menu_type', 'operator-list')
                    ->where('Form_Data1.operator_type', $operator_type)
                    ->where(function($query) use ($keyword){
                        if(!empty($keyword)){
                            $query->where("group_name", 'LIKE', DB::raw("'%" . $keyword . "%'"));
                        }
                    })
                    ->with(array('formData1License'=>function($query){
                        $query->with('formData1StandardChecked');
                    }))
                    ->get();
        }

        public static function updateLicense($obj){
            if(empty($obj['id'])){
                $model = FormData1License::create($obj);
                return $model->id;
            }else{
                FormData1License::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function updateStandardChecked($obj){
            if(empty($obj['id'])){
                $model = FormData1StandardChecked::create($obj);
                return $model->id;
            }else{
                FormData1StandardChecked::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function updateProductInspect($obj){
            if(empty($obj['id'])){
                $model = FormData1ProductInspect::create($obj);
                return $model->id;
            }else{
                FormData1ProductInspect::where('id', $obj['id'])->update($obj);
                return $obj['id'];
            }
        
        }

        public static function getListCustomer($keyword){
            return FormData1::where('Form_Data1.menu_type', 'customer-list')
                    ->where(function($query) use ($keyword){
                        if(!empty($keyword)){
                            $query->where("group_name", 'LIKE', DB::raw("'%" . $keyword . "%'"));
                        }
                    })
                    ->with(array('formData1Scope'=>function($query){
                        $query->with('formData1SubScope');
                    }))
                    ->get();
        }

        public static function removeData($id){
            return FormData1::find($id)->delete();
        }

    }
