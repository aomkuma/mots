<?php
    
    namespace App\Service;
    
    use App\Model\Email;
    use App\Model\EmailCommodity;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class EmailService {

        public static function getEmailDefault(){
            return Email::first();
        }

    	public static function getList(){
            return Email::all();
        }

        public static function getData($emailID){
            return Email::find($emailID);
        }

        public static function getEmailCommodityData($emailID){
            return EmailCommodity::select("Commodity_Standards.standardNameThai"
                                            , "Email_Commodity.*")
                    ->where('emailID', $emailID)
                    ->join("Commodity_Standards", 'Commodity_Standards.standardID', '=', 'Email_Commodity.standardID')
                    ->get();
        }

        public static function updateData($obj){
            if(empty($obj['emailID'])){
                $obj['createDate'] = date('Y-m-d H:i:s');
                $obj['updateDate'] = date('Y-m-d H:i:s');
                $model = Email::create($obj);
                return $model->emailID;
            }else{
                unset($obj['createBy']);
                $obj['updateDate'] = date('Y-m-d H:i:s');
                Email::where('emailID', $obj['emailID'])->update($obj);
                return $obj['emailID'];
            }
        }

        public static function updateEmailCommodityData($obj){
            $model = EmailCommodity::create($obj);
            return $model->emailCommodityID;
            
        }

        public static function removeData($emailID){
            EmailCommodity::where('emailID', $emailID)->delete();
            return Email::find($emailID)->delete();
        }

        public static function removeEmailCommodityData($emailCommodityID){
            return EmailCommodity::find($emailCommodityID)->delete();
        }

        public static function getEmailForgotPassword(){
            return Email::first();
        }

        public static function getEmailAcademicBord($standardID){
            return Email::join('Email_Commodity', 'Email_Commodity.emailID', '=' , 'Emails.emailID')
                        ->where("Email_Commodity.standardID", $standardID)
                        ->first();
        }

    }
