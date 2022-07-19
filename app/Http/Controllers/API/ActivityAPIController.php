<?php

namespace App\Http\Controllers\API;


use App\Models\Activity;
use App\Repositories\ActivityRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class ActivityController
 * @package App\Http\Controllers\API
 */

class ActivityAPIController extends Controller
{
    /** @var  ActivityRepository */
    private $activityRepository;

    public function __construct(ActivityRepository $activityRepo)
    {
        $this->activityRepository = $activityRepo;
    }

    /**
     * Display a listing of the Activity.
     * GET|HEAD /activities
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->activityRepository->pushCriteria(new RequestCriteria($request));
            $this->activityRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $activities = $this->activityRepository->all();

        return $this->sendResponse($activities->toArray(), 'Activities retrieved successfully');
    }

    /**
     * Display the specified Activity.
     * GET|HEAD /activities/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Activity $activity */
        if (!empty($this->activityRepository)) {
            $activity = $this->activityRepository->findWithoutFail($id);
        }

        if (empty($activity)) {
            return $this->sendError('Activity not found');
        }

        return $this->sendResponse($activity->toArray(), 'Activity retrieved successfully');
    }
}
