<?php

use Faker\Factory as Faker;
use App\Models\Brands;
use App\Repositories\BrandsRepository;

trait MakeBrandsTrait
{
    /**
     * Create fake instance of Brands and save it in database
     *
     * @param array $brandsFields
     * @return Brands
     */
    public function makeBrands($brandsFields = [])
    {
        /** @var BrandsRepository $brandsRepo */
        $brandsRepo = App::make(BrandsRepository::class);
        $theme = $this->fakeBrandsData($brandsFields);
        return $brandsRepo->create($theme);
    }

    /**
     * Get fake instance of Brands
     *
     * @param array $brandsFields
     * @return Brands
     */
    public function fakeBrands($brandsFields = [])
    {
        return new Brands($this->fakeBrandsData($brandsFields));
    }

    /**
     * Get fake data of Brands
     *
     * @param array $postFields
     * @return array
     */
    public function fakeBrandsData($brandsFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'name' => $fake->word,
            'description' => $fake->word,
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $brandsFields);
    }
}
