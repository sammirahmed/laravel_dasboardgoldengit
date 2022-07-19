<?php

namespace App\Http\Controllers\API;


use App\Models\ExtraPruduct;
use App\Repositories\ExtraPruductRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class ExtraPruductController
 * @package App\Http\Controllers\API
 */

class ExtraPruductAPIController extends Controller
{
    /** @var  ExtraPruductRepository */
    private $extraPruductRepository;

    public function __construct(ExtraPruductRepository $extraPruductRepo)
    {
        $this->extraPruductRepository = $extraPruductRepo;
    }

    /**
     * Display a listing of the ExtraPruduct.
     * GET|HEAD /extraPruducts
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->extraPruductRepository->pushCriteria(new RequestCriteria($request));
            $this->extraPruductRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $extraPruducts = $this->extraPruductRepository->all();

        return $this->sendResponse($extraPruducts->toArray(), 'Extra Pruducts retrieved successfully');
    }

    /**
     * Display the specified ExtraPruduct.
     * GET|HEAD /extraPruducts/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var ExtraPruduct $extraPruduct */
        if (!empty($this->extraPruductRepository)) {
            $extraPruduct = $this->extraPruductRepository->findWithoutFail($id);
        }

        if (empty($extraPruduct)) {
            return $this->sendError('Extra Pruduct not found');
        }

        return $this->sendResponse($extraPruduct->toArray(), 'Extra Pruduct retrieved successfully');
    }
}
