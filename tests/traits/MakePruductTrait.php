<?php

use Faker\Factory as Faker;
use App\Models\Pruduct;
use App\Repositories\PruductRepository;

trait MakePruductTrait
{
    /**
     * Create fake instance of Pruduct and save it in database
     *
     * @param array $pruductFields
     * @return Pruduct
     */
    public function makePruduct($pruductFields = [])
    {
        /** @var PruductRepository $pruductRepo */
        $pruductRepo = App::make(PruductRepository::class);
        $theme = $this->fakePruductData($pruductFields);
        return $pruductRepo->create($theme);
    }

    /**
     * Get fake instance of Pruduct
     *
     * @param array $pruductFields
     * @return Pruduct
     */
    public function fakePruduct($pruductFields = [])
    {
        return new Pruduct($this->fakePruductData($pruductFields));
    }

    /**
     * Get fake data of Pruduct
     *
     * @param array $postFields
     * @return array
     */
    public function fakePruductData($pruductFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $pruductFields);
    }
}
