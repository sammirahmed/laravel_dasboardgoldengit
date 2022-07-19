<?php

namespace App\Http\Controllers\API;


use App\Models\Discounttype;
use App\Repositories\DiscounttypeRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class DiscounttypeController
 * @package App\Http\Controllers\API
 */

class DiscounttypeAPIController extends Controller
{
    /** @var  DiscounttypeRepository */
    private $discounttypeRepository;

    public function __construct(DiscounttypeRepository $discounttypeRepo)
    {
        $this->discounttypeRepository = $discounttypeRepo;
    }

    /**
     * Display a listing of the Discounttype.
     * GET|HEAD /discounttypes
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->discounttypeRepository->pushCriteria(new RequestCriteria($request));
            $this->discounttypeRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $discounttypes = $this->discounttypeRepository->all();

        return $this->sendResponse($discounttypes->toArray(), 'Discounttypes retrieved successfully');
    }

    /**
     * Display the specified Discounttype.
     * GET|HEAD /discounttypes/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Discounttype $discounttype */
        if (!empty($this->discounttypeRepository)) {
            $discounttype = $this->discounttypeRepository->findWithoutFail($id);
        }

        if (empty($discounttype)) {
            return $this->sendError('Discounttype not found');
        }

        return $this->sendResponse($discounttype->toArray(), 'Discounttype retrieved successfully');
    }
}
