<?php

use Faker\Factory as Faker;
use App\Models\MainCategorie;
use App\Repositories\MainCategorieRepository;

trait MakeMainCategorieTrait
{
    /**
     * Create fake instance of MainCategorie and save it in database
     *
     * @param array $mainCategorieFields
     * @return MainCategorie
     */
    public function makeMainCategorie($mainCategorieFields = [])
    {
        /** @var MainCategorieRepository $mainCategorieRepo */
        $mainCategorieRepo = App::make(MainCategorieRepository::class);
        $theme = $this->fakeMainCategorieData($mainCategorieFields);
        return $mainCategorieRepo->create($theme);
    }

    /**
     * Get fake instance of MainCategorie
     *
     * @param array $mainCategorieFields
     * @return MainCategorie
     */
    public function fakeMainCategorie($mainCategorieFields = [])
    {
        return new MainCategorie($this->fakeMainCategorieData($mainCategorieFields));
    }

    /**
     * Get fake data of MainCategorie
     *
     * @param array $postFields
     * @return array
     */
    public function fakeMainCategorieData($mainCategorieFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $mainCategorieFields);
    }
}
