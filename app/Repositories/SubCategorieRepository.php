<?php

namespace App\Repositories;

use App\Models\SubCategorie;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class SubCategorieRepository
 * @package App\Repositories
 * @version December 24, 2021, 3:58 pm UTC
 *
 * @method SubCategorie findWithoutFail($id, $columns = ['*'])
 * @method SubCategorie find($id, $columns = ['*'])
 * @method SubCategorie first($columns = ['*'])
*/
class SubCategorieRepository extends BaseRepository
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
        return SubCategorie::class;
    }
    public function allsubbymain($id)
    {
        return SubCategorie::where('main_categories_id',$id)->get();
    }
}
