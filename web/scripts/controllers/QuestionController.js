angular.module('e-homework').controller('QuestionController', function($scope, $compile, $cookies, $filter, $state, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    console.log('Hello ! Project page');
	$scope.$parent.menu_selected = 'question';
    $scope.$parent.menu_selected_th = 'คำถามที่พบบ่อย';

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
        });
    }
    
    $scope.loadTravel = function(action){
        var params = {'question_picked':'Y', 'question_type' : 'travel'};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.TravelList = result.data.DATA.QuestionList;
            IndexOverlayFactory.overlayHide();

        });
    }

    $scope.loadSport = function(action){
        var params = {'question_picked':'Y', 'question_type' : 'sport'};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.SportList = result.data.DATA.QuestionList;
            IndexOverlayFactory.overlayHide();

        });
    }

    $scope.getThaiDate = function(date){
        console.log(date);
        return convertDateToFullThaiDateIgnoreTime(new Date(date));
    }

    $scope.displayQuestion = function(data){
        if(data.views == undefined || !data.views){
            data.views = true;
        }else{
            data.views = false;
        }
    }

    $scope.TravelList = [];
    $scope.SportList = [];

    $scope.loadMenu('menu/list');
    $scope.loadTravel('question/list');
    $scope.loadSport('question/list');
});