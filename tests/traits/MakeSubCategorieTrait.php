<?php

use Faker\Factory as Faker;
use App\Models\SubCategorie;
use App\Repositories\SubCategorieRepository;

trait MakeSubCategorieTrait
{
    /**
     * Create fake instance of SubCategorie and save it in database
     *
     * @param array $subCategorieFields
     * @return SubCategorie
     */
    public function makeSubCategorie($subCategorieFields = [])
    {
        /** @var SubCategorieRepository $subCategorieRepo */
        $subCategorieRepo = App::make(SubCategorieRepository::class);
        $theme = $this->fakeSubCategorieData($subCategorieFields);
        return $subCategorieRepo->create($theme);
    }

    /**
     * Get fake instance of SubCategorie
     *
     * @param array $subCategorieFields
     * @return SubCategorie
     */
    public function fakeSubCategorie($subCategorieFields = [])
    {
        return new SubCategorie($this->fakeSubCategorieData($subCategorieFields));
    }

    /**
     * Get fake data of SubCategorie
     *
     * @param array $postFields
     * @return array
     */
    public function fakeSubCategorieData($subCategorieFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $subCategorieFields);
    }
}
