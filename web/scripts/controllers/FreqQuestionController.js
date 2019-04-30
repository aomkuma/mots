angular.module('e-homework').controller('FreqQuestionController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    $scope.page_type = 'freq-question';

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
            $scope.loadPage('appeal/page', $scope.MenuName.id);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadList = function(question_type){
        var params = {'question_type' : question_type, 'keyword' : $scope.keyword};
        HTTPService.clientRequest('freq-question/list', params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.setQuestionType = function(index){
        $scope.QuestionType = $scope.QuestionTypeList[index];
        $scope.QuestionIndex = index;
        $scope.loadList($scope.QuestionTypeList[index]);
    }

    $scope.QuestionTypeList = ['มาตรฐาน', 'การรับรอง', 'เกษตรดิจิทัล', 'การควบคุม', 'ความรู้ทั่วไป', 'พ.ร.บ. มาตรฐานสินค้าเกษตร'];
    $scope.QuestionIndex = 0;
    $scope.QuestionType = $scope.QuestionTypeList[0];

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList($scope.QuestionTypeList[0]);

});
