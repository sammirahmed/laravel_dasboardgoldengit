<?php

namespace App\Http\Controllers\API;


use App\Models\Brand;
use App\Repositories\BrandRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class BrandController
 * @package App\Http\Controllers\API
 */

class BrandAPIController extends Controller
{
    /** @var  BrandRepository */
    private $brandRepository;

    public function __construct(BrandRepository $brandRepo)
    {
        $this->brandRepository = $brandRepo;
    }

    /**
     * Display a listing of the Brand.
     * GET|HEAD /brands
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->brandRepository->pushCriteria(new RequestCriteria($request));
            $this->brandRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $brands = $this->brandRepository->all();

        return $this->sendResponse($brands->toArray(), 'Brands retrieved successfully');
    }

    /**
     * Display the specified Brand.
     * GET|HEAD /brands/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Brand $brand */
        if (!empty($this->brandRepository)) {
            $brand = $this->brandRepository->findWithoutFail($id);
        }

        if (empty($brand)) {
            return $this->sendError('Brand not found');
        }

        return $this->sendResponse($brand->toArray(), 'Brand retrieved successfully');
    }
}
