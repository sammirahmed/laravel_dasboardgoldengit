<?php

use Faker\Factory as Faker;
use App\Models\Airport;
use App\Repositories\AirportRepository;

trait MakeAirportTrait
{
    /**
     * Create fake instance of Airport and save it in database
     *
     * @param array $airportFields
     * @return Airport
     */
    public function makeAirport($airportFields = [])
    {
        /** @var AirportRepository $airportRepo */
        $airportRepo = App::make(AirportRepository::class);
        $theme = $this->fakeAirportData($airportFields);
        return $airportRepo->create($theme);
    }

    /**
     * Get fake instance of Airport
     *
     * @param array $airportFields
     * @return Airport
     */
    public function fakeAirport($airportFields = [])
    {
        return new Airport($this->fakeAirportData($airportFields));
    }

    /**
     * Get fake data of Airport
     *
     * @param array $postFields
     * @return array
     */
    public function fakeAirportData($airportFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $airportFields);
    }
}
