<?php

use Faker\Factory as Faker;
use App\Models\ExtraGroupProuduct;
use App\Repositories\ExtraGroupProuductRepository;

trait MakeExtraGroupProuductTrait
{
    /**
     * Create fake instance of ExtraGroupProuduct and save it in database
     *
     * @param array $extraGroupProuductFields
     * @return ExtraGroupProuduct
     */
    public function makeExtraGroupProuduct($extraGroupProuductFields = [])
    {
        /** @var ExtraGroupProuductRepository $extraGroupProuductRepo */
        $extraGroupProuductRepo = App::make(ExtraGroupProuductRepository::class);
        $theme = $this->fakeExtraGroupProuductData($extraGroupProuductFields);
        return $extraGroupProuductRepo->create($theme);
    }

    /**
     * Get fake instance of ExtraGroupProuduct
     *
     * @param array $extraGroupProuductFields
     * @return ExtraGroupProuduct
     */
    public function fakeExtraGroupProuduct($extraGroupProuductFields = [])
    {
        return new ExtraGroupProuduct($this->fakeExtraGroupProuductData($extraGroupProuductFields));
    }

    /**
     * Get fake data of ExtraGroupProuduct
     *
     * @param array $postFields
     * @return array
     */
    public function fakeExtraGroupProuductData($extraGroupProuductFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $extraGroupProuductFields);
    }
}
