<?php

use Faker\Factory as Faker;
use App\Models\Campagin;
use App\Repositories\CampaginRepository;

trait MakeCampaginTrait
{
    /**
     * Create fake instance of Campagin and save it in database
     *
     * @param array $campaginFields
     * @return Campagin
     */
    public function makeCampagin($campaginFields = [])
    {
        /** @var CampaginRepository $campaginRepo */
        $campaginRepo = App::make(CampaginRepository::class);
        $theme = $this->fakeCampaginData($campaginFields);
        return $campaginRepo->create($theme);
    }

    /**
     * Get fake instance of Campagin
     *
     * @param array $campaginFields
     * @return Campagin
     */
    public function fakeCampagin($campaginFields = [])
    {
        return new Campagin($this->fakeCampaginData($campaginFields));
    }

    /**
     * Get fake data of Campagin
     *
     * @param array $postFields
     * @return array
     */
    public function fakeCampaginData($campaginFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $campaginFields);
    }
}
