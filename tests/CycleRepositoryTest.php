<?php

use App\Models\Cycle;
use App\Repositories\CycleRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class CycleRepositoryTest extends TestCase
{
    use MakeCycleTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var CycleRepository
     */
    protected $cycleRepo;

    public function setUp()
    {
        parent::setUp();
        $this->cycleRepo = App::make(CycleRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateCycle()
    {
        $cycle = $this->fakeCycleData();
        $createdCycle = $this->cycleRepo->create($cycle);
        $createdCycle = $createdCycle->toArray();
        $this->assertArrayHasKey('id', $createdCycle);
        $this->assertNotNull($createdCycle['id'], 'Created Cycle must have id specified');
        $this->assertNotNull(Cycle::find($createdCycle['id']), 'Cycle with given id must be in DB');
        $this->assertModelData($cycle, $createdCycle);
    }

    /**
     * @test read
     */
    public function testReadCycle()
    {
        $cycle = $this->makeCycle();
        $dbCycle = $this->cycleRepo->find($cycle->id);
        $dbCycle = $dbCycle->toArray();
        $this->assertModelData($cycle->toArray(), $dbCycle);
    }

    /**
     * @test update
     */
    public function testUpdateCycle()
    {
        $cycle = $this->makeCycle();
        $fakeCycle = $this->fakeCycleData();
        $updatedCycle = $this->cycleRepo->update($fakeCycle, $cycle->id);
        $this->assertModelData($fakeCycle, $updatedCycle->toArray());
        $dbCycle = $this->cycleRepo->find($cycle->id);
        $this->assertModelData($fakeCycle, $dbCycle->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteCycle()
    {
        $cycle = $this->makeCycle();
        $resp = $this->cycleRepo->delete($cycle->id);
        $this->assertTrue($resp);
        $this->assertNull(Cycle::find($cycle->id), 'Cycle should not exist in DB');
    }
}
