angular.module('e-homework').controller('ChartController', function ($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();

    var $user_session = sessionStorage.getItem('user_session');

    if ($user_session != null) {
        $scope.$parent.currentUser = angular.fromJson($user_session);
    } else {
        window.location.replace('#/guest/logon');
    }

    $scope.MenuPermission = angular.fromJson(sessionStorage.getItem('MenuPermission'));

    console.log('Hello ! AttachFile Multi page');
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
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            console.log($scope.MenuName);

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




    var ctx = null;
    var myChart = null;
    $scope.loadData1 = function (condition) {

        if (myChart != null) {
            myChart.destroy();
        }
        IndexOverlayFactory.overlayShow();
        var params = {'condition': condition};
        HTTPService.clientRequest('chart', params).then(function (result) {
            IndexOverlayFactory.overlayHide();
            $scope.Chart1 = result.data;

            ctx = document.getElementById("myChart").getContext('2d');
            myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: $scope.Chart1.LABEL,
                    datasets: [
                        {
                            label: 'ร้องเรียน',
                            backgroundColor: '#CDF9F3',
                            stack: 'Stack0',
                            data: $scope.Chart1.DATA.app

                        },
                        {
                            label: 'คำถาม',
                            backgroundColor: '#C2FFB6',
                            stack: 'Stack1',
                            data: $scope.Chart1.DATA.qa

                        },
                        {
                            label: 'แบบสำรวจ',
                            backgroundColor: '#FFB6B6',
                            stack: 'Stack3',
                            data: $scope.Chart1.DATA.qn

                        }
                    ,
                        {
                            label: 'ผู้เข้าชม',
                            backgroundColor: '#FFB600',
                            stack: 'Stack4',
                            data: $scope.Chart1.DATA.vi

                        }]
                },
                options: {
                    title: {
                        display: true,
                        text: 'สรุปข้อคำถาม'
                    },
                    tooltips: {
                        mode: 'index',
                        intersect: false
                    },
                    responsive: true,
                    scales: {
                        xAxes: [{
                                stacked: true,
                            }],
                        yAxes: [{
                                stacked: true,
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                    }
                }
            });
        });
    }

    $scope.search = function (condition) {
        $scope.loadData1(condition);
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
    $scope.condition = {'months': null, 'years': null, 'page_type': $scope.page_type};

    $scope.getMenu('menu/get/type', $scope.page_type);

});
