angular.module('e-homework').controller('FormController', function ($scope, $uibModal, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();

    var $user_session = sessionStorage.getItem('user_session');

    if ($user_session != null) {
        $scope.$parent.currentUser = angular.fromJson($user_session);
    } else {
        window.location.replace('#/guest/logon');
    }

    $scope.MenuPermission = angular.fromJson(sessionStorage.getItem('MenuPermission'));

    console.log('Hello ! FromGen');
    $scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'authority';

    $scope.page_type = $routeParams.page_type;

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
            $scope.Menu = $filter('MenuPermission')($scope.MenuPermission, $scope.Menu);
            // $scope.load('menu/page/get', $scope.ID);

        });
    }

    $scope.loadMenu('menu/list');



    $scope.getMenu = function (action, menu_type) {
        var params = {'menu_type': menu_type};
        HTTPService.clientRequest(action, params).then(function (result) {

            $scope.MenuName = result.data.DATA.Menu;

            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadPage = function (action, menu_id) {
        var params = {'menu_id': menu_id};
        HTTPService.clientRequest(action, params).then(function (result) {
            //console.log(result);

            if (result.data.STATUS == 'OK') {
                $scope.PageContent = result.data.DATA.Page;



            }
        });
    }



    $scope.loadList = function (action) {

        HTTPService.clientRequest(action).then(function (result) {
         //   console.log(result);
            $scope.DataList = result.data.DATA;

            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.removeData = function (id) {
        $scope.alertMessage = 'ต้องการลบข้อมูลนี้ ใช่หรือไม่ ?';
        var modalInstance = $uibModal.open({
            animation: true,
            templateUrl: 'views/dialog_confirm.html',
            size: 'sm',
            scope: $scope,
            backdrop: 'static',
            controller: 'ModalDialogCtrl',
            resolve: {
                params: function () {
                    return {};
                }
            },
        });

        modalInstance.result.then(function (valResult) {
            IndexOverlayFactory.overlayShow();
            var params = {'id': id};
            HTTPService.clientRequest('form-generator/delete', params).then(function (result) {
                // $scope.load('Datas');
                $scope.loadList('form-generator/list');
                IndexOverlayFactory.overlayHide();
            });
        });

    }

    $scope.viewData = function (data) {
        $scope.Data = angular.copy(data);
        $scope.PAGE = 'VIEW';
    }
    $scope.popup1 = {
        opened: false
    };
    $scope.open1 = function () {
        $scope.popup1.opened = true;
    };
    $scope.cancel = function () {
        $scope.PAGE = 'MAIN';
    }
    $scope.add = function () {
        window.location.replace('#/form-generator/add');
    }

    $scope.edit = function (id) {
        
        window.location.href = '#/form-generator/add/' + id;
    }

    IndexOverlayFactory.overlayHide();
    $scope.PageContent = {
        'id': ''
        , 'menu_id': ''
        , 'title_th': ''
        , 'title_en': ''
        , 'contents': ''
        , 'contents_en': ''
    };
    $scope.PAGE = 'MAIN';
    $scope.FileList = [];
    $scope.YearList = getYearList(20);
    $scope.MonthList = getMonthList();
    $scope.loadList('form-generator/list');

    $scope.getMenu('menu/get/type', $scope.page_type);

});
