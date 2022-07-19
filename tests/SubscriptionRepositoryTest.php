<?php

use App\Models\Subscription;
use App\Repositories\SubscriptionRepository;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class SubscriptionRepositoryTest extends TestCase
{
    use MakeSubscriptionTrait, ApiTestTrait, DatabaseTransactions;

    /**
     * @var SubscriptionRepository
     */
    protected $subscriptionRepo;

    public function setUp()
    {
        parent::setUp();
        $this->subscriptionRepo = App::make(SubscriptionRepository::class);
    }

    /**
     * @test create
     */
    public function testCreateSubscription()
    {
        $subscription = $this->fakeSubscriptionData();
        $createdSubscription = $this->subscriptionRepo->create($subscription);
        $createdSubscription = $createdSubscription->toArray();
        $this->assertArrayHasKey('id', $createdSubscription);
        $this->assertNotNull($createdSubscription['id'], 'Created Subscription must have id specified');
        $this->assertNotNull(Subscription::find($createdSubscription['id']), 'Subscription with given id must be in DB');
        $this->assertModelData($subscription, $createdSubscription);
    }

    /**
     * @test read
     */
    public function testReadSubscription()
    {
        $subscription = $this->makeSubscription();
        $dbSubscription = $this->subscriptionRepo->find($subscription->id);
        $dbSubscription = $dbSubscription->toArray();
        $this->assertModelData($subscription->toArray(), $dbSubscription);
    }

    /**
     * @test update
     */
    public function testUpdateSubscription()
    {
        $subscription = $this->makeSubscription();
        $fakeSubscription = $this->fakeSubscriptionData();
        $updatedSubscription = $this->subscriptionRepo->update($fakeSubscription, $subscription->id);
        $this->assertModelData($fakeSubscription, $updatedSubscription->toArray());
        $dbSubscription = $this->subscriptionRepo->find($subscription->id);
        $this->assertModelData($fakeSubscription, $dbSubscription->toArray());
    }

    /**
     * @test delete
     */
    public function testDeleteSubscription()
    {
        $subscription = $this->makeSubscription();
        $resp = $this->subscriptionRepo->delete($subscription->id);
        $this->assertTrue($resp);
        $this->assertNull(Subscription::find($subscription->id), 'Subscription should not exist in DB');
    }
}
