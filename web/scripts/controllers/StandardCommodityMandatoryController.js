angular.module('e-homework').controller('StandardCommodityMandatoryController', function($scope, $compile, $cookies, $filter, $state, $uibModal, $sce, HTTPService, IndexOverlayFactory) {

	$scope.page_type = 'standard-commodity/mandatory';

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
            IndexOverlayFactory.overlayHide();
        });
    }


	$scope.loadCommodityStandard = function(action, keyword, standardType){
        var params = {
                        'currentPage': $scope.currentPage
                        , 'limitRowPerPage': $scope.limitRowPerPage
                        , 'keyword' : keyword
                        , 'standardType' : standardType
                    };
        IndexOverlayFactory.overlayShow();
        HTTPService.clientRequest(action, params).then(function(result){
            // console.log(result);
            if(result.data.STATUS == 'OK'){
                $scope.dataset = result.data.DATA.CommodityStandard;
                $scope.totalPages = result.data.DATA.Total;
                $scope.standardIDToIgnore = result.data.DATA.standardIDToIgnore;
                IndexOverlayFactory.overlayHide();
                for(var i = 0; i < $scope.dataset.length; i++){
                    $scope.dataset[i].cancelled_data = $sce.trustAsHtml($scope.dataset[i].cancelled_data);
                }
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.search = function(keyword, standardType){
    	$scope.loadCommodityStandard('commodity-standard/mandatory', keyword, $scope.standardType);
    }

    $scope.makeDateString = function(d){
        if(d!= null && d != ''){
            return convertDateToFullThaiDateIgnoreTime(new Date(d.split(' ')[0]));    
        }
        return '';
    }

    $scope.goToPage = function(page){
        $scope.currentPage = page;
        $scope.loadCommodityStandard('commodity-standard/mandatory', $scope.keyword, $scope.standardType);
    }

    $scope.totalPages = 0;
    $scope.currentPage = 0;
    $scope.limitRowPerPage = 10;
    $scope.limitDisplay = 10;

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadCommodityStandard('commodity-standard/mandatory', '', '');

});	