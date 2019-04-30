<?php  

namespace App\Model;
class MeetingAttendee extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Meeting_attendees';
  	protected $primaryKey = 'meetingAttendeeID';
  	public $timestamps = false;
  	protected $fillable = array(
                //'meetingAttendeeID',
                'attendeeID'
                , 'meetingID'
                , 'standardID'
                , 'createBy'
                , 'createDate'
                , 'updateBy'
                , 'updateDate'
              );

    
}
