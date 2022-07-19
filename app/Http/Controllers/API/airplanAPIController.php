<?php

namespace App\Http\Controllers\API;


use App\Models\airplan;
use App\Repositories\airplanRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class airplanController
 * @package App\Http\Controllers\API
 */

class airplanAPIController extends Controller
{
    /** @var  airplanRepository */
    private $airplanRepository;

    public function __construct(airplanRepository $airplanRepo)
    {
        $this->airplanRepository = $airplanRepo;
    }

    /**
     * Display a listing of the airplan.
     * GET|HEAD /airplans
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->airplanRepository->pushCriteria(new RequestCriteria($request));
            $this->airplanRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $airplans = $this->airplanRepository->all();

        return $this->sendResponse($airplans->toArray(), 'Airplans retrieved successfully');
    }

    /**
     * Display the specified airplan.
     * GET|HEAD /airplans/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var airplan $airplan */
        if (!empty($this->airplanRepository)) {
            $airplan = $this->airplanRepository->findWithoutFail($id);
        }

        if (empty($airplan)) {
            return $this->sendError('Airplan not found');
        }

        return $this->sendResponse($airplan->toArray(), 'Airplan retrieved successfully');
    }
}
