<?php

namespace App\Controller;

use PHPMailer;

class Mailer
{
    protected $logger;
    protected $mailer;

    public function __construct($logger)
    {
        
        //include '../src/settings_var.php';

        $this->logger = $logger;
        $this->mailer = new PHPMailer;

        $this->mailer->CharSet = 'UTF-8';
        # gmail
        $this->mailer->IsSMTP();
        //$mail -> SMTPSecure = "ssl";
        // $MAIL_HOST = "smtp.gmail.com";
        // $MAIL_PORT = "465";
        // $MAIL_USERNAME = "dpo.portal@gmail.com";
        // $MAIL_PASSWORD = "Dportal@123";
        // $MAIL_FROM = "dpo.portal@gmail.com";
        // $MAIL_FROMNAME = "d-Portal";

        // if($MAIL_PORT == '465'){
        //     $this->mailer->SMTPDebug = 2;
        //     $this->mailer->SMTPAuth   = true;     
        //     $this->mailer->SMTPSecure = "ssl";     
        // }else{
        //     $this->mailer->SMTPDebug = 2;
        //     $this->mailer->SMTPSecure = false;
        //     $this->mailer->SMTPAuth = false; 
        //     $this->mailer->SMTPAutoTLS = false;

        //     // $this->mailer->SMTPAuth = false;
        //     // $this->mailer->SMTPSecure = false;
        //     $this->mailer->SMTPOptions = array(
        //         'ssl' => array(
        //             'verify_peer' => false,
        //             'verify_peer_name' => false,
        //             'allow_self_signed' => true
        //         )
        //     );
        // }
        // $this->mailer->Host = $this->MAIL_HOST;//"smtp.gmail.com";
        // $this->mailer->Port = $this->MAIL_PORT;//465;
        // $this->mailer->Username = $this->MAIL_USERNAME;//"korapotu@gmail.com";
        // $this->mailer->Password = $this->MAIL_PASSWORD;

        // $this->mailer->From = $this->MAIL_USERNAME;//"korapotu@gmail.com";
        // $this->mailer->FromName = $this->MAIL_USERNAME;//"Aom";
        // $this->logger->info('mail host : '.$MAIL_HOST);

    }

    public function setMailHost($data){
        $this->mailer->Host = $data;
        // $this->mailer->Host = 'tls://mail.acfs.go.th:587';
    }

    public function setMailPort($data){
        $this->mailer->Port = $data;
        if($data == '465'){
            // $this->mailer->SMTPDebug = 2;
            $this->mailer->SMTPAuth   = true;     
            $this->mailer->SMTPSecure = "ssl";     
        }else if($data == '587'){
            // $this->mailer->SMTPDebug = 2;
            $this->mailer->SMTPSecure = 'tls';
            $this->mailer->SMTPAuth = true;
            $this->mailer->SMTPOptions = array(
                'ssl' => array(
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            );
        }else{
            $this->mailer->SMTPDebug = 2;
            $this->mailer->SMTPSecure = false;
            $this->mailer->SMTPAuth = false; 
            $this->mailer->SMTPAutoTLS = false;

            // $this->mailer->SMTPAuth = false;
            // $this->mailer->SMTPSecure = false;
            $this->mailer->SMTPOptions = array(
                'ssl' => array(
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            );
        }
        
    }

    public function setMailUsername($data){
        $this->mailer->Username = $data;
        $this->mailer->From = $data;
        $this->mailer->FromName = $data;

        $this->mailer->From = $data;
        $this->mailer->FromName = 'Ministry of Tourism and Sports';
    }

    public function setMailPassword($data){
        $this->mailer->Password = $data;
    }

    public function setSubject($subject){
        $this->mailer->Subject = $subject;
    }

    public function setReceiver($receiver){
        $this->mailer->AddAddress($receiver);
    }

    public function isHtml($status){
        $this->mailer->IsHTML($status); 
    }

    public function setHTMLContent($htmlContent){
        $this->mailer->MsgHTML($htmlContent); 
    }

    public function addAttachFile($file, $newName = ''){
        $this->mailer->AddAttachment($file, $newName);
    }
    
    public function sendMail(){
        
        return $this->mailer->send();
        
    }
    
}