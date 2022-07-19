<?php

namespace App\Repositories;

use App\Models\Airport;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class AirportRepository
 * @package App\Repositories
 * @version July 17, 2022, 2:28 pm UTC
 *
 * @method Airport findWithoutFail($id, $columns = ['*'])
 * @method Airport find($id, $columns = ['*'])
 * @method Airport first($columns = ['*'])
*/
class AirportRepository extends BaseRepository
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
        return Airport::class;
    }
}
