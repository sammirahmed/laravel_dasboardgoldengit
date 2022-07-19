<?php

use Faker\Factory as Faker;
use App\Models\ProudctCopon;
use App\Repositories\ProudctCoponRepository;

trait MakeProudctCoponTrait
{
    /**
     * Create fake instance of ProudctCopon and save it in database
     *
     * @param array $proudctCoponFields
     * @return ProudctCopon
     */
    public function makeProudctCopon($proudctCoponFields = [])
    {
        /** @var ProudctCoponRepository $proudctCoponRepo */
        $proudctCoponRepo = App::make(ProudctCoponRepository::class);
        $theme = $this->fakeProudctCoponData($proudctCoponFields);
        return $proudctCoponRepo->create($theme);
    }

    /**
     * Get fake instance of ProudctCopon
     *
     * @param array $proudctCoponFields
     * @return ProudctCopon
     */
    public function fakeProudctCopon($proudctCoponFields = [])
    {
        return new ProudctCopon($this->fakeProudctCoponData($proudctCoponFields));
    }

    /**
     * Get fake data of ProudctCopon
     *
     * @param array $postFields
     * @return array
     */
    public function fakeProudctCoponData($proudctCoponFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $proudctCoponFields);
    }
}
