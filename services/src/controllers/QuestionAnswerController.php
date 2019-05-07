<?php

namespace App\Controller;

use App\Service\QuestionAnswerService;
use App\Service\EmailService;
use App\Controller\Mailer;

class QuestionAnswerController extends Controller {

    protected $logger;
    protected $db;

    public function __construct($logger, $db) {
        $this->logger = $logger;
        $this->db = $db;
    }

    public function getList($request, $response, $args) {
        try {
            $params = $request->getParsedBody();

            $_List = QuestionAnswerService::getList();

            $this->data_result['DATA'] = $_List;

            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

    public function updateQuestionData($request, $response, $args) {

        try {
            $params = $request->getParsedBody();
            $_Data = $params['obj']['Data'];


            $mail = $_Data['question_email'];
            foreach ($_Data as $key => $value) {
                if ($value == 'null') {
                    $_Data[$key] = '';
                }
            }
            $_Data['question_date'] = date('Y-m-d H:i:s');
            $id = QuestionAnswerService::updateData($_Data);

            $this->data_result['DATA']['id'] = $id;
////mail
            $email_settings = EmailService::getEmailDefault();
            // print_r($email_settings);exit;
            $mail_content = "ขอบคุณสำหรับคำถามที่ท่านได้แจ้งเข้ามา
เจ้าหน้าที่ได้รับข้อมูลของท่านแล้ว จะเร่งดำเนินการอย่างเร็วที่สุด"
            ;
            // exit;
            $mailer = new Mailer;
            $mailer->setMailHost('smtp.gmail.com');
            $mailer->setMailPort('465');
            $mailer->setMailUsername($email_settings->email);
            $mailer->setMailPassword($email_settings->password);
            $mailer->setSubject("กระทรวงการท่องเที่ยวและกีฬา  " );
            $mailer->setHTMLContent($mail_content);
            $mailer->isHtml(true);
            $mailer->setReceiver($mail);
            $res = $mailer->sendMail();
           ////
            $mailer2 = new Mailer;
            $mailer2->setMailHost('smtp.gmail.com');
            $mailer2->setMailPort('465');
            $mailer2->setMailUsername($email_settings->email);
            $mailer2->setMailPassword($email_settings->password);
            $mailer2->setSubject("กระทรวงการท่องเที่ยวและกีฬา  " );
            $mailer2->setHTMLContent('มีผู้ส่งคำถามในระบบ');
            $mailer2->isHtml(true);
            $mailer2->setReceiver('agilerap.helpdesk@gmail.com');
            $res2 = $mailer2->sendMail();

            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

    public function updateAnswerData($request, $response, $args) {

        try {
            $params = $request->getParsedBody();
            $_Data = $params['obj']['Data'];
            foreach ($_Data as $key => $value) {
                if ($value == 'null') {
                    $_Data[$key] = '';
                }
            }
            $_Data['answer_date'] = date('Y-m-d H:i:s');
            $id = QuestionAnswerService::updateData($_Data);

            $email_settings = EmailService::getEmailDefault();
            // print_r($email_settings);exit;
            $mail_content = "จากที่ท่านได้ส่งคำถามมาว่า " . $_Data['question_desc']
                    . "<br>ขออนุญาตเรียนตอบคำถามดังนี้ "
                    . "<br>" . $_Data['answer_desc']
            ;
            // exit;
            $mailer = new Mailer;
            $mailer->setMailHost('smtp.gmail.com');
            $mailer->setMailPort('465');
            $mailer->setMailUsername($email_settings->email);
            $mailer->setMailPassword($email_settings->password);
            $mailer->setSubject("คำตอบแบบสอบถามของคุณ " . $_Data['question_by']);
            $mailer->setHTMLContent($mail_content);
            $mailer->isHtml(true);
            $mailer->setReceiver($_Data['question_email']);
            $res = $mailer->sendMail();
            if ($res) {
                $status = 'Sent mail Room success';
            } else {
                // print_r($res);
                // exit;
                $status = 'Sent mail Room failed' . $res;
            }
            // exit;
            $this->data_result['DATA']['id'] = $status;

            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

    public function deleteData($request, $response, $args) {

        try {
            $params = $request->getParsedBody();
            $id = $params['obj']['id'];

            $result = QuestionAnswerService::removeData($id);

            $this->data_result['DATA']['result'] = $result;

            return $this->returnResponse(200, $this->data_result, $response, false);
        } catch (\Exception $e) {
            return $this->returnSystemErrorResponse($this->logger, $this->data_result, $e, $response);
        }
    }

}
