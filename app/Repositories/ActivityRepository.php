<?php

namespace App\Repositories;

use App\Models\Activity;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class ActivityRepository
 * @package App\Repositories
 * @version June 23, 2022, 3:35 pm UTC
 *
 * @method Activity findWithoutFail($id, $columns = ['*'])
 * @method Activity find($id, $columns = ['*'])
 * @method Activity first($columns = ['*'])
*/
class ActivityRepository extends BaseRepository
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
        return Activity::class;
    }
}
