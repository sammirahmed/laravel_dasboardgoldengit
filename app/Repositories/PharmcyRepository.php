<?php

namespace App\Repositories;

use App\Models\Pharmcy;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class PharmcyRepository
 * @package App\Repositories
 * @version December 25, 2021, 12:54 pm UTC
 *
 * @method Pharmcy findWithoutFail($id, $columns = ['*'])
 * @method Pharmcy find($id, $columns = ['*'])
 * @method Pharmcy first($columns = ['*'])
*/
class PharmcyRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Pharmcy::class;
    }

    public function groupedByPharmcys()
    {
        $foods = [];
        foreach ($this->all() as $model) {
            if(!empty($model->restaurant)){
                $foods[$model->restaurant->name][$model->id] = $model->name;
            }
        }
        return $foods;
    }
}
