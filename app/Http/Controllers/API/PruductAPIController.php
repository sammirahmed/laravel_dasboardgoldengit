<?php

namespace App\Http\Controllers\API;


use App\Models\Pruduct;
use App\Repositories\PruductRepository;
use Carbon\Exceptions\BadMethodCallException;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class PruductController
 * @package App\Http\Controllers\API
 */

class PruductAPIController extends Controller
{
    /** @var  PruductRepository */
    private $pruductRepository;

    public function __construct(PruductRepository $pruductRepo)
    {
        $this->pruductRepository = $pruductRepo;
    }

    /**
     * Display a listing of the Pruduct.
     * GET|HEAD /pruducts
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->pruductRepository->pushCriteria(new RequestCriteria($request));
            $this->pruductRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $pruducts = $this->pruductRepository->all();

        return $this->sendResponse($pruducts->toArray(), 'Pruducts retrieved successfully');
    }

    /**
     * Display the specified Pruduct.
     * GET|HEAD /pruducts/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Pruduct $pruduct */
        if (!empty($this->pruductRepository)) {
            $pruduct = $this->pruductRepository->findWithoutFail($id);
        }

        if (empty($pruduct)) {
            return $this->sendError('Pruduct not found');
        }

        return $this->sendResponse($pruduct->toArray(), 'Pruduct retrieved successfully');
    }
    public function pup(Request $request)
    {
        /** @var Pruduct $pruduct */
        if (!empty($this->pruductRepository)) {
            $pruduct = $this->pruductRepository->where('best','=',true)->take ($request->count)->get();
        }

        if ($pruduct->count()<1 ) {
            return $this->sendError('Pruduct not found');
        }


        return $this->sendResponse($pruduct->toArray(), 'Pruduct retrieved successfully');
    }
}
