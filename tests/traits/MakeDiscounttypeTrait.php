<?php

use Faker\Factory as Faker;
use App\Models\Discounttype;
use App\Repositories\DiscounttypeRepository;

trait MakeDiscounttypeTrait
{
    /**
     * Create fake instance of Discounttype and save it in database
     *
     * @param array $discounttypeFields
     * @return Discounttype
     */
    public function makeDiscounttype($discounttypeFields = [])
    {
        /** @var DiscounttypeRepository $discounttypeRepo */
        $discounttypeRepo = App::make(DiscounttypeRepository::class);
        $theme = $this->fakeDiscounttypeData($discounttypeFields);
        return $discounttypeRepo->create($theme);
    }

    /**
     * Get fake instance of Discounttype
     *
     * @param array $discounttypeFields
     * @return Discounttype
     */
    public function fakeDiscounttype($discounttypeFields = [])
    {
        return new Discounttype($this->fakeDiscounttypeData($discounttypeFields));
    }

    /**
     * Get fake data of Discounttype
     *
     * @param array $postFields
     * @return array
     */
    public function fakeDiscounttypeData($discounttypeFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $discounttypeFields);
    }
}
