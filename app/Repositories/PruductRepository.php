<?php

namespace App\Repositories;

use App\Models\Pruduct;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class PruductRepository
 * @package App\Repositories
 * @version December 24, 2021, 11:32 pm UTC
 *
 * @method Pruduct findWithoutFail($id, $columns = ['*'])
 * @method Pruduct find($id, $columns = ['*'])
 * @method Pruduct first($columns = ['*'])
*/
class PruductRepository extends BaseRepository
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
        return Pruduct::class;
    }
}
