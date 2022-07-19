<?php

namespace App\Http\Controllers\API;


use App\Models\Subscription;
use App\Repositories\SubscriptionRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class SubscriptionController
 * @package App\Http\Controllers\API
 */

class SubscriptionAPIController extends Controller
{
    /** @var  SubscriptionRepository */
    private $subscriptionRepository;

    public function __construct(SubscriptionRepository $subscriptionRepo)
    {
        $this->subscriptionRepository = $subscriptionRepo;
    }

    /**
     * Display a listing of the Subscription.
     * GET|HEAD /subscriptions
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->subscriptionRepository->pushCriteria(new RequestCriteria($request));
            $this->subscriptionRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $subscriptions = $this->subscriptionRepository->all();

        return $this->sendResponse($subscriptions->toArray(), 'Subscriptions retrieved successfully');
    }

    /**
     * Display the specified Subscription.
     * GET|HEAD /subscriptions/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Subscription $subscription */
        if (!empty($this->subscriptionRepository)) {
            $subscription = $this->subscriptionRepository->findWithoutFail($id);
        }

        if (empty($subscription)) {
            return $this->sendError('Subscription not found');
        }

        return $this->sendResponse($subscription->toArray(), 'Subscription retrieved successfully');
    }
}
