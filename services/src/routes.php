<?php
// Routes

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

//$app->get('/user/{id}', 'UserController:getUser');
$app->post('/login/', 'LoginController:authenticate');
$app->post('/login/backend/', 'LoginController:authenticateBackend');
$app->post('/forgot-password/', 'LoginController:forgotPassword');
$app->post('/subscribe/mail/register/', 'LoginController:registerMailSubscribe');
$app->post('/subscribe/mail/login/', 'LoginController:loginMailSubscribe');


$app->delete('/attach/delete/{id}', 'AttachFileController:removeAttachFile');

$app->post('/search/', 'SearchController:search');
$app->post('/advsearch/', 'SearchController:advsearch');

$app->post('/manage-main/list/', 'MainContentController:getList');
$app->post('/manage-main/update/', 'MainContentController:updateOrderNo');

$app->post('/autocomplete/', 'AutocompleteController:getAutocomplete');
$app->post('/masterfile/get/', 'MasterfileController:getMasterfile');
$app->post('/masterfile/add/', 'MasterfileController:addMasterfile');
$app->post('/masterfile/update/', 'MasterfileController:updateMasterfile');
$app->post('/masterfile/remove/', 'MasterfileController:deleteMasterfile');

$app->post('/commodity-standard/list/home/', 'CommodityStandardController:getListForHomepage');
$app->post('/commodity-standard/list/active/', 'CommodityStandardController:getListActive');
$app->post('/commodity-standard/list/', 'CommodityStandardController:getList');
$app->post('/commodity-standard/academic-board/list/', 'CommodityStandardController:getListAcademicBoard');
$app->post('/commodity-standard/search/', 'CommodityStandardController:getListSearch');
$app->post('/commodity-standard/plan/', 'CommodityStandardController:getListPlan');
$app->post('/commodity-standard/general/', 'CommodityStandardController:getListGeneral');
$app->post('/commodity-standard/mandatory/', 'CommodityStandardController:getListMandatory');
$app->post('/commodity-standard/get/', 'CommodityStandardController:getData');
$app->post('/commodity-standard/update/', 'CommodityStandardController:updateData');
$app->post('/commodity-standard/api/get/', 'CommodityStandardController:getDataAPI');
$app->post('/commodity-standard/list/replace/', 'CommodityStandardController:getListReplace');
$app->post('/commodity-standard/questionnaire/', 'CommodityStandardController:getListForQuestionnaire');
$app->post('/commodity-standard/list/in-use/', 'CommodityStandardController:getListInUse');


$app->post('/academic-board/list/', 'AcademicBoardController:getList');
$app->post('/academic-board/update/', 'AcademicBoardController:updateData');
$app->post('/academic-board/delete/', 'AcademicBoardController:deleteData');

$app->post('/meeting/list/', 'MeetingController:getList');
$app->post('/meeting/list/home/', 'MeetingController:getListForHomepage');
$app->post('/meeting/update/', 'MeetingController:updateData');
$app->post('/meeting/delete/', 'MeetingController:deleteData');
$app->post('/meeting/meeting-file/delete/', 'MeetingController:deleteMeetingData');
$app->post('/meeting/invite-file/delete/', 'MeetingController:deleteInviteData');
$app->post('/meeting/view/attendee/', 'MeetingController:viewAttendee');
$app->post('/meeting/add/attendee/', 'MeetingController:addAttendee');
$app->post('/meeting/delete/attendee/', 'MeetingController:removeAttendee');
$app->post('/meeting/upload/momfile/', 'MeetingController:uploadMOMFile');


$app->post('/stakeholder/list/', 'StakeholderController:getList');
$app->post('/stakeholder/get/', 'StakeholderController:getData');
$app->post('/stakeholder/update/', 'StakeholderController:updateData');
$app->post('/stakeholder/delete/', 'StakeholderController:deleteData');

$app->post('/subcommittee/list/active/', 'SubcommitteeController:getListActive');
$app->post('/subcommittee/list/', 'SubcommitteeController:getList');
$app->post('/subcommittee/get/', 'SubcommitteeController:getData');
$app->post('/subcommittee/update/', 'SubcommitteeController:updateData');
$app->post('/subcommittee/delete/', 'SubcommitteeController:deleteData');
$app->post('/subcommittee/person/delete/', 'SubcommitteeController:deleteSubcommitteePersonData');

