<?php

namespace App\Http\Controllers\API;


use App\Models\Pharmcy;
use App\Repositories\PharmcyRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class PharmcyController
 * @package App\Http\Controllers\API
 */

class PharmcyAPIController extends Controller
{
    /** @var  PharmcyRepository */
    private $pharmcyRepository;

    public function __construct(PharmcyRepository $pharmcyRepo)
    {
        $this->pharmcyRepository = $pharmcyRepo;
    }

    /**
     * Display a listing of the Pharmcy.
     * GET|HEAD /pharmcies
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->pharmcyRepository->pushCriteria(new RequestCriteria($request));
            $this->pharmcyRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $pharmcies = $this->pharmcyRepository->all();

        return $this->sendResponse($pharmcies->toArray(), 'Pharmcies retrieved successfully');
    }

    /**
     * Display the specified Pharmcy.
     * GET|HEAD /pharmcies/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Pharmcy $pharmcy */
        if (!empty($this->pharmcyRepository)) {
            $pharmcy = $this->pharmcyRepository->findWithoutFail($id);
        }

        if (empty($pharmcy)) {
            return $this->sendError('Pharmcy not found');
        }

        return $this->sendResponse($pharmcy->toArray(), 'Pharmcy retrieved successfully');
    }
}
