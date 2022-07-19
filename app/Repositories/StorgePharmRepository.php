<?php

namespace App\Repositories;

use App\Models\StorgePharm;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class StorgePharmRepository
 * @package App\Repositories
 * @version December 28, 2021, 1:57 pm UTC
 *
 * @method StorgePharm findWithoutFail($id, $columns = ['*'])
 * @method StorgePharm find($id, $columns = ['*'])
 * @method StorgePharm first($columns = ['*'])
*/
class StorgePharmRepository extends BaseRepository
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
        return StorgePharm::class;
    }
}
