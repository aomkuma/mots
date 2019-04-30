angular.module('e-homework').controller('FormData1Controller', function($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }
    console.log('Hello ! AttachFile Multi page');
    $scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'authority';

    $scope.page_type = $routeParams.page_type;

     $scope.MenuPermission =  angular.fromJson(sessionStorage.getItem('MenuPermission'));
     $scope.loadMenu = function(action){
        HTTPService.clientRequest(action, null).then(function(result){
            //console.log(result);
            $scope.Menu = result.data.DATA.Menu;
            IndexOverlayFactory.overlayHide();
            $(document).ready(function(){
                // console.log('asd');
              $('a.test').on("click", function(e){
                // alert('aa');
                // $('ul.dropdown-menu').hide();
                $(this).next('ul').toggle();
                e.stopPropagation();
                e.preventDefault();
              });
            });
            $scope.Menu = $filter('MenuPermission')($scope.MenuPermission, $scope.Menu);     
            // $scope.load('menu/page/get', $scope.ID);
            
        });
    }

    $scope.loadMenu('menu/list');

    $scope.getMenu = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadIso = function(){
        HTTPService.clientRequest('form-data1/list/iso', null).then(function(result){
            if(result.data.STATUS == 'OK'){
                $scope.Iso1List = result.data.DATA.List1;
                $scope.Iso2List = result.data.DATA.List2;
                $scope.Iso3List = result.data.DATA.List3;
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadIsoAll = function(){
        var params = {'type' : 'all'};
        HTTPService.clientRequest('form-data1/list/iso', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                $scope.IsoList = result.data.DATA.List;
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadList = function(condition){
        IndexOverlayFactory.overlayShow();
        var params = {'condition' : condition, 'menu_type' : $scope.page_type};
        HTTPService.clientRequest('form-data1/list', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                $scope.DataList = result.data.DATA.List;
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.saveData = function(FormData1, form_data1_detail){
        var params = {'FormData1' : FormData1, 'form_data1_detail' : form_data1_detail};
        HTTPService.uploadRequest('form-data1/update', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.PAGE = 'MAIN';
            }
            IndexOverlayFactory.overlayHide();
        });
    } 

    $scope.saveIso = function(ISO){
        var params = {'ISO' : ISO};
        HTTPService.clientRequest('form-data1/update/iso', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                $scope.loadIsoAll();
                $scope.PAGE = 'MAIN';
            }
            IndexOverlayFactory.overlayHide();
        });
    }   

    $scope.addIso = function(){
        $scope.ISO = {'id' : '', 'iso_type' : null, 'iso_name' : ''};
        $scope.PAGE = 'ISO';
    }

    $scope.updateData = function(id){
        if(id != ''){
            var params = {'id' : id};
            HTTPService.clientRequest('form-data1/get', params).then(function(result){
                if(result.data.STATUS == 'OK'){
                    $scope.FormData1 = result.data.DATA;
                }
                IndexOverlayFactory.overlayHide();
            });
        }else{
            $scope.FormData1 = {
                'menu_type' : $scope.page_type
                ,'actives' : 'Y'
            };

            $scope.form_data1_detail = [{'form_data1_scope' : [{
                                                        'form_data1_sub_scope':[{'iso':null}]
                                                        ,'form_data1_certification' : [{'certification':''}]
                                                        }
                                                ]
                                            
                                            ,'form_data1_standard_a_r_c' : [{'arc_name':''}]
                                           }
                
            ];
            console.log($scope.form_data1_detail);
        }
        $scope.loadIso();
        $scope.PAGE = 'UPDATE';
    }

    $scope.addDetail = function(){
        $scope.form_data1_detail.unshift({'form_data1_scope' : [{
                                                        'form_data1_sub_scope':[{'iso':null}]
                                                        ,'form_data1_certification' : [{'certification':''}]
                                                        }]
                                        ,'form_data1_standard_a_r_c' : [{'arc_name':''}]    
                                    });
    }


    $scope.addScope = function(index){
        $scope.form_data1_detail[index].form_data1_scope.push({
                                                        'form_data1_sub_scope':[{'iso':null}]
                                                        ,'form_data1_certification' : [{'certification':''}]
                                                    });
    }

    $scope.addStandardARC = function(index){
        $scope.form_data1_detail[index].form_data1_standard_a_r_c.push({'arc_name':''});
    }

    $scope.addSubScope = function(detail_index, scope_index){
        $scope.form_data1_detail[detail_index].form_data1_scope[scope_index].form_data1_sub_scope.push({'iso':null});
    }

    $scope.addCertification = function(detail_index, scope_index){
        $scope.form_data1_detail[detail_index].form_data1_scope[scope_index].form_data1_certification.push({'certification':''});
    }

    $scope.DatePoupObj = [];
    
    $scope.openStartDateObj = function(index) {
        $scope.form_data1_detail[index].open_start_date = true;
    };

    $scope.openEndDateObj = function(index) {
        $scope.form_data1_detail[index].open_end_date = true;
    };

    $scope.toggleUsageStatus = function(name){
        var idx = $scope.UsageStatusList.indexOf(name);

        // Is currently selected
        if (idx > -1) {
          $scope.UsageStatusList.splice(idx, 1);
        }
        // Is newly selected
        else {
          $scope.UsageStatusList.push(name);
        }
        console.log($scope.UsageStatusList);
    
    }

    $scope.cancel = function(){
        $scope.PAGE = 'MAIN';
    }

    $scope.condition = {'keyword':'', 'iso':null};
    $scope.UsageStatusList = [];
    $scope.PAGE = 'MAIN';

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList($scope.condition);
    $scope.loadIsoAll();

});