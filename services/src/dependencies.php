<?php
// DIC configuration

$container = $app->getContainer();

// view renderer
$container['renderer'] = function ($c) {
    $settings = $c->get('settings')['renderer'];
    return new Slim\Views\PhpRenderer($settings['template_path']);
};

// monolog
$container['logger'] = function ($c) {
    $settings = $c->get('settings')['logger'];
    $logger = new Monolog\Logger($settings['name']);
    $logger->pushProcessor(new Monolog\Processor\UidProcessor());
    $logger->pushHandler(new Monolog\Handler\StreamHandler($settings['path'], $settings['level']));
    $logger->pushHandler(new Monolog\Handler\RotatingFileHandler($settings['path'], $settings['maxFiles'], $settings['level']));
    return $logger;
};

$container['db'] = function ($c) {
    $settings = $c->get('settings')['db'];
    $capsule = new Illuminate\Database\Capsule\Manager;
    $capsule->addConnection($settings);
    $capsule->setAsGlobal();
    $capsule->bootEloquent();
    return $capsule;
};

$container['Mailer'] = function ($c) {
    return new \App\Controller\Mailer($c->get('logger'));
};

$container['LoginController'] = function ($c) {
    return new \App\Controller\LoginController($c->get('logger'), $c->get('db'));
};

$container['CommodityStandardController'] = function ($c) {
    return new \App\Controller\CommodityStandardController($c->get('logger'), $c->get('db'));
};

$container['AutocompleteController'] = function ($c) {
    return new \App\Controller\AutocompleteController($c->get('logger'), $c->get('db'));
};

$container['AcademicBoardController'] = function ($c) {
    return new \App\Controller\AcademicBoardController($c->get('logger'), $c->get('db'));
};

$container['MeetingController'] = function ($c) {
    return new \App\Controller\MeetingController($c->get('logger'), $c->get('db'));
};

$container['StakeholderController'] = function ($c) {
    return new \App\Controller\StakeholderController($c->get('logger'), $c->get('db'));
};

$container['UserAccountController'] = function ($c) {
    return new \App\Controller\UserAccountController($c->get('logger'), $c->get('db'));
};

$container['EmailController'] = function ($c) {
    return new \App\Controller\EmailController($c->get('logger'), $c->get('db'));
};

$container['QuestionController'] = function ($c) {
    return new \App\Controller\QuestionController($c->get('logger'), $c->get('db'));
};

$container['MasterfileController'] = function ($c) {
    return new \App\Controller\MasterfileController($c->get('logger'), $c->get('db'));
};

$container['SubcommitteeController'] = function ($c) {
    return new \App\Controller\SubcommitteeController($c->get('logger'), $c->get('db'));
};

$container['MenuController'] = function ($c) {
    return new \App\Controller\MenuController($c->get('logger'), $c->get('db'));
};

$container['SlideShowController'] = function ($c) {
    return new \App\Controller\SlideShowController($c->get('logger'), $c->get('db'));
};

$container['NewsController'] = function ($c) {
    return new \App\Controller\NewsController($c->get('logger'), $c->get('db'));
};

$container['LinkUrlController'] = function ($c) {
    return new \App\Controller\LinkUrlController($c->get('logger'), $c->get('db'));
};

$container['PalaceController'] = function ($c) {
    return new \App\Controller\PalaceController($c->get('logger'), $c->get('db'));
};

$container['ReportController'] = function ($c) {
    return new \App\Controller\ReportController($c->get('logger'), $c->get('db'));
};

$container['BudgetDisbursementController'] = function ($c) {
    return new \App\Controller\BudgetDisbursementController($c->get('logger'), $c->get('db'));
};

$container['AttachFileMultiController'] = function ($c) {
    return new \App\Controller\AttachFileMultiController($c->get('logger'), $c->get('db'));
};

$container['ListeningController'] = function ($c) {
    return new \App\Controller\ListeningController($c->get('logger'), $c->get('db'));
};

$container['AppealController'] = function ($c) {
    return new \App\Controller\AppealController($c->get('logger'), $c->get('db'));
};

$container['FormData1Controller'] = function ($c) {
    return new \App\Controller\FormData1Controller($c->get('logger'), $c->get('db'));
};

