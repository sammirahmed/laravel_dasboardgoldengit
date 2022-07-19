<?php

namespace App\Repositories;

use App\Models\ExtraPruduct;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class ExtraPruductRepository
 * @package App\Repositories
 * @version December 30, 2021, 4:34 pm UTC
 *
 * @method ExtraPruduct findWithoutFail($id, $columns = ['*'])
 * @method ExtraPruduct find($id, $columns = ['*'])
 * @method ExtraPruduct first($columns = ['*'])
*/
class ExtraPruductRepository extends BaseRepository
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
        return ExtraPruduct::class;
    }
}
