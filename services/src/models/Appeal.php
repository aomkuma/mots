<?php  

namespace App\Model;
class Appeal extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Appeal';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
                , 'page_type'
                , 'firstname'
                , 'lastname'
                , 'tel'
                , 'email'
                , 'address'
                , 'mobile'
                , 'province'
                , 'postcode'
                , 'callback'
                , 'callback_type'
                , 'team_to_comment'
                , 'appeal_type'
                , 'description'
                , 'description_filename'
                , 'description_filepath'
                , 'create_date'
              );

    public function appealList()
    {
     return $this->hasMany('App\Model\AppealList', 'appeal_id');
    }

    public function appealCallback()
    {
     return $this->hasMany('App\Model\AppealCallback', 'appeal_id');
    }
}