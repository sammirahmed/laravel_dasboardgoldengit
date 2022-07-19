<?php

use Faker\Factory as Faker;
use App\Models\Pharmcy;
use App\Repositories\PharmcyRepository;

trait MakePharmcyTrait
{
    /**
     * Create fake instance of Pharmcy and save it in database
     *
     * @param array $pharmcyFields
     * @return Pharmcy
     */
    public function makePharmcy($pharmcyFields = [])
    {
        /** @var PharmcyRepository $pharmcyRepo */
        $pharmcyRepo = App::make(PharmcyRepository::class);
        $theme = $this->fakePharmcyData($pharmcyFields);
        return $pharmcyRepo->create($theme);
    }

    /**
     * Get fake instance of Pharmcy
     *
     * @param array $pharmcyFields
     * @return Pharmcy
     */
    public function fakePharmcy($pharmcyFields = [])
    {
        return new Pharmcy($this->fakePharmcyData($pharmcyFields));
    }

    /**
     * Get fake data of Pharmcy
     *
     * @param array $postFields
     * @return array
     */
    public function fakePharmcyData($pharmcyFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $pharmcyFields);
    }
}
