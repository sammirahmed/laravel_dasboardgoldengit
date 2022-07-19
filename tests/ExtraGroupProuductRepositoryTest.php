<?php

use App\Models\ExtraGroupProuduct;
use App\Repositories\ExtraGroupProuductRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class ExtraGroupProuductRepositoryTest extends TestCase
{
    use MakeExtraGroupProuductTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var ExtraGroupProuductRepository
     */
    protected $extraGroupProuductRepo;

    public function setUp()
    {
        parent::setUp();
        $this->extraGroupProuductRepo = App::make(ExtraGroupProuductRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateExtraGroupProuduct()
    {
        $extraGroupProuduct = $this->fakeExtraGroupProuductData();
        $createdExtraGroupProuduct = $this->extraGroupProuductRepo->create($extraGroupProuduct);
        $createdExtraGroupProuduct = $createdExtraGroupProuduct->toArray();
        $this->assertArrayHasKey('id', $createdExtraGroupProuduct);
        $this->assertNotNull($createdExtraGroupProuduct['id'], 'Created ExtraGroupProuduct must have id specified');
        $this->assertNotNull(ExtraGroupProuduct::find($createdExtraGroupProuduct['id']), 'ExtraGroupProuduct with given id must be in DB');
        $this->assertModelData($extraGroupProuduct, $createdExtraGroupProuduct);
    }

    /**
     * @test read
     */
    public function testReadExtraGroupProuduct()
    {
        $extraGroupProuduct = $this->makeExtraGroupProuduct();
        $dbExtraGroupProuduct = $this->extraGroupProuductRepo->find($extraGroupProuduct->id);
        $dbExtraGroupProuduct = $dbExtraGroupProuduct->toArray();
        $this->assertModelData($extraGroupProuduct->toArray(), $dbExtraGroupProuduct);
    }

    /**
     * @test update
     */
    public function testUpdateExtraGroupProuduct()
    {
        $extraGroupProuduct = $this->makeExtraGroupProuduct();
        $fakeExtraGroupProuduct = $this->fakeExtraGroupProuductData();
        $updatedExtraGroupProuduct = $this->extraGroupProuductRepo->update($fakeExtraGroupProuduct, $extraGroupProuduct->id);
        $this->assertModelData($fakeExtraGroupProuduct, $updatedExtraGroupProuduct->toArray());
        $dbExtraGroupProuduct = $this->extraGroupProuductRepo->find($extraGroupProuduct->id);
        $this->assertModelData($fakeExtraGroupProuduct, $dbExtraGroupProuduct->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteExtraGroupProuduct()
    {
        $extraGroupProuduct = $this->makeExtraGroupProuduct();
        $resp = $this->extraGroupProuductRepo->delete($extraGroupProuduct->id);
        $this->assertTrue($resp);
        $this->assertNull(ExtraGroupProuduct::find($extraGroupProuduct->id), 'ExtraGroupProuduct should not exist in DB');
    }
}
