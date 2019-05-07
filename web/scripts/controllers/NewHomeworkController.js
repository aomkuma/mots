angular.module('e-homework').controller('NewHomeworkController', function($scope, $cookies, $filter, $state) {
	//console.log('Hello !');
    $scope.DEFAULT_LANGUAGE = 'EN';
    $scope.ClassRoomList = [{'classroom_id':1, 'classroom_name_th' : '5/1','classroom_name_en' : '5/1'}
    					,{'classroom_id':2, 'classroom_name_th' : '5/2','classroom_name_en' : '5/2'}];
    $scope.SubjectList = [{'subject_id': 1, 'subject_name_th' : 'คณิตศาสตร์', 'subject_name_en' : 'Math'}
    				,{'subject_id': 2, 'subject_name_th' : 'แคลคูลัส', 'subject_name_en' : 'Calculus'}];
    $scope.Teacher = {'firstname_th' : 'มยุรี', 'lastname_en' : 'สิงห์สมุทร' , 'firstname_en' : 'Mayuree', 'lastname_en' : 'Singhasanoot'};
});