$app->post('/user-account/list/admin/', 'UserAccountController:getAdminList');
$app->post('/user-account/get/admin/', 'UserAccountController:getAdminData');
$app->post('/user-account/update/admin/', 'UserAccountController:updateAdminData');
$app->post('/user-account/delete/admin/', 'UserAccountController:deleteAdminData');
$app->post('/user-account/list/user/', 'UserAccountController:getUserList');
$app->post('/user-account/get/user/', 'UserAccountController:getUserData');
$app->post('/user-account/update/user/', 'UserAccountController:updateUserData');
$app->post('/user-account/delete/user/', 'UserAccountController:deleteUserData');
$app->post('/user-account/list/user-account/', 'UserAccountController:getUserAccountList');
$app->post('/user-account/update/user-account/', 'UserAccountController:updateUserAccountData');

$app->post('/email/list/', 'EmailController:getList');
$app->post('/email/get/', 'EmailController:getData');
$app->post('/email/update/', 'EmailController:updateData');
$app->post('/email/delete/', 'EmailController:deleteData');
$app->post('/email/delete/commodity/', 'EmailController:deleteEmailCommodityData');

$app->post('/questionnaire/list/active/', 'QuestionController:getListActive');
$app->post('/questionnaire/list/', 'QuestionController:getList');
$app->post('/questionnaire/get/', 'QuestionController:getData');
$app->post('/questionnaire/update/', 'QuestionController:updateData');
$app->post('/questionnaire/delete/', 'QuestionController:deleteData');
$app->post('/questionnaire/list/standard/', 'QuestionController:getStandardList');
$app->post('/questionnaire/list/standard/question/', 'QuestionController:getStandardQuestionList');
$app->post('/questionnaire/person/list/', 'QuestionController:getListQuestionnairePerson');
$app->post('/questionnaire/person/update/', 'QuestionController:updateQuestionnairePerson');
$app->post('/questionnaire/person/delete/', 'QuestionController:deleteQuestionnairePerson');
$app->post('/questionnaire/question/delete/', 'QuestionController:deleteQuestion');
$app->post('/questionnaire/get/standard/', 'QuestionController:getDataByStandard');
$app->post('/questionnaire-response/update/', 'QuestionController:updateQuestionnaireResponseData');

$app->post('/menu/list/', 'MenuController:getMenuList');
$app->post('/menu/list/manage/', 'MenuController:getMenuListManage');
$app->post('/menu/get/', 'MenuController:getMenu');
$app->post('/menu/get/type/', 'MenuController:getMenuByType');
$app->post('/menu/update/', 'MenuController:updateMenu');
$app->post('/menu/update/page/', 'MenuController:updateMenuPage');
$app->post('/menu/page/get/', 'MenuController:getMenuPage');
$app->post('/menu/get/parent/', 'MenuController:getMenuParent');
$app->post('/menu/get/favourite/', 'MenuController:getMenuFavourite');

$app->post('/slideshow/view/', 'SlideShowController:getSlideShowView');
$app->post('/slideshow/', 'SlideShowController:getSlideShow');
$app->post('/slideshow/update/', 'SlideShowController:updateSlideShow');
$app->delete('/slideshow/delete/{id}', 'SlideShowController:removeSlideShow');

$app->post('/news/', 'NewsController:getNewsList');
$app->post('/news/home/', 'NewsController:getNewsListHomepage');
$app->post('/news/view/', 'NewsController:getNews');
$app->post('/news/update/', 'NewsController:updateNews');
$app->post('/news/delete/', 'NewsController:delNews');
$app->get('/news/rss/', 'NewsController:getNewsListRSS');
$app->post('/news/category/list/', 'NewsController:getNewsCategoryList');
$app->post('/news/category/update/', 'NewsController:updateNewsCategory');
$app->post('/news/category/delete/', 'NewsController:removeNews');

$app->post('/linkurl/', 'LinkUrlController:getLinkUrl');
$app->post('/linkurlView/', 'LinkUrlController:getLinkUrlView');
$app->post('/linkurl/update/', 'LinkUrlController:updateLinkUrl');
$app->delete('/linkurl/delete/{id}', 'LinkUrlController:removeLinkUrl');

$app->post('/palaces/list/', 'PalaceController:getList');
$app->post('/palaces/get/', 'PalaceController:getData');
$app->post('/palaces/get/minister/', 'PalaceController:getMinisterData');
$app->post('/palaces/current/', 'PalaceController:getPalaceCurrent');
$app->post('/palaces/update/', 'PalaceController:updateData');
$app->post('/palaces/update/sort/', 'PalaceController:updateSortData');
$app->delete('/palaces/delete/{id}', 'PalaceController:removePicture');

$app->post('/report/export/', 'ReportController:exportReport');

$app->post('/budget-disbursement/', 'BudgetDisbursementController:getList');
$app->post('/budget-disbursement/get/', 'BudgetDisbursementController:getData');
$app->post('/budget-disbursement/update/', 'BudgetDisbursementController:updateData');
$app->post('/budget-disbursement/delete/', 'BudgetDisbursementController:deleteData');

$app->post('/attachfile-multi/get/type/', 'AttachFileMultiController:getList');
$app->post('/attachfile-multi/get/master/', 'AttachFileMultiController:getMasterList');
$app->post('/attachfile-multi/update/', 'AttachFileMultiController:updateData');
$app->post('/attachfile-multi/update/active/', 'AttachFileMultiController:updateActiveStatus');
$app->post('/attachfile-multi/update/sort/', 'AttachFileMultiController:updateSortData');
$app->post('/attachfile-multi/delete/', 'AttachFileMultiController:deleteData');

$app->post('/listening/list/', 'ListeningController:getList');
$app->post('/listening/get/', 'ListeningController:getData');
$app->post('/listening/update/', 'ListeningController:updateData');
$app->post('/listening/comment/add/', 'ListeningController:updateComment');
$app->post('/listening/comment/view/', 'ListeningController:viewComment');

$app->post('/appeal/list/', 'AppealController:getList');
$app->post('/appeal/page/', 'AppealController:getPage');
$app->post('/appeal/update/', 'AppealController:updateData');
$app->post('/appeal/callback/', 'AppealController:callback');
$app->post('/appeal/report/', 'AppealController:report');

$app->post('/form-data1/list/', 'FormData1Controller:getList');
$app->post('/form-data1/list/iso/', 'FormData1Controller:getListIso');
$app->post('/form-data1/get/', 'FormData1Controller:getData');
$app->post('/form-data1/update/', 'FormData1Controller:updateData');
$app->post('/form-data1/update/iso/', 'FormData1Controller:updateIso');
$app->post('/form-data1/delete/', 'FormData1Controller:deleteData');

$app->post('/form-data1/operator/list/', 'FormData1Controller:getListOperator');
$app->post('/form-data1/operator/get/', 'FormData1Controller:getOperatorData');
$app->post('/form-data1/operator/update/', 'FormData1Controller:updateOperatorData');

$app->post('/form-data1/customer/list/', 'FormData1Controller:getListCustomer');
$app->post('/form-data1/customer/get/', 'FormData1Controller:getCustomerData');
$app->post('/form-data1/customer/update/', 'FormData1Controller:updateCustomerData');

$app->post('/seminar/list/', 'SeminarController:getList');
$app->post('/seminar/update/', 'SeminarController:updateData');
$app->post('/seminar/delete/', 'SeminarController:deleteData');
$app->post('/seminar/response/list/', 'SeminarController:getListResponse');
$app->post('/seminar/response/add/', 'SeminarController:addResponse');

$app->post('/purchase/list/', 'PurchaseController:getList');
$app->post('/purchase/update/', 'PurchaseController:updateData');
$app->post('/purchase/delete/', 'PurchaseController:deleteData');

$app->post('/media/list/', 'MediaController:getList');
$app->post('/media/update/', 'MediaController:updateData');
$app->post('/media/visit-count/update/', 'MediaController:updateVisitCountData');
$app->post('/media/video/delete/', 'MediaController:deleteVideoData');
$app->post('/media/delete/', 'MediaController:deleteData');

$app->post('/infographic/list/', 'InfographicController:getList');
$app->post('/infographic/update/', 'InfographicController:updateData');
$app->post('/infographic/visit-count/update/', 'InfographicController:updateVisitCountData');
$app->post('/infographic/delete/', 'InfographicController:deleteData');

$app->post('/contact-us/get/', 'ContactUsController:getData');
$app->post('/contact-us/update/', 'ContactUsController:updateData');

$app->post('/officer-contact/dep/list/', 'OfficerContactController:getDepList');
$app->post('/officer-contact/dep/update/', 'OfficerContactController:updateDepData');
$app->post('/officer-contact/dep/delete/', 'OfficerContactController:deleteDepData');
$app->post('/officer-contact/officer/list/', 'OfficerContactController:getOfficerList');
$app->post('/officer-contact/officer/update/', 'OfficerContactController:updateOfficerData');
$app->post('/officer-contact/officer/delete/', 'OfficerContactController:deleteOfficerData');

