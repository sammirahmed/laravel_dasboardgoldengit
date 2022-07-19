<?php

use Faker\Factory as Faker;
use App\Models\airplan;
use App\Repositories\airplanRepository;

trait MakeairplanTrait
{
    /**
     * Create fake instance of airplan and save it in database
     *
     * @param array $airplanFields
     * @return airplan
     */
    public function makeairplan($airplanFields = [])
    {
        /** @var airplanRepository $airplanRepo */
        $airplanRepo = App::make(airplanRepository::class);
        $theme = $this->fakeairplanData($airplanFields);
        return $airplanRepo->create($theme);
    }

    /**
     * Get fake instance of airplan
     *
     * @param array $airplanFields
     * @return airplan
     */
    public function fakeairplan($airplanFields = [])
    {
        return new airplan($this->fakeairplanData($airplanFields));
    }

    /**
     * Get fake data of airplan
     *
     * @param array $postFields
     * @return array
     */
    public function fakeairplanData($airplanFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $airplanFields);
    }
}
