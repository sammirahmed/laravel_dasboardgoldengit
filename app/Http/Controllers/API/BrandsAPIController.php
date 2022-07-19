<?php

namespace App\Http\Controllers\API;


use App\Models\Brands;
use App\Repositories\BrandsRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class BrandsController
 * @package App\Http\Controllers\API
 */

class BrandsAPIController extends Controller
{
    /** @var  BrandsRepository */
    private $brandsRepository;

    public function __construct(BrandsRepository $brandsRepo)
    {
        $this->brandsRepository = $brandsRepo;
    }

    /**
     * Display a listing of the Brands.
     * GET|HEAD /brands
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->brandsRepository->pushCriteria(new RequestCriteria($request));
            $this->brandsRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $brands = $this->brandsRepository->all();

        return $this->sendResponse($brands->toArray(), 'Brands retrieved successfully');
    }

    /**
     * Display the specified Brands.
     * GET|HEAD /brands/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Brands $brands */
        if (!empty($this->brandsRepository)) {
            $brands = $this->brandsRepository->findWithoutFail($id);
        }

        if (empty($brands)) {
            return $this->sendError('Brands not found');
        }

        return $this->sendResponse($brands->toArray(), 'Brands retrieved successfully');
    }
}
