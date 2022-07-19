<?php

use App\Models\airplan;
use App\Repositories\airplanRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class airplanRepositoryTest extends TestCase
{
    use MakeairplanTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var airplanRepository
     */
    protected $airplanRepo;

    public function setUp()
    {
        parent::setUp();
        $this->airplanRepo = App::make(airplanRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateairplan()
    {
        $airplan = $this->fakeairplanData();
        $createdairplan = $this->airplanRepo->create($airplan);
        $createdairplan = $createdairplan->toArray();
        $this->assertArrayHasKey('id', $createdairplan);
        $this->assertNotNull($createdairplan['id'], 'Created airplan must have id specified');
        $this->assertNotNull(airplan::find($createdairplan['id']), 'airplan with given id must be in DB');
        $this->assertModelData($airplan, $createdairplan);
    }

    /**
     * @test read
     */
    public function testReadairplan()
    {
        $airplan = $this->makeairplan();
        $dbairplan = $this->airplanRepo->find($airplan->id);
        $dbairplan = $dbairplan->toArray();
        $this->assertModelData($airplan->toArray(), $dbairplan);
    }

    /**
     * @test update
     */
    public function testUpdateairplan()
    {
        $airplan = $this->makeairplan();
        $fakeairplan = $this->fakeairplanData();
        $updatedairplan = $this->airplanRepo->update($fakeairplan, $airplan->id);
        $this->assertModelData($fakeairplan, $updatedairplan->toArray());
        $dbairplan = $this->airplanRepo->find($airplan->id);
        $this->assertModelData($fakeairplan, $dbairplan->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteairplan()
    {
        $airplan = $this->makeairplan();
        $resp = $this->airplanRepo->delete($airplan->id);
        $this->assertTrue($resp);
        $this->assertNull(airplan::find($airplan->id), 'airplan should not exist in DB');
    }
}
