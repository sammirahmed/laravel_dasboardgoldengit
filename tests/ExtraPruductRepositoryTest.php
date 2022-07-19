<?php

use App\Models\ExtraPruduct;
use App\Repositories\ExtraPruductRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class ExtraPruductRepositoryTest extends TestCase
{
    use MakeExtraPruductTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var ExtraPruductRepository
     */
    protected $extraPruductRepo;

    public function setUp()
    {
        parent::setUp();
        $this->extraPruductRepo = App::make(ExtraPruductRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateExtraPruduct()
    {
        $extraPruduct = $this->fakeExtraPruductData();
        $createdExtraPruduct = $this->extraPruductRepo->create($extraPruduct);
        $createdExtraPruduct = $createdExtraPruduct->toArray();
        $this->assertArrayHasKey('id', $createdExtraPruduct);
        $this->assertNotNull($createdExtraPruduct['id'], 'Created ExtraPruduct must have id specified');
        $this->assertNotNull(ExtraPruduct::find($createdExtraPruduct['id']), 'ExtraPruduct with given id must be in DB');
        $this->assertModelData($extraPruduct, $createdExtraPruduct);
    }

    /**
     * @test read
     */
    public function testReadExtraPruduct()
    {
        $extraPruduct = $this->makeExtraPruduct();
        $dbExtraPruduct = $this->extraPruductRepo->find($extraPruduct->id);
        $dbExtraPruduct = $dbExtraPruduct->toArray();
        $this->assertModelData($extraPruduct->toArray(), $dbExtraPruduct);
    }

    /**
     * @test update
     */
    public function testUpdateExtraPruduct()
    {
        $extraPruduct = $this->makeExtraPruduct();
        $fakeExtraPruduct = $this->fakeExtraPruductData();
        $updatedExtraPruduct = $this->extraPruductRepo->update($fakeExtraPruduct, $extraPruduct->id);
        $this->assertModelData($fakeExtraPruduct, $updatedExtraPruduct->toArray());
        $dbExtraPruduct = $this->extraPruductRepo->find($extraPruduct->id);
        $this->assertModelData($fakeExtraPruduct, $dbExtraPruduct->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteExtraPruduct()
    {
        $extraPruduct = $this->makeExtraPruduct();
        $resp = $this->extraPruductRepo->delete($extraPruduct->id);
        $this->assertTrue($resp);
        $this->assertNull(ExtraPruduct::find($extraPruduct->id), 'ExtraPruduct should not exist in DB');
    }
}
