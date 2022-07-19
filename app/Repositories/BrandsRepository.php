<?php

namespace App\Repositories;

use App\Models\Brands;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class BrandsRepository
 * @package App\Repositories
 * @version December 22, 2021, 1:11 am UTC
 *
 * @method Brands findWithoutFail($id, $columns = ['*'])
 * @method Brands find($id, $columns = ['*'])
 * @method Brands first($columns = ['*'])
*/
class BrandsRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name',
        'description'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Brands::class;
    }
}
