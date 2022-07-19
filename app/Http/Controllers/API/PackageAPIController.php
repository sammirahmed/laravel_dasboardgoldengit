<?php

namespace App\Http\Controllers\API;


use App\Models\Package;
use App\Repositories\PackageRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class PackageController
 * @package App\Http\Controllers\API
 */

class PackageAPIController extends Controller
{
    /** @var  PackageRepository */
    private $packageRepository;

    public function __construct(PackageRepository $packageRepo)
    {
        $this->packageRepository = $packageRepo;
    }

    /**
     * Display a listing of the Package.
     * GET|HEAD /packages
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->packageRepository->pushCriteria(new RequestCriteria($request));
            $this->packageRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $packages = $this->packageRepository->all();

        return $this->sendResponse($packages->toArray(), 'Packages retrieved successfully');
    }

    /**
     * Display the specified Package.
     * GET|HEAD /packages/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Package $package */
        if (!empty($this->packageRepository)) {
            $package = $this->packageRepository->findWithoutFail($id);
        }

        if (empty($package)) {
            return $this->sendError('Package not found');
        }

        return $this->sendResponse($package->toArray(), 'Package retrieved successfully');
    }
}