$container['AttachFileController'] = function ($c) {
    return new \App\Controller\AttachFileController($c->get('logger'), $c->get('db'));
};

$container['SeminarController'] = function ($c) {
    return new \App\Controller\SeminarController($c->get('logger'), $c->get('db'));
};

$container['PurchaseController'] = function ($c) {
    return new \App\Controller\PurchaseController($c->get('logger'), $c->get('db'));
};

$container['MediaController'] = function ($c) {
    return new \App\Controller\MediaController($c->get('logger'), $c->get('db'));
};

$container['InfographicController'] = function ($c) {
    return new \App\Controller\InfographicController($c->get('logger'), $c->get('db'));
};

$container['FreqQuestionController'] = function ($c) {
    return new \App\Controller\FreqQuestionController($c->get('logger'), $c->get('db'));
};

$container['ContactUsController'] = function ($c) {
    return new \App\Controller\ContactUsController($c->get('logger'), $c->get('db'));
};

$container['OfficerContactController'] = function ($c) {
    return new \App\Controller\OfficerContactController($c->get('logger'), $c->get('db'));
};

$container['QuestionAnswerController'] = function ($c) {
    return new \App\Controller\QuestionAnswerController($c->get('logger'), $c->get('db'));
};

$container['MeetingResultController'] = function ($c) {
    return new \App\Controller\MeetingResultController($c->get('logger'), $c->get('db'));
};

$container['LicenseesController'] = function ($c) {
    return new \App\Controller\LicenseesController($c->get('logger'), $c->get('db'));
};

$container['ProductCodeController'] = function ($c) {
    return new \App\Controller\ProductCodeController($c->get('logger'), $c->get('db'));
};

$container['CountryListController'] = function ($c) {
    return new \App\Controller\CountryListController($c->get('logger'), $c->get('db'));
};

$container['CertificationCodeController'] = function ($c) {
    return new \App\Controller\CertificationCodeController($c->get('logger'), $c->get('db'));
};

$container['SearchController'] = function ($c) {
    return new \App\Controller\SearchController($c->get('logger'), $c->get('db'));
};

$container['LicenseRegisterController'] = function ($c) {
    return new \App\Controller\LicenseRegisterController($c->get('logger'), $c->get('db'));
};

$container['OnlineServiceController'] = function ($c) {
    return new \App\Controller\OnlineServiceController($c->get('logger'), $c->get('db'));
};

$container['HearingReportController'] = function ($c) {
    return new \App\Controller\HearingReportController($c->get('logger'), $c->get('db'));
};

$container['FruitController'] = function ($c) {
    return new \App\Controller\FruitController($c->get('logger'), $c->get('db'));
};

$container['WarningController'] = function ($c) {
    return new \App\Controller\WarningController($c->get('logger'), $c->get('db'));
};

$container['FooterLinkController'] = function ($c) {
    return new \App\Controller\FooterLinkController($c->get('logger'), $c->get('db'));
};

$container['UserRoleController'] = function ($c) {
    return new \App\Controller\UserRoleController($c->get('logger'), $c->get('db'));
};

$container['LandingPageController'] = function ($c) {
    return new \App\Controller\LandingPageController($c->get('logger'), $c->get('db'));
};

$container['VideoController'] = function ($c) {
    return new \App\Controller\VideoController($c->get('logger'), $c->get('db'));
};

$container['ServicesController'] = function ($c) {
    return new \App\Controller\ServicesController($c->get('logger'), $c->get('db'));
};

$container['MainContentController'] = function ($c) {
    return new \App\Controller\MainContentController($c->get('logger'), $c->get('db'));
};
$container['BannerControlController'] = function ($c) {
    return new \App\Controller\BannerControlController($c->get('logger'), $c->get('db'));
};
$container['ChartController'] = function ($c) {
    return new \App\Controller\ChartController($c->get('logger'), $c->get('db'));
};
$container['FormController'] = function ($c) {
    return new \App\Controller\FormController($c->get('logger'), $c->get('db'));
};
$container['CalendarController'] = function ($c) {
    return new \App\Controller\CalendarController($c->get('logger'), $c->get('db'));
};

