<?php

namespace App\Repositories;

use App\Models\ExtraGroupProuduct;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class ExtraGroupProuductRepository
 * @package App\Repositories
 * @version December 28, 2021, 12:38 pm UTC
 *
 * @method ExtraGroupProuduct findWithoutFail($id, $columns = ['*'])
 * @method ExtraGroupProuduct find($id, $columns = ['*'])
 * @method ExtraGroupProuduct first($columns = ['*'])
*/
class ExtraGroupProuductRepository extends BaseRepository
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
        return ExtraGroupProuduct::class;
    }
}
