angular.module('e-homework').controller('EbookController', function ($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();


    $scope.$parent.menu_selected = 'ebook';
    $scope.$parent.menu_selected_th = 'ebook';

    $scope.loadMenu = function (action) {
        HTTPService.clientRequest(action, null).then(function (result) {
            //console.log(result);
            $scope.Menu = result.data.DATA.Menu;
            IndexOverlayFactory.overlayHide();
            $(document).ready(function () {
                // console.log('asd');
                $('a.test').on("click", function (e) {
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
    $scope.getMenu = function (action, menu_type) {
        var params = {'menu_type': menu_type};
        HTTPService.clientRequest(action, params).then(function (result) {
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            IndexOverlayFactory.overlayHide();
        });
    }



    $scope.getMenu('menu/get/type', $scope.page_type);
    $scope.loadMenu('menu/list');


});