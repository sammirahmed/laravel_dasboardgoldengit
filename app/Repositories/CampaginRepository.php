<?php

namespace App\Repositories;

use App\Models\Campagin;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class CampaginRepository
 * @package App\Repositories
 * @version February 2, 2022, 10:28 pm UTC
 *
 * @method Campagin findWithoutFail($id, $columns = ['*'])
 * @method Campagin find($id, $columns = ['*'])
 * @method Campagin first($columns = ['*'])
*/
class CampaginRepository extends BaseRepository
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
        return Campagin::class;
    }
}
