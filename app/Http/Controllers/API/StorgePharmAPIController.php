<?php

namespace App\Http\Controllers\API;


use App\Models\StorgePharm;
use App\Repositories\StorgePharmRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class StorgePharmController
 * @package App\Http\Controllers\API
 */

class StorgePharmAPIController extends Controller
{
    /** @var  StorgePharmRepository */
    private $storgePharmRepository;

    public function __construct(StorgePharmRepository $storgePharmRepo)
    {
        $this->storgePharmRepository = $storgePharmRepo;
    }

    /**
     * Display a listing of the StorgePharm.
     * GET|HEAD /storgePharms
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->storgePharmRepository->pushCriteria(new RequestCriteria($request));
            $this->storgePharmRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $storgePharms = $this->storgePharmRepository->all();

        return $this->sendResponse($storgePharms->toArray(), 'Storge Pharms retrieved successfully');
    }

    /**
     * Display the specified StorgePharm.
     * GET|HEAD /storgePharms/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var StorgePharm $storgePharm */
        if (!empty($this->storgePharmRepository)) {
            $storgePharm = $this->storgePharmRepository->findWithoutFail($id);
        }

        if (empty($storgePharm)) {
            return $this->sendError('Storge Pharm not found');
        }

        return $this->sendResponse($storgePharm->toArray(), 'Storge Pharm retrieved successfully');
    }
}
