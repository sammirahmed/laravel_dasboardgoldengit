<?php

namespace App\Repositories;

use App\Models\ProudctCopon;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class ProudctCoponRepository
 * @package App\Repositories
 * @version May 31, 2022, 12:24 pm UTC
 *
 * @method ProudctCopon findWithoutFail($id, $columns = ['*'])
 * @method ProudctCopon find($id, $columns = ['*'])
 * @method ProudctCopon first($columns = ['*'])
*/
class ProudctCoponRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name',
        'price',
        'discount_price',
        'description',
        'rules',
        'code',
        'oneplusone',
        'showoldprice',
        'featured',
        'brand_id',
        'refunduble',
        'brand_id',
        'showpercent',
        'showprice',
        'discount_type',
        //'restaurant_id',
        'category_id'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return ProudctCopon::class;
    }
}
