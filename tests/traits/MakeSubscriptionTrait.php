<?php

use Faker\Factory as Faker;
use App\Models\Subscription;
use App\Repositories\SubscriptionRepository;

trait MakeSubscriptionTrait
{
    /**
     * Create fake instance of Subscription and save it in database
     *
     * @param array $subscriptionFields
     * @return Subscription
     */
    public function makeSubscription($subscriptionFields = [])
    {
        /** @var SubscriptionRepository $subscriptionRepo */
        $subscriptionRepo = App::make(SubscriptionRepository::class);
        $theme = $this->fakeSubscriptionData($subscriptionFields);
        return $subscriptionRepo->create($theme);
    }

    /**
     * Get fake instance of Subscription
     *
     * @param array $subscriptionFields
     * @return Subscription
     */
    public function fakeSubscription($subscriptionFields = [])
    {
        return new Subscription($this->fakeSubscriptionData($subscriptionFields));
    }

    /**
     * Get fake data of Subscription
     *
     * @param array $postFields
     * @return array
     */
    public function fakeSubscriptionData($subscriptionFields = [])
    {
        $fake = Faker::create();

        return array_merge([
            'created_at' => $fake->word,
            'updated_at' => $fake->word
        ], $subscriptionFields);
    }
}
