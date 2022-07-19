<?php

use Faker\Factory as Faker;
use App\Models\Cycle;
use App\Repositories\CycleRepository;

trait MakeCycleTrait
{
    /**
     * Create fake instance of Cycle and save it in database
     *
     * @param array $cycleFields
     * @return Cycle
     */
    public function makeCycle($cycleFields = [])
    {
        /** @var CycleRepository $cycleRepo */
        $cycleRepo = App::make(CycleRepository::class);
        $theme = $this->fakeCycleData($cycleFields);
        return $cycleRepo->create($theme);
    }

    /**
     * Get fake instance of Cycle
     *
     * @param array $cycleFields
     * @return Cycle
     */
    public function fakeCycle($cycleFields = [])
    {
        return new Cycle($this->fakeCycleData($cycleFields));
    }

    /**
     * Get fake data of Cycle
     *
     * @param array $postFields
     * @return array
     */
    public function fakeCycleData($cycleFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $cycleFields);
    }
}
