<?php

namespace App\Repositories;

use App\Models\ProductReviews;
use InfyOm\Generator\Common\BaseRepository;

/**
 * Class ProductReviewsRepository
 * @package App\Repositories
 * @version December 30, 2021, 6:24 pm UTC
 *
 * @method ProductReviews findWithoutFail($id, $columns = ['*'])
 * @method ProductReviews find($id, $columns = ['*'])
 * @method ProductReviews first($columns = ['*'])
*/
class ProductReviewsRepository extends BaseRepository
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
        return ProductReviews::class;
    }
}
