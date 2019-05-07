<?php  

namespace App\Model;
class CommodityStandard extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Commodity_Standards';
  	protected $primaryKey = 'standardID';
  	public $timestamps = false;
  	protected $fillable = array('years'
  							, 'standardNameThai'
  							, 'standardNameEng'
  							, 'standardType'
  							, 'standardCategory'
  							, 'productType'
  							, 'noThai'
  							, 'bookNumberThai'
  							, 'noEng'
  							, 'bookNumberEng'
  							, 'detail'
  							, 'step'
  							, 'status'
                , 'standardFileName'
  							, 'standardFilePath'
                , 'standardFileNameEN'
                , 'standardFilePathEN'
                , 'academicBoardName'
                , 'standardDefineType'
                , 'standardPublishingType'
                , 'standardGroup'
                , 'secondaryCode'
                , 'accreditationScope'
                , 'useDate'
                , 'cancelledDate'
                , 'createBy'
                , 'createDate'
                , 'updateBy'
                , 'updateDate'
  						);
  	// public function attachFiles()
   //  {
  	// 	return $this->hasMany('App\Model\AttachFile', 'parent_id');
   //  }

    public function academicBoard()
    {
     return $this->hasMany('App\Model\AcademicBoard', 'standardID');
    }

    public function meeting()
    {
     return $this->hasMany('App\Model\Meeting', 'standardID');
    }
}
