<?php

use App\Models\Discounttype;
use App\Repositories\DiscounttypeRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class DiscounttypeRepositoryTest extends TestCase
{
    use MakeDiscounttypeTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var DiscounttypeRepository
     */
    protected $discounttypeRepo;

    public function setUp()
    {
        parent::setUp();
        $this->discounttypeRepo = App::make(DiscounttypeRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateDiscounttype()
    {
        $discounttype = $this->fakeDiscounttypeData();
        $createdDiscounttype = $this->discounttypeRepo->create($discounttype);
        $createdDiscounttype = $createdDiscounttype->toArray();
        $this->assertArrayHasKey('id', $createdDiscounttype);
        $this->assertNotNull($createdDiscounttype['id'], 'Created Discounttype must have id specified');
        $this->assertNotNull(Discounttype::find($createdDiscounttype['id']), 'Discounttype with given id must be in DB');
        $this->assertModelData($discounttype, $createdDiscounttype);
    }

    /**
     * @test read
     */
    public function testReadDiscounttype()
    {
        $discounttype = $this->makeDiscounttype();
        $dbDiscounttype = $this->discounttypeRepo->find($discounttype->id);
        $dbDiscounttype = $dbDiscounttype->toArray();
        $this->assertModelData($discounttype->toArray(), $dbDiscounttype);
    }

    /**
     * @test update
     */
    public function testUpdateDiscounttype()
    {
        $discounttype = $this->makeDiscounttype();
        $fakeDiscounttype = $this->fakeDiscounttypeData();
        $updatedDiscounttype = $this->discounttypeRepo->update($fakeDiscounttype, $discounttype->id);
        $this->assertModelData($fakeDiscounttype, $updatedDiscounttype->toArray());
        $dbDiscounttype = $this->discounttypeRepo->find($discounttype->id);
        $this->assertModelData($fakeDiscounttype, $dbDiscounttype->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteDiscounttype()
    {
        $discounttype = $this->makeDiscounttype();
        $resp = $this->discounttypeRepo->delete($discounttype->id);
        $this->assertTrue($resp);
        $this->assertNull(Discounttype::find($discounttype->id), 'Discounttype should not exist in DB');
    }
}
