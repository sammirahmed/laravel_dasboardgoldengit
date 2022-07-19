<?php

use App\Models\Pharmcy;
use App\Repositories\PharmcyRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class PharmcyRepositoryTest extends TestCase
{
    use MakePharmcyTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var PharmcyRepository
     */
    protected $pharmcyRepo;

    public function setUp()
    {
        parent::setUp();
        $this->pharmcyRepo = App::make(PharmcyRepository::class);
    }

    /**
     * @test create
     */
    public function testCreatePharmcy()
    {
        $pharmcy = $this->fakePharmcyData();
        $createdPharmcy = $this->pharmcyRepo->create($pharmcy);
        $createdPharmcy = $createdPharmcy->toArray();
        $this->assertArrayHasKey('id', $createdPharmcy);
        $this->assertNotNull($createdPharmcy['id'], 'Created Pharmcy must have id specified');
        $this->assertNotNull(Pharmcy::find($createdPharmcy['id']), 'Pharmcy with given id must be in DB');
        $this->assertModelData($pharmcy, $createdPharmcy);
    }

    /**
     * @test read
     */
    public function testReadPharmcy()
    {
        $pharmcy = $this->makePharmcy();
        $dbPharmcy = $this->pharmcyRepo->find($pharmcy->id);
        $dbPharmcy = $dbPharmcy->toArray();
        $this->assertModelData($pharmcy->toArray(), $dbPharmcy);
    }

    /**
     * @test update
     */
    public function testUpdatePharmcy()
    {
        $pharmcy = $this->makePharmcy();
        $fakePharmcy = $this->fakePharmcyData();
        $updatedPharmcy = $this->pharmcyRepo->update($fakePharmcy, $pharmcy->id);
        $this->assertModelData($fakePharmcy, $updatedPharmcy->toArray());
        $dbPharmcy = $this->pharmcyRepo->find($pharmcy->id);
        $this->assertModelData($fakePharmcy, $dbPharmcy->toArray());
    }

    /**
     * @test delete
     */
    public function testDeletePharmcy()
    {
        $pharmcy = $this->makePharmcy();
        $resp = $this->pharmcyRepo->delete($pharmcy->id);
        $this->assertTrue($resp);
        $this->assertNull(Pharmcy::find($pharmcy->id), 'Pharmcy should not exist in DB');
    }
}
