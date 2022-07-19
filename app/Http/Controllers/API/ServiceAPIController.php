<?php

namespace App\Http\Controllers\API;


use App\Models\Service;
use App\Repositories\ServiceRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class ServiceController
 * @package App\Http\Controllers\API
 */

class ServiceAPIController extends Controller
{
    /** @var  ServiceRepository */
    private $serviceRepository;

    public function __construct(ServiceRepository $serviceRepo)
    {
        $this->serviceRepository = $serviceRepo;
    }

    /**
     * Display a listing of the Service.
     * GET|HEAD /services
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->serviceRepository->pushCriteria(new RequestCriteria($request));
            $this->serviceRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $services = $this->serviceRepository->all();

        return $this->sendResponse($services->toArray(), 'Services retrieved successfully');
    }

    /**
     * Display the specified Service.
     * GET|HEAD /services/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Service $service */
        if (!empty($this->serviceRepository)) {
            $service = $this->serviceRepository->findWithoutFail($id);
        }

        if (empty($service)) {
            return $this->sendError('Service not found');
        }

        return $this->sendResponse($service->toArray(), 'Service retrieved successfully');
    }
}
