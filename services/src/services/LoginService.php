<?php
    
    namespace App\Service;
    
    use App\Model\User;
    use App\Model\Admin;
    use App\Model\UserAccount;
    use App\Model\MailSubscribe;

    use Illuminate\Database\Capsule\Manager as DB;
    
    class LoginService {

        public static function forgotPassword($username){
            $model = User::where('email', $username)
                    ->first();
            if(!empty($model)){
                $newPassword = rand(10000000, 99999999);
                $model->password = $newPassword;
                $model->update();
                return $newPassword;
            }else{
                return 'invalid';
            }
        }
        
        public static function authenticate($username , $password){
            return User::select(DB::raw("Stakeholders.stakeholderID AS adminID")
                                , "Users.*"
                                , DB::raw("Stakeholders.nameThai AS name")
                                , DB::raw("Stakeholders.lastNameThai AS lastName")
                            )
                    ->join('Stakeholders', 'Stakeholders.stakeholderID', '=', 'Users.stakeholderID')
                    ->where('Users.email', $username)
                    ->where('Users.password',$password)
                    ->first();      
        }

        public static function authenticateAdmin($username , $password){
            return Admin::where('email', $username)->where('password',$password)->first();      
        }

        public static function authenticateBackend($username , $password){
            return UserAccount::where('email', $username)
                    ->where('password', $password)
                    ->first();      
        }

        public static function registerMember($obj){
            $obj['Password'] = rand(10000000, 99999999);
            //$obj['WifiPassword'] = rand(10000000, 99999999);
            $obj['CreateDate'] = date('Y-m-d H:i:s');
            $obj['Birthdate'] = $obj['YearOfBirth'] . '-' . $obj['MonthOfBirth']. '-' . $obj['DateOfBirth'];
            // echo $obj['Birthdate'];exit;
            $attendee = new Attendee;
            $attendee->Password = $obj['Password'];
            // $attendee->Wifi = $obj['Wifi'];
            $attendee->Firstname = $obj['Firstname'];
            $attendee->Lastname = $obj['Lastname'];
            $attendee->IDCard = (empty($obj['IDCard'])?' ':$obj['IDCard']);
            $attendee->Email = $obj['Email'];
            $attendee->Gender = $obj['Gender'];
            $attendee->Birthdate = $obj['Birthdate'];
            $attendee->Mobile = $obj['Mobile'];
            $attendee->AddressNo = $obj['AddressNo'];
            $attendee->Moo = $obj['Moo'];
            $attendee->Street = $obj['Street'];
            $attendee->Soi = $obj['Soi'];
            $attendee->Province = $obj['Province'];
            $attendee->SubProvince = $obj['SubProvince'];
            $attendee->District = $obj['District'];
            $attendee->Postcode = $obj['Postcode'];
            $attendee->CreateDate = $obj['CreateDate'];
            if($obj['RegisterType'] != ''){
                $attendee->RegisterType = $obj['RegisterType'];
            }
            $attendee->save($obj);
            return $attendee;      
        }

        public static function saveFrontRegister($obj){
            $obj['Password'] = rand(10000000, 99999999);
            $obj['CreateDate'] = date('Y-m-d H:i:s');
            // echo $obj['Birthdate'];exit;
            $attendee = new Attendee;
            $attendee->Password = $obj['Password'];
            $attendee->Firstname = $obj['Firstname'];
            $attendee->Lastname = $obj['Lastname'];
            $attendee->Mobile = $obj['Mobile'];
            $attendee->Email = $obj['Email'];
            $attendee->IDCard = (empty($obj['IDCard'])?' ':$obj['IDCard']);
            $attendee->RegisterType = 'MANUAL';
            $attendee->CreateDate = $obj['CreateDate'];
            $attendee->save($obj);

            $new_attendee = Attendee::find($attendee->UserID);
            return $new_attendee;      
        }        

        public static function getMenuList($GroupID){
            return Permission::where("GroupID" , "==", $GroupID)->get();
        }

        public static function checkDuplicateAdmin($Username){  
            $model = Admin::where('Username', $Username)->first();
            return !(empty($model));
        }

        public static function saveAdmin($obj){
            $model = new Admin;
            $model->AdminType = 'NORMAL';
            $model->Firstname = $obj['Firstname'];
            $model->Lastname = $obj['Lastname'];
            $model->Username = $obj['Username'];
            $model->Password = $obj['Password'];
            $model->CreateDate = date('Y-m-d H:i:s');
            return $model->save();
        }

        public static function addMailSubscribe($obj){
            $model = MailSubscribe::create($obj);
            return $model->id;
        }

        public static function checkDuplicateMailSubscribe($email){  
            $model = MailSubscribe::where('email', $email)->first();
            return !(empty($model));
        }

        public static function checkMailSubscribeLogin($email){  
            return MailSubscribe::where('email', $email)->first();
        }        
        
    }

?>