<?php

use App\Models\Campagin;
use App\Repositories\CampaginRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class CampaginRepositoryTest extends TestCase
{
    use MakeCampaginTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var CampaginRepository
     */
    protected $campaginRepo;

    public function setUp()
    {
        parent::setUp();
        $this->campaginRepo = App::make(CampaginRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateCampagin()
    {
        $campagin = $this->fakeCampaginData();
        $createdCampagin = $this->campaginRepo->create($campagin);
        $createdCampagin = $createdCampagin->toArray();
        $this->assertArrayHasKey('id', $createdCampagin);
        $this->assertNotNull($createdCampagin['id'], 'Created Campagin must have id specified');
        $this->assertNotNull(Campagin::find($createdCampagin['id']), 'Campagin with given id must be in DB');
        $this->assertModelData($campagin, $createdCampagin);
    }

    /**
     * @test read
     */
    public function testReadCampagin()
    {
        $campagin = $this->makeCampagin();
        $dbCampagin = $this->campaginRepo->find($campagin->id);
        $dbCampagin = $dbCampagin->toArray();
        $this->assertModelData($campagin->toArray(), $dbCampagin);
    }

    /**
     * @test update
     */
    public function testUpdateCampagin()
    {
        $campagin = $this->makeCampagin();
        $fakeCampagin = $this->fakeCampaginData();
        $updatedCampagin = $this->campaginRepo->update($fakeCampagin, $campagin->id);
        $this->assertModelData($fakeCampagin, $updatedCampagin->toArray());
        $dbCampagin = $this->campaginRepo->find($campagin->id);
        $this->assertModelData($fakeCampagin, $dbCampagin->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteCampagin()
    {
        $campagin = $this->makeCampagin();
        $resp = $this->campaginRepo->delete($campagin->id);
        $this->assertTrue($resp);
        $this->assertNull(Campagin::find($campagin->id), 'Campagin should not exist in DB');
    }
}
