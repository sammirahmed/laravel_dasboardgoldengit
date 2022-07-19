<?php

use App\Models\Pruduct;
use App\Repositories\PruductRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class PruductRepositoryTest extends TestCase
{
    use MakePruductTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var PruductRepository
     */
    protected $pruductRepo;

    public function setUp()
    {
        parent::setUp();
        $this->pruductRepo = App::make(PruductRepository::class);
    }

    /**
     * @test create
     */
    public function testCreatePruduct()
    {
        $pruduct = $this->fakePruductData();
        $createdPruduct = $this->pruductRepo->create($pruduct);
        $createdPruduct = $createdPruduct->toArray();
        $this->assertArrayHasKey('id', $createdPruduct);
        $this->assertNotNull($createdPruduct['id'], 'Created Pruduct must have id specified');
        $this->assertNotNull(Pruduct::find($createdPruduct['id']), 'Pruduct with given id must be in DB');
        $this->assertModelData($pruduct, $createdPruduct);
    }

    /**
     * @test read
     */
    public function testReadPruduct()
    {
        $pruduct = $this->makePruduct();
        $dbPruduct = $this->pruductRepo->find($pruduct->id);
        $dbPruduct = $dbPruduct->toArray();
        $this->assertModelData($pruduct->toArray(), $dbPruduct);
    }

    /**
     * @test update
     */
    public function testUpdatePruduct()
    {
        $pruduct = $this->makePruduct();
        $fakePruduct = $this->fakePruductData();
        $updatedPruduct = $this->pruductRepo->update($fakePruduct, $pruduct->id);
        $this->assertModelData($fakePruduct, $updatedPruduct->toArray());
        $dbPruduct = $this->pruductRepo->find($pruduct->id);
        $this->assertModelData($fakePruduct, $dbPruduct->toArray());
    }

    /**
     * @test delete
     */
    public function testDeletePruduct()
    {
        $pruduct = $this->makePruduct();
        $resp = $this->pruductRepo->delete($pruduct->id);
        $this->assertTrue($resp);
        $this->assertNull(Pruduct::find($pruduct->id), 'Pruduct should not exist in DB');
    }
}
