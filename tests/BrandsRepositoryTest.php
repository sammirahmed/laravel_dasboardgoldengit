<?php

use App\Models\Brands;
use App\Repositories\BrandsRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class BrandsRepositoryTest extends TestCase
{
    use MakeBrandsTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var BrandsRepository
     */
    protected $brandsRepo;

    public function setUp()
    {
        parent::setUp();
        $this->brandsRepo = App::make(BrandsRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateBrands()
    {
        $brands = $this->fakeBrandsData();
        $createdBrands = $this->brandsRepo->create($brands);
        $createdBrands = $createdBrands->toArray();
        $this->assertArrayHasKey('id', $createdBrands);
        $this->assertNotNull($createdBrands['id'], 'Created Brands must have id specified');
        $this->assertNotNull(Brands::find($createdBrands['id']), 'Brands with given id must be in DB');
        $this->assertModelData($brands, $createdBrands);
    }

    /**
     * @test read
     */
    public function testReadBrands()
    {
        $brands = $this->makeBrands();
        $dbBrands = $this->brandsRepo->find($brands->id);
        $dbBrands = $dbBrands->toArray();
        $this->assertModelData($brands->toArray(), $dbBrands);
    }

    /**
     * @test update
     */
    public function testUpdateBrands()
    {
        $brands = $this->makeBrands();
        $fakeBrands = $this->fakeBrandsData();
        $updatedBrands = $this->brandsRepo->update($fakeBrands, $brands->id);
        $this->assertModelData($fakeBrands, $updatedBrands->toArray());
        $dbBrands = $this->brandsRepo->find($brands->id);
        $this->assertModelData($fakeBrands, $dbBrands->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteBrands()
    {
        $brands = $this->makeBrands();
        $resp = $this->brandsRepo->delete($brands->id);
        $this->assertTrue($resp);
        $this->assertNull(Brands::find($brands->id), 'Brands should not exist in DB');
    }
}
