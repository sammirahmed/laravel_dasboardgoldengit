<?php

use App\Models\ProudctCopon;
use App\Repositories\ProudctCoponRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class ProudctCoponRepositoryTest extends TestCase
{
    use MakeProudctCoponTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var ProudctCoponRepository
     */
    protected $proudctCoponRepo;

    public function setUp()
    {
        parent::setUp();
        $this->proudctCoponRepo = App::make(ProudctCoponRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateProudctCopon()
    {
        $proudctCopon = $this->fakeProudctCoponData();
        $createdProudctCopon = $this->proudctCoponRepo->create($proudctCopon);
        $createdProudctCopon = $createdProudctCopon->toArray();
        $this->assertArrayHasKey('id', $createdProudctCopon);
        $this->assertNotNull($createdProudctCopon['id'], 'Created ProudctCopon must have id specified');
        $this->assertNotNull(ProudctCopon::find($createdProudctCopon['id']), 'ProudctCopon with given id must be in DB');
        $this->assertModelData($proudctCopon, $createdProudctCopon);
    }

    /**
     * @test read
     */
    public function testReadProudctCopon()
    {
        $proudctCopon = $this->makeProudctCopon();
        $dbProudctCopon = $this->proudctCoponRepo->find($proudctCopon->id);
        $dbProudctCopon = $dbProudctCopon->toArray();
        $this->assertModelData($proudctCopon->toArray(), $dbProudctCopon);
    }

    /**
     * @test update
     */
    public function testUpdateProudctCopon()
    {
        $proudctCopon = $this->makeProudctCopon();
        $fakeProudctCopon = $this->fakeProudctCoponData();
        $updatedProudctCopon = $this->proudctCoponRepo->update($fakeProudctCopon, $proudctCopon->id);
        $this->assertModelData($fakeProudctCopon, $updatedProudctCopon->toArray());
        $dbProudctCopon = $this->proudctCoponRepo->find($proudctCopon->id);
        $this->assertModelData($fakeProudctCopon, $dbProudctCopon->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteProudctCopon()
    {
        $proudctCopon = $this->makeProudctCopon();
        $resp = $this->proudctCoponRepo->delete($proudctCopon->id);
        $this->assertTrue($resp);
        $this->assertNull(ProudctCopon::find($proudctCopon->id), 'ProudctCopon should not exist in DB');
    }
}
