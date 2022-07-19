<?php

use Faker\Factory as Faker;
use App\Models\ExtraPruduct;
use App\Repositories\ExtraPruductRepository;

trait MakeExtraPruductTrait
{
    /**
     * Create fake instance of ExtraPruduct and save it in database
     *
     * @param array $extraPruductFields
     * @return ExtraPruduct
     */
    public function makeExtraPruduct($extraPruductFields = [])
    {
        /** @var ExtraPruductRepository $extraPruductRepo */
        $extraPruductRepo = App::make(ExtraPruductRepository::class);
        $theme = $this->fakeExtraPruductData($extraPruductFields);
        return $extraPruductRepo->create($theme);
    }

    /**
     * Get fake instance of ExtraPruduct
     *
     * @param array $extraPruductFields
     * @return ExtraPruduct
     */
    public function fakeExtraPruduct($extraPruductFields = [])
    {
        return new ExtraPruduct($this->fakeExtraPruductData($extraPruductFields));
    }

    /**
     * Get fake data of ExtraPruduct
     *
     * @param array $postFields
     * @return array
     */
    public function fakeExtraPruductData($extraPruductFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $extraPruductFields);
    }
}
