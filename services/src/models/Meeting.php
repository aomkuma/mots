<?php  

namespace App\Model;
class Meeting extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Meetings';
  	protected $primaryKey = 'meetingID';
  	public $timestamps = false;
    protected $fillable = array('meetingID'
                , 'standardID'
                , 'meetingName'
                , 'address'
                , 'startDate'
                , 'endDate'
                , 'startTime'
                , 'endTime'
                , 'meetingType'
                , 'ConvenedStatus'
                , 'sentEmailStatus'
                , 'emailSentDate'
                , 'isSendMail'
                , 'remark'
                , 'createBy'
                , 'createDate'
                , 'updateBy'
                , 'updateDate'
              );

  	public function meetingAttendees()
    {
  		return $this->hasMany('App\Model\MeetingAttendee', 'meetingID');
    }

    public function momFile()
    {
  		return $this->hasMany('App\Model\MOMFile', 'meetingID');
    }

    public function meetingFile()
    {
  		return $this->hasMany('App\Model\MeetingFile', 'meetingID');
    }

    public function inviteFile()
    {
  		return $this->hasMany('App\Model\InviteFile', 'meetingID');
    }
    
}
