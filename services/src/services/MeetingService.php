<?php
    
    namespace App\Service;
    
    use App\Model\Meeting;
    use App\Model\MeetingAttendee;
    use App\Model\InviteFile;
    use App\Model\MeetingFile;
    use App\Model\MOMFile;


    use Illuminate\Database\Capsule\Manager as DB;
    
    class MeetingService {

    	public static function getList($standardID){
            return Meeting::where('standardID', $standardID)
                    ->with('meetingAttendees')
                    ->with('momFile')
                    ->with('meetingFile')
                    ->with('inviteFile')
                    ->get();
        }

        public static function getListForHomepage($userID){
            return Meeting::where(function($query) use ($userID){
                            if(!empty($userID)){
                                $query->where('Meeting_attendees.attendeeID', $userID);
                            }
                        })
                        ->join("Meeting_attendees", 'Meeting_attendees.meetingID', '=', 'Meetings.meetingID')
                        ->groupBy('Meetings.meetingID')
                        ->with('momFile')
                        ->with('meetingFile')
                        ->with('inviteFile')
                        ->get();
        }

        public static function getData($meetingID){
            return Meeting::find($meetingID)
                    ->with('meetingAttendees')
                    ->with('momFile')
                    ->with('meetingFile')
                    ->with('inviteFile');
        }

        public static function getAttendee($meetingID){
            return MeetingAttendee::select("nameThai"
                        ,"lastNameThai"
                        ,"positionThai"
                        ,"Meeting_attendees.*")
                    ->where('Meeting_attendees.meetingID', $meetingID)
                    ->join("Stakeholders", "Stakeholders.stakeholderID", '=', "Meeting_attendees.attendeeID")
                    ->get();
        }

        public static function updateData($obj){
            if(empty($obj['meetingID'])){
                $obj['createDate'] = date('Y-m-d H:i:s');
                $obj['updateDate'] = date('Y-m-d H:i:s');
                $model = Meeting::create($obj);
                return $model->meetingID;
            }else{
                unset($obj['createBy']);
                $obj['updateDate'] = date('Y-m-d H:i:s');
                Meeting::where('meetingID', $obj['meetingID'])->update($obj);
                return $obj['meetingID'];
            }
        }

        public static function addMOMFile($obj){
            $model = MOMFile::create($obj);
                return $model->meetingFileID;
        }

        public static function addMeetingFile($obj){
            $model = MeetingFile::create($obj);
                return $model->meetingFileID;
        }

        public static function addAttendee($obj){
            $model = MeetingAttendee::create($obj);
                return $model;
        }

        public static function deleteAttendee($meetingAttendeeID){
                return MeetingAttendee::find($meetingAttendeeID)->delete();
                
        }

        public static function addInviteFile($obj){
            $model = InviteFile::create($obj);
                return $model->inviteFileID;
        }

        public static function removeMeetingFile($meetingFileID){
            return MeetingFile::find($meetingFileID)->delete();
        }

        public static function removeInviteFile($inviteFileID){
            return InviteFile::find($inviteFileID)->delete();
        }

        public static function removeData($meetingID){
            return Meeting::find($meetingID)->delete();
        }

        public static function getMeetingFile($meetingID){
            return MeetingFile::where('meetingID', $meetingID)->get();
        }        

    }
