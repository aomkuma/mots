angular.module('e-homework').controller('BudgetDisbursementController', function($scope, $cookies, $filter, $state, $uibModal, HTTPService, IndexOverlayFactory) {
	//console.log('Hello !');
    $scope.page_type = 'budget-disbursement';
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

    $scope.loadMenu('menu/list');

    $scope.loadData = function(condition){
        var params = {'condition' : condition};
        HTTPService.clientRequest('budget-disbursement/get', params).then(function(result){
            console.log(result);
            // $scope.Data = null;
            $scope.Data = result.data.DATA.Data;
            console.log($scope.DataList);
            $scope.createChart($scope.Data);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.edit = function(data){
        $scope.AttachFile = null;
        $scope.Data = angular.copy(data);
        
        $scope.PAGE = 'UPDATE';
    }

    $scope.add = function(){
        $scope.AttachFile = null;
        $scope.Data = {'actives':'Y'};
        $scope.PAGE = 'UPDATE';
    }

    $scope.cancelUpdate = function(){
        $scope.AttachFile = null;
        $scope.Data = null;
        $scope.PAGE = 'MAIN';
    }


    $scope.remove = function(action, id){
        $scope.alertMessage = 'ต้องการลบข้อมูลนี้ ใช่หรือไม่ ?';
        var modalInstance = $uibModal.open({
            animation : true,
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
            IndexOverlayFactory.overlayShow();
            var params = {'id' : id};
            HTTPService.clientRequest(action, params).then(function(result){
            // $scope.load('Datas');
            $scope.load('budget-disbursement');
            IndexOverlayFactory.overlayHide();
        });
        });
        
    }

    $scope.getMonthName = function(month){
        return getThaiMonthName(month);
    }

    $scope.createChart = function(Data){
        // Create chart
        var ctx = document.getElementById("myChart").getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['งบบุคลากร', 'งบดำเนินงาน', 'งบลงทุน', 'งบเงินอุดหนุน', 'งบรายจ่ายอื่น', 'รวม']//["บริการสัตว์แพทย์", "ผสมเทียม", "แร่ธาตุ", "อาหารสัตว์", "ผลิตน้ำเชื้อแช่แข็ง", "จำหน่ายน้ำเชื้อแช่แข็ง", "วัสดุผสมเทียมและอื่นๆ", "ปัจจัยการการเลี้ยงโค", "ฝึกอบรม", "ท่องเที่ยว", "สหกรณ์และปริมาณน้ำนม", "ข้อมูลฝูงโค"],
                ,datasets: [
                {
                    label: 'งบบุคลากร',
                    backgroundColor: '#335EEC',
                    stack: 'Stack0',
                    data: [
                        Data.item[0].staff,
                        Data.item[0].operating,
                        Data.item[0].investing,
                        Data.item[0].subsidy,
                        Data.item[0].other,
                        Data.item[0].subtotal,
                        
                    ]
                },{
                    label: Data.item[1].item,
                    backgroundColor: '#CE0000',
                    stack: 'Stack1',
                    data: [
                        Data.item[1].staff,
                        Data.item[1].operating,
                        Data.item[1].investing,
                        Data.item[1].subsidy,
                        Data.item[1].other,
                        Data.item[1].subtotal,
                        
                    ]
                }]
            },
            options: {
                title: {
                    display: true,
                    text: 'ข้อมูลให้บริการและกิจการโคนม'
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
                            beginAtZero:true
                        }
                    }]
                }
            }
        });

    }

    $scope.AttachFile = null;
    $scope.Data = null;

    $scope.YearList = getYearList(20);
    $scope.MonthList = getMonthList();

    $scope.PAGE = 'MAIN';
    // $scope.load('budget-disbursement');
    $scope.getMenu('menu/get/type' ,$scope.page_type);

});