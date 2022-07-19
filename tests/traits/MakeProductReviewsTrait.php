<?php

use Faker\Factory as Faker;
use App\Models\ProductReviews;
use App\Repositories\ProductReviewsRepository;

trait MakeProductReviewsTrait
{
    /**
     * Create fake instance of ProductReviews and save it in database
     *
     * @param array $productReviewsFields
     * @return ProductReviews
     */
    public function makeProductReviews($productReviewsFields = [])
    {
        /** @var ProductReviewsRepository $productReviewsRepo */
        $productReviewsRepo = App::make(ProductReviewsRepository::class);
        $theme = $this->fakeProductReviewsData($productReviewsFields);
        return $productReviewsRepo->create($theme);
    }

    /**
     * Get fake instance of ProductReviews
     *
     * @param array $productReviewsFields
     * @return ProductReviews
     */
    public function fakeProductReviews($productReviewsFields = [])
    {
        return new ProductReviews($this->fakeProductReviewsData($productReviewsFields));
    }

    /**
     * Get fake data of ProductReviews
     *
     * @param array $postFields
     * @return array
     */
    public function fakeProductReviewsData($productReviewsFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $productReviewsFields);
    }
}
