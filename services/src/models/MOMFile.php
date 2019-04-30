<?php  

namespace App\Model;
class MOMFile extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'MOM_Files';
  	protected $primaryKey = 'momFileID';
  	public $timestamps = false;
  	protected $fillable = array('momFileID'
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
