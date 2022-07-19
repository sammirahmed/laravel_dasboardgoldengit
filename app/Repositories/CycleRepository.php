<?php

namespace App\Repositories;

use App\Models\Cycle;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class CycleRepository
 * @package App\Repositories
 * @version June 23, 2022, 3:33 pm UTC
 *
 * @method Cycle findWithoutFail($id, $columns = ['*'])
 * @method Cycle find($id, $columns = ['*'])
 * @method Cycle first($columns = ['*'])
*/
class CycleRepository extends BaseRepository
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
        return Cycle::class;
    }
}
