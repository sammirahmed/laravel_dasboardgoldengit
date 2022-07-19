<?php

namespace App\Http\Controllers\API;


use App\Models\Campagin;
use App\Repositories\CampaginRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class CampaginController
 * @package App\Http\Controllers\API
 */

class CampaginAPIController extends Controller
{
    /** @var  CampaginRepository */
    private $campaginRepository;

    public function __construct(CampaginRepository $campaginRepo)
    {
        $this->campaginRepository = $campaginRepo;
    }

    /**
     * Display a listing of the Campagin.
     * GET|HEAD /campagins
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->campaginRepository->pushCriteria(new RequestCriteria($request));
            $this->campaginRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $campagins = $this->campaginRepository->all();

        return $this->sendResponse($campagins->toArray(), 'Campagins retrieved successfully');
    }

    /**
     * Display the specified Campagin.
     * GET|HEAD /campagins/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Campagin $campagin */
        if (!empty($this->campaginRepository)) {
            $campagin = $this->campaginRepository->findWithoutFail($id);
        }

        if (empty($campagin)) {
            return $this->sendError('Campagin not found');
        }

        return $this->sendResponse($campagin->toArray(), 'Campagin retrieved successfully');
    }
}
