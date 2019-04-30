angular.module('e-homework').controller('QuestionnaireResponseController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    $scope.page_type = 'questionnaire-response';

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

            // $scope.load('menu/page/get', $scope.ID);
            
        });
    }

    $scope.getMenu = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            // $scope.loadPage('questionnaire-response/page', $scope.MenuName[$scope.MenuName.length - 1].id);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadPage = function(action, menu_id){
        var params = {'menu_id' : menu_id};
        HTTPService.clientRequest(action, params).then(function(result){
            //console.log(result);

            if(result.data.STATUS == 'OK'){
                $scope.Page = result.data.DATA.Page;
                
            }
        });
    }

    $scope.loadCommodityStandard = function(keyword){
        var params = {
                        'keyword' : keyword
                    };
        IndexOverlayFactory.overlayShow();
        HTTPService.clientRequest('commodity-standard/questionnaire', params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                $scope.DataList = result.data.DATA.List;

                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.updateResponse = function(standardID){
        $scope.Questionnaire = null;
        $scope.ResponseBy = null;
        $scope.questionID = null;
        var params = {
                        'standardID' : standardID
                    };
        IndexOverlayFactory.overlayShow();
        HTTPService.clientRequest('questionnaire/get/standard', params).then(function(result){
            // console.log(result);
            if(result.data.STATUS == 'OK'){
                // $scope.Questionnaire = result.data.DATA.Questionnaire;
                $scope.StandardQuestionnaireList = result.data.DATA.StandardQuestionnaireList;
                $scope.PAGE = 'UPDATE';
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.setQuestionnaire = function(ID){
        if(ID != undefined && ID != null && ID != ''){
            var params = {'id' : ID};
            HTTPService.clientRequest('questionnaire/get', params).then(function(result){
                // console.log(result);
                if(result.data.STATUS == 'OK'){
                    // $scope.Questionnaire = result.data.DATA.Questionnaire;
                    $scope.Questionnaire = result.data.DATA.Questionnaire;
                    $scope.ShowQuestion = true;
                    IndexOverlayFactory.overlayHide();
                }else{
                    IndexOverlayFactory.overlayHide();
                }
            });
            
            console.log($scope.Questionnaire);
        }else{
            $scope.Questionnaire = null;
            $scope.ShowQuestion = false;
        }
    }

    $scope.updateData = function(Questionnaire, ResponseBy){
        
        $scope.alertMessage = 'ต้องการส่งความคิดเห็นนี้ ใช่หรือไม่ ?';
        var modalInstance = $uibModal.open({
            animation : false,
            templateUrl : 'views/dialog_confirm.html',
            size : 'sm',
            scope : $scope,
            backdrop : 'static',
            controller : 'ModalDialogCtrl',
            resolve : {
                params : function() {
                    return {};
                } 
            },
        });

        modalInstance.result.then(function (valResult) {
            var params = {'Questionnaire' : Questionnaire, 'ResponseBy' : ResponseBy};
            HTTPService.uploadRequest('questionnaire-response/update', params).then(function(result){
                console.log(result);
                if(result.data.STATUS == 'OK'){
                    alert('ขอบพระคุณที่ร่วมแสดงความคิดเห็น ระบบบันทึกความคิดเห็นของท่านแล้ว');
                    $scope.PAGE = 'MAIN';
                }else{
                    alert(result.data.DATA);
                }
                IndexOverlayFactory.overlayHide();
            });
        });
    }

     $scope.cancel = function(){
        $scope.Data = null;
        $scope.PAGE = 'MAIN';
     }

    IndexOverlayFactory.overlayHide();
    
    $scope.Data = {};
    $scope.PAGE = 'MAIN';
    
    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadCommodityStandard('');
    
});
