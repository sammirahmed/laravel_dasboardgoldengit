<?php

namespace App\Repositories;

use App\Models\airplan;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class airplanRepository
 * @package App\Repositories
 * @version June 20, 2022, 10:28 pm UTC
 *
 * @method airplan findWithoutFail($id, $columns = ['*'])
 * @method airplan find($id, $columns = ['*'])
 * @method airplan first($columns = ['*'])
*/
class airplanRepository extends BaseRepository
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
        return airplan::class;
    }
}
