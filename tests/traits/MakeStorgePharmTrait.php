<?php

use Faker\Factory as Faker;
use App\Models\StorgePharm;
use App\Repositories\StorgePharmRepository;

trait MakeStorgePharmTrait
{
    /**
     * Create fake instance of StorgePharm and save it in database
     *
     * @param array $storgePharmFields
     * @return StorgePharm
     */
    public function makeStorgePharm($storgePharmFields = [])
    {
        /** @var StorgePharmRepository $storgePharmRepo */
        $storgePharmRepo = App::make(StorgePharmRepository::class);
        $theme = $this->fakeStorgePharmData($storgePharmFields);
        return $storgePharmRepo->create($theme);
    }

    /**
     * Get fake instance of StorgePharm
     *
     * @param array $storgePharmFields
     * @return StorgePharm
     */
    public function fakeStorgePharm($storgePharmFields = [])
    {
        return new StorgePharm($this->fakeStorgePharmData($storgePharmFields));
    }

    /**
     * Get fake data of StorgePharm
     *
     * @param array $postFields
     * @return array
     */
    public function fakeStorgePharmData($storgePharmFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $storgePharmFields);
    }
}
