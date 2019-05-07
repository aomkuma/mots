<?php  

namespace App\Model;
class Fruit extends \Illuminate\Database\Eloquent\Model {  
  	protected $table = 'Fruit';
  	protected $primaryKey = 'id';
  	public $timestamps = false;
  	protected $fillable = array('id'
  							, 'name_th'
  							, 'name_en'
  							, 'name_science'
  							, 'color_th'
  							, 'color_en'
  							, 'flavour_th'
                , 'flavour_en'
                , 'shape_th'
                , 'shape_en'
                , 'season_from'
                , 'season_to'
                , 'prepare_to_eat_th'
                , 'prepare_to_eat_en'
                , 'usage_th'
                , 'usage_en'
                , 'storage_th'
                , 'storage_en'
                , 'energy'
                , 'protein'
                , 'fat'
                , 'carbohydrate'
                , 'fiber'
                , 'calcium'
                , 'phosphorus'
                , 'steel'
                , 'potassium'
                , 'magnesium'
                , 'vitamin_e'
                , 'vitamin_b_ty_amine'
                , 'vitamin_b_riboflavin'
                , 'vitamin_b1_b2'
                , 'vitamin_c'
                , 'niacin'
                , 'create_date'
                , 'update_date'
  						);
    
}