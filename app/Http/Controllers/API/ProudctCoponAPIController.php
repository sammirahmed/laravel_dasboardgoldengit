<?php

namespace App\Http\Controllers\API;


use App\Models\ProudctCopon;
use App\Repositories\ProudctCoponRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class ProudctCoponController
 * @package App\Http\Controllers\API
 */

class ProudctCoponAPIController extends Controller
{
    /** @var  ProudctCoponRepository */
    private $proudctCoponRepository;

    public function __construct(ProudctCoponRepository $proudctCoponRepo)
    {
        $this->proudctCoponRepository = $proudctCoponRepo;
    }

    /**
     * Display a listing of the ProudctCopon.
     * GET|HEAD /proudctCopons
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->proudctCoponRepository->pushCriteria(new RequestCriteria($request));
            $this->proudctCoponRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
         //   Flash::error($e->getMessage());
            $this->sendError($e->getMessage());
        }
        $proudctCopons = $this->proudctCoponRepository->all();

        return $this->sendResponse($proudctCopons->toArray(), 'Proudct Copons retrieved successfully');
    }

    /**
     * Display the specified ProudctCopon.
     * GET|HEAD /proudctCopons/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var ProudctCopon $proudctCopon */
        if (!empty($this->proudctCoponRepository)) {
            $proudctCopon = $this->proudctCoponRepository->findWithoutFail($id);
        }

        if (empty($proudctCopon)) {
            return $this->sendError('Proudct Copon not found');
        }

        return $this->sendResponse($proudctCopon->toArray(), 'Proudct Copon retrieved successfully');
    }
}