$app->post('/question-answer/list/', 'QuestionAnswerController:getList');
$app->post('/question-answer/question/update/', 'QuestionAnswerController:updateQuestionData');
$app->post('/question-answer/answer/update/', 'QuestionAnswerController:updateAnswerData');
$app->post('/question-answer/delete/', 'QuestionAnswerController:deleteData');

$app->post('/freq-question/list/', 'FreqQuestionController:getList');
$app->post('/freq-question/update/', 'FreqQuestionController:updateData');
$app->post('/freq-question/delete/', 'FreqQuestionController:deleteData');

$app->post('/meeting-result/list/', 'MeetingResultController:getList');
$app->post('/meeting-result/update/', 'MeetingResultController:updateData');

$app->post('/licensees/list/', 'LicenseesController:getList');
$app->post('/licensees/update/', 'LicenseesController:updateData');

$app->post('/product-code/list/', 'ProductCodeController:getList');
$app->post('/product-code/update/', 'ProductCodeController:updateData');

$app->post('/country-list/list/', 'CountryListController:getList');
$app->post('/country-list/update/', 'CountryListController:updateData');

$app->post('/certification-code/list/', 'CertificationCodeController:getList');
$app->post('/certification-code/update/', 'CertificationCodeController:updateData');

$app->post('/license-register/list/', 'LicenseRegisterController:getList');
$app->post('/license-register/get/', 'LicenseRegisterController:getData');
$app->post('/license-register/request/', 'LicenseRegisterController:requestData');
$app->post('/license-register/update/', 'LicenseRegisterController:updateData');

$app->post('/online-service/list/', 'OnlineServiceController:getList');
$app->post('/online-service/request/', 'OnlineServiceController:requestData');
$app->post('/online-service/update/', 'OnlineServiceController:updateData');

$app->post('/hearing-report/list/', 'HearingReportController:getList');
$app->post('/hearing-report/update/', 'HearingReportController:updateData');
$app->post('/website-survey/query/', 'HearingReportController:getWebsiteSurveyList');

$app->post('/fruit/list/', 'FruitController:getList');
$app->post('/fruit/update/', 'FruitController:updateData');
$app->post('/fruit/delete/', 'FruitController:deleteData');

$app->post('/warning/get/', 'WarningController:getData');

$app->post('/footer-link/list/', 'FooterLinkController:getList');
$app->post('/footer-link/list/view/', 'FooterLinkController:getListView');
$app->post('/footer-link/update/', 'FooterLinkController:updateData');
$app->post('/footer-link/delete/', 'FooterLinkController:deleteData');

$app->post('/user-role/list/', 'UserRoleController:getList');
$app->post('/user-role/get/', 'UserRoleController:getData');
$app->post('/user-role/update/', 'UserRoleController:updateData');

$app->post('/landing-page/list/view/', 'LandingPageController:getListView');
$app->post('/landing-page/list/', 'LandingPageController:getList');
$app->post('/landing-page/get/', 'LandingPageController:getData');
$app->post('/landing-page/update/', 'LandingPageController:updateData');
$app->get('/testmail', 'MeetingController:testmail');

$app->post('/video/list/', 'VideoController:getVideoList');
$app->post('/video/get/', 'VideoController:getVideo');
$app->post('/video/update/', 'VideoController:updateVideo');
$app->post('/video/delete/', 'VideoController:removeVideo');

$app->post('/question/list/', 'QuestionController:getQuestionList');
$app->post('/question/get/', 'QuestionController:getQuestion');
$app->post('/question/update/', 'QuestionController:updateQuestion');
$app->post('/question/delete/', 'QuestionController:removeQuestion');

$app->post('/services/list/', 'ServicesController:getServicesList');
$app->post('/services/update/', 'ServicesController:updateServices');
$app->post('/services/question/add/', 'ServicesController:addQuestion');

$app->post('/bannercontrol/get/', 'BannerControlController:getBannerControl');
$app->post('/bannercontrol/update/', 'BannerControlController:updateControl');

$app->post('/form-generator/list/', 'FormController:getList');
$app->post('/form-generator/save/', 'FormController:save');
$app->post('/form-generator/delete/', 'FormController:deleteData');
$app->post('/form-generator/listdetail/', 'FormController:getListdetail');
$app->post('/form-data/list/', 'FormController:getListByFormGeneratorID');
$app->post('/form-data/update/', 'FormController:updateFormData');

$app->post('/chart/', 'ChartController:getChart');

$app->post('/calendar/list/', 'CalendarController:getList');
// Default action
$app->get('/[{name}]', function ($request, $response, $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});
