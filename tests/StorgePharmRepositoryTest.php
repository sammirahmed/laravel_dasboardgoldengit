<?php

use App\Models\StorgePharm;
use App\Repositories\StorgePharmRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class StorgePharmRepositoryTest extends TestCase
{
    use MakeStorgePharmTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var StorgePharmRepository
     */
    protected $storgePharmRepo;

    public function setUp()
    {
        parent::setUp();
        $this->storgePharmRepo = App::make(StorgePharmRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateStorgePharm()
    {
        $storgePharm = $this->fakeStorgePharmData();
        $createdStorgePharm = $this->storgePharmRepo->create($storgePharm);
        $createdStorgePharm = $createdStorgePharm->toArray();
        $this->assertArrayHasKey('id', $createdStorgePharm);
        $this->assertNotNull($createdStorgePharm['id'], 'Created StorgePharm must have id specified');
        $this->assertNotNull(StorgePharm::find($createdStorgePharm['id']), 'StorgePharm with given id must be in DB');
        $this->assertModelData($storgePharm, $createdStorgePharm);
    }

    /**
     * @test read
     */
    public function testReadStorgePharm()
    {
        $storgePharm = $this->makeStorgePharm();
        $dbStorgePharm = $this->storgePharmRepo->find($storgePharm->id);
        $dbStorgePharm = $dbStorgePharm->toArray();
        $this->assertModelData($storgePharm->toArray(), $dbStorgePharm);
    }

    /**
     * @test update
     */
    public function testUpdateStorgePharm()
    {
        $storgePharm = $this->makeStorgePharm();
        $fakeStorgePharm = $this->fakeStorgePharmData();
        $updatedStorgePharm = $this->storgePharmRepo->update($fakeStorgePharm, $storgePharm->id);
        $this->assertModelData($fakeStorgePharm, $updatedStorgePharm->toArray());
        $dbStorgePharm = $this->storgePharmRepo->find($storgePharm->id);
        $this->assertModelData($fakeStorgePharm, $dbStorgePharm->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteStorgePharm()
    {
        $storgePharm = $this->makeStorgePharm();
        $resp = $this->storgePharmRepo->delete($storgePharm->id);
        $this->assertTrue($resp);
        $this->assertNull(StorgePharm::find($storgePharm->id), 'StorgePharm should not exist in DB');
    }
}
