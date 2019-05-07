<?php  

namespace App\Model;
class InviteFile extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Invite_Files';
  	protected $primaryKey = 'inviteFileID';
  	public $timestamps = false;
  	protected $fillable = array('inviteFileID'
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
