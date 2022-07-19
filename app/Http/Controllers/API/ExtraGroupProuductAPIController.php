<?php

namespace App\Http\Controllers\API;


use App\Models\ExtraGroupProuduct;
use App\Repositories\ExtraGroupProuductRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class ExtraGroupProuductController
 * @package App\Http\Controllers\API
 */

class ExtraGroupProuductAPIController extends Controller
{
    /** @var  ExtraGroupProuductRepository */
    private $extraGroupProuductRepository;

    public function __construct(ExtraGroupProuductRepository $extraGroupProuductRepo)
    {
        $this->extraGroupProuductRepository = $extraGroupProuductRepo;
    }

    /**
     * Display a listing of the ExtraGroupProuduct.
     * GET|HEAD /extraGroupProuducts
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->extraGroupProuductRepository->pushCriteria(new RequestCriteria($request));
            $this->extraGroupProuductRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $extraGroupProuducts = $this->extraGroupProuductRepository->all();

        return $this->sendResponse($extraGroupProuducts->toArray(), 'Extra Group Prouducts retrieved successfully');
    }

    /**
     * Display the specified ExtraGroupProuduct.
     * GET|HEAD /extraGroupProuducts/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var ExtraGroupProuduct $extraGroupProuduct */
        if (!empty($this->extraGroupProuductRepository)) {
            $extraGroupProuduct = $this->extraGroupProuductRepository->findWithoutFail($id);
        }

        if (empty($extraGroupProuduct)) {
            return $this->sendError('Extra Group Prouduct not found');
        }

        return $this->sendResponse($extraGroupProuduct->toArray(), 'Extra Group Prouduct retrieved successfully');
    }
}
