angular.module('e-homework').controller('ServicesController', function($scope, $compile, $cookies, $filter, $state, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    console.log('Hello ! Project page');
    $scope.$parent.menu_selected = 'services';
    $scope.$parent.menu_selected_th = 'งานบริการ';

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

    $scope.save = function(Question, QuestionDetail){
        
        var params = {
                    'Question':Question
                    ,'QuestionDetail':QuestionDetail
                    };
        HTTPService.clientRequest('services/question/add', params).then(function(result){
            $scope.setQuestion();
            $scope.setQuestionDetailList();
            IndexOverlayFactory.overlayHide();

        });
    }
    
    $scope.loadServices = function(action){
        var params = {'actives':'Y'};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.ServicesList = result.data.DATA.ServicesList;
            IndexOverlayFactory.overlayHide();

        });
    }

    $scope.setQuestion = function(){
        $scope.Question = {'id':'','gender':'','status':'','age':'','suggestion':''};
    }

    $scope.setQuestionDetailList = function(){
        $scope.QuestionDetailList = [
                                        {
                                            'question_desc':'ความสวยงาม ความทันสมัย น่าสนใจของหน้าโฮมเพจ'
                                            ,'points':''
                                        },
                                        {
                                            'question_desc':'มีความง่ายและความสะดวกในการเข้าถึงข้อมูล'
                                            ,'points':''
                                        },
                                        {
                                            'question_desc':'โดยภาพรวมท่านมีความพึงพอใจต่อเว็บไซต์กระทรวงการท่องเที่ยวและกีฬาอยู่ระดับใด'
                                            ,'points':''
                                        }
                                    ];
    }

    $scope.setQuestion();
    $scope.setQuestionDetailList();
    $scope.loadMenu('menu/list');
    $scope.loadServices('services/list');
});