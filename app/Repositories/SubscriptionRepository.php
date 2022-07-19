<?php

namespace App\Repositories;

use App\Models\Subscription;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class SubscriptionRepository
 * @package App\Repositories
 * @version June 23, 2022, 3:34 pm UTC
 *
 * @method Subscription findWithoutFail($id, $columns = ['*'])
 * @method Subscription find($id, $columns = ['*'])
 * @method Subscription first($columns = ['*'])
*/
class SubscriptionRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'user_id',
        'package_id',
        'service_id',
        'cycle_id',
        'expires_at',
        'suspended_at',
        'interval',
        'status'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Subscription::class;
    }
}
