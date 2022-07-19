<?php

namespace App\Repositories;

use App\Models\MainCategorie;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class MainCategorieRepository
 * @package App\Repositories
 * @version December 22, 2021, 11:17 pm UTC
 *
 * @method MainCategorie findWithoutFail($id, $columns = ['*'])
 * @method MainCategorie find($id, $columns = ['*'])
 * @method MainCategorie first($columns = ['*'])
*/
class MainCategorieRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name',
        'description'
        ,'offer'
        ,'background_color'

    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return MainCategorie::class;
    }
}
