<?php

use App\Models\Airport;
use App\Repositories\AirportRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class AirportRepositoryTest extends TestCase
{
    use MakeAirportTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var AirportRepository
     */
    protected $airportRepo;

    public function setUp()
    {
        parent::setUp();
        $this->airportRepo = App::make(AirportRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateAirport()
    {
        $airport = $this->fakeAirportData();
        $createdAirport = $this->airportRepo->create($airport);
        $createdAirport = $createdAirport->toArray();
        $this->assertArrayHasKey('id', $createdAirport);
        $this->assertNotNull($createdAirport['id'], 'Created Airport must have id specified');
        $this->assertNotNull(Airport::find($createdAirport['id']), 'Airport with given id must be in DB');
        $this->assertModelData($airport, $createdAirport);
    }

    /**
     * @test read
     */
    public function testReadAirport()
    {
        $airport = $this->makeAirport();
        $dbAirport = $this->airportRepo->find($airport->id);
        $dbAirport = $dbAirport->toArray();
        $this->assertModelData($airport->toArray(), $dbAirport);
    }

    /**
     * @test update
     */
    public function testUpdateAirport()
    {
        $airport = $this->makeAirport();
        $fakeAirport = $this->fakeAirportData();
        $updatedAirport = $this->airportRepo->update($fakeAirport, $airport->id);
        $this->assertModelData($fakeAirport, $updatedAirport->toArray());
        $dbAirport = $this->airportRepo->find($airport->id);
        $this->assertModelData($fakeAirport, $dbAirport->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteAirport()
    {
        $airport = $this->makeAirport();
        $resp = $this->airportRepo->delete($airport->id);
        $this->assertTrue($resp);
        $this->assertNull(Airport::find($airport->id), 'Airport should not exist in DB');
    }
}
