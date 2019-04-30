angular.module('e-homework').controller('LawController', function($scope, $compile, $cookies, $filter, $state, HTTPService, IndexOverlayFactory) {
	
	IndexOverlayFactory.overlayShow();
	
	$scope.$parent.menu_selected = 'law';
	
	$scope.loadLaw = function(action, law_type){
        var params = {'law_type' : law_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.Law = result.data.DATA.Law;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadLawEcho = function(action, law_type){
        var params = {'law_type' : law_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.LawEcho = result.data.DATA.Law;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.getThaiDate = function(date){
        console.log(date);
        return convertDateToFullThaiDateIgnoreTime(new Date(date));
    }

    $scope.loadLaw('laws' ,'กฎหมาย/ระเบียบ ที่เกี่ยวข้อง');
    $scope.loadLawEcho('laws', 'ประกาศและคำสั่ง');

});	