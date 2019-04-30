angular.module('e-homework').controller('LoginController',function($scope, $routeParams, HTTPService, IndexOverlayFactory){
	
	$scope.user = {'Username':'','Password':''};

    var reDirect = '';
    if($routeParams.redirect_url !== undefined){
        reDirect = $routeParams.redirect_url;
        console.log(reDirect);
    }
	$scope.showError = false; // set Error flag
	$scope.showSuccess = false; // set Success Flag
    
	//------- Authenticate function
	$scope.authenticate = function (action, data){
		var flag= false;
        $scope.showError = false;
        $scope.showSuccess = false;
        IndexOverlayFactory.overlayShow();
        HTTPService.clientRequest(action, data).then(function(user){
            console.log(user);
            if(user.data.STATUS == 'OK'){
                $scope.showError = false;
                $scope.showSuccess = true;
                sessionStorage.setItem('user_session' , JSON.stringify(user.data.DATA.UserData));
                sessionStorage.setItem('MenuPermission' , JSON.stringify(user.data.DATA.MenuPermission));
                setTimeout(function(){
                    // console.log(sessionStorage.getItem('user_session'));
                    window.location.replace('#/landing-page');    
                }, 1000);
            }else{
                $scope.showError = true;
                $scope.showSuccess = false;
            }
            IndexOverlayFactory.overlayHide();
        });
	}
});
