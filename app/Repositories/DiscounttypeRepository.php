<?php

namespace App\Repositories;

use App\Models\Discounttype;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class DiscounttypeRepository
 * @package App\Repositories
 * @version May 31, 2022, 12:51 pm UTC
 *
 * @method Discounttype findWithoutFail($id, $columns = ['*'])
 * @method Discounttype find($id, $columns = ['*'])
 * @method Discounttype first($columns = ['*'])
*/
class DiscounttypeRepository extends BaseRepository
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
        return Discounttype::class;
    }
}
