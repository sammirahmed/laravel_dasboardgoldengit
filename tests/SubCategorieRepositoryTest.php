<?php

use App\Models\SubCategorie;
use App\Repositories\SubCategorieRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class SubCategorieRepositoryTest extends TestCase
{
    use MakeSubCategorieTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var SubCategorieRepository
     */
    protected $subCategorieRepo;

    public function setUp()
    {
        parent::setUp();
        $this->subCategorieRepo = App::make(SubCategorieRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateSubCategorie()
    {
        $subCategorie = $this->fakeSubCategorieData();
        $createdSubCategorie = $this->subCategorieRepo->create($subCategorie);
        $createdSubCategorie = $createdSubCategorie->toArray();
        $this->assertArrayHasKey('id', $createdSubCategorie);
        $this->assertNotNull($createdSubCategorie['id'], 'Created SubCategorie must have id specified');
        $this->assertNotNull(SubCategorie::find($createdSubCategorie['id']), 'SubCategorie with given id must be in DB');
        $this->assertModelData($subCategorie, $createdSubCategorie);
    }

    /**
     * @test read
     */
    public function testReadSubCategorie()
    {
        $subCategorie = $this->makeSubCategorie();
        $dbSubCategorie = $this->subCategorieRepo->find($subCategorie->id);
        $dbSubCategorie = $dbSubCategorie->toArray();
        $this->assertModelData($subCategorie->toArray(), $dbSubCategorie);
    }

    /**
     * @test update
     */
    public function testUpdateSubCategorie()
    {
        $subCategorie = $this->makeSubCategorie();
        $fakeSubCategorie = $this->fakeSubCategorieData();
        $updatedSubCategorie = $this->subCategorieRepo->update($fakeSubCategorie, $subCategorie->id);
        $this->assertModelData($fakeSubCategorie, $updatedSubCategorie->toArray());
        $dbSubCategorie = $this->subCategorieRepo->find($subCategorie->id);
        $this->assertModelData($fakeSubCategorie, $dbSubCategorie->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteSubCategorie()
    {
        $subCategorie = $this->makeSubCategorie();
        $resp = $this->subCategorieRepo->delete($subCategorie->id);
        $this->assertTrue($resp);
        $this->assertNull(SubCategorie::find($subCategorie->id), 'SubCategorie should not exist in DB');
    }
}
