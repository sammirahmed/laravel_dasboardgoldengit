<?php

use App\Models\MainCategorie;
use App\Repositories\MainCategorieRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class MainCategorieRepositoryTest extends TestCase
{
    use MakeMainCategorieTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var MainCategorieRepository
     */
    protected $mainCategorieRepo;

    public function setUp()
    {
        parent::setUp();
        $this->mainCategorieRepo = App::make(MainCategorieRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateMainCategorie()
    {
        $mainCategorie = $this->fakeMainCategorieData();
        $createdMainCategorie = $this->mainCategorieRepo->create($mainCategorie);
        $createdMainCategorie = $createdMainCategorie->toArray();
        $this->assertArrayHasKey('id', $createdMainCategorie);
        $this->assertNotNull($createdMainCategorie['id'], 'Created MainCategorie must have id specified');
        $this->assertNotNull(MainCategorie::find($createdMainCategorie['id']), 'MainCategorie with given id must be in DB');
        $this->assertModelData($mainCategorie, $createdMainCategorie);
    }

    /**
     * @test read
     */
    public function testReadMainCategorie()
    {
        $mainCategorie = $this->makeMainCategorie();
        $dbMainCategorie = $this->mainCategorieRepo->find($mainCategorie->id);
        $dbMainCategorie = $dbMainCategorie->toArray();
        $this->assertModelData($mainCategorie->toArray(), $dbMainCategorie);
    }

    /**
     * @test update
     */
    public function testUpdateMainCategorie()
    {
        $mainCategorie = $this->makeMainCategorie();
        $fakeMainCategorie = $this->fakeMainCategorieData();
        $updatedMainCategorie = $this->mainCategorieRepo->update($fakeMainCategorie, $mainCategorie->id);
        $this->assertModelData($fakeMainCategorie, $updatedMainCategorie->toArray());
        $dbMainCategorie = $this->mainCategorieRepo->find($mainCategorie->id);
        $this->assertModelData($fakeMainCategorie, $dbMainCategorie->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteMainCategorie()
    {
        $mainCategorie = $this->makeMainCategorie();
        $resp = $this->mainCategorieRepo->delete($mainCategorie->id);
        $this->assertTrue($resp);
        $this->assertNull(MainCategorie::find($mainCategorie->id), 'MainCategorie should not exist in DB');
    }
}
