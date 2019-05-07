<?php  

namespace App\Model;
class MeetingFile extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Meeting_Files';
  	protected $primaryKey = 'meetingFileID';
  	public $timestamps = false;
  	protected $fillable = array('meetingFileID'
                , 'standardID'
                , 'meetingID'
                , 'fileName'
                , 'filePath'
                , 'createBy'
                , 'createDate'
                , 'updateBy'
                , 'updateDate'
              );

    
}
