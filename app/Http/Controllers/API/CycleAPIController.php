<?php

namespace App\Http\Controllers\API;


use App\Models\Cycle;
use App\Repositories\CycleRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class CycleController
 * @package App\Http\Controllers\API
 */

class CycleAPIController extends Controller
{
    /** @var  CycleRepository */
    private $cycleRepository;

    public function __construct(CycleRepository $cycleRepo)
    {
        $this->cycleRepository = $cycleRepo;
    }

    /**
     * Display a listing of the Cycle.
     * GET|HEAD /cycles
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->cycleRepository->pushCriteria(new RequestCriteria($request));
            $this->cycleRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $cycles = $this->cycleRepository->all();

        return $this->sendResponse($cycles->toArray(), 'Cycles retrieved successfully');
    }

    /**
     * Display the specified Cycle.
     * GET|HEAD /cycles/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Cycle $cycle */
        if (!empty($this->cycleRepository)) {
            $cycle = $this->cycleRepository->findWithoutFail($id);
        }

        if (empty($cycle)) {
            return $this->sendError('Cycle not found');
        }

        return $this->sendResponse($cycle->toArray(), 'Cycle retrieved successfully');
    }
}
