<?php

namespace App\Http\Controllers\API;


use App\Models\Airport;
use App\Repositories\AirportRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class AirportController
 * @package App\Http\Controllers\API
 */

class AirportAPIController extends Controller
{
    /** @var  AirportRepository */
    private $airportRepository;

    public function __construct(AirportRepository $airportRepo)
    {
        $this->airportRepository = $airportRepo;
    }

    /**
     * Display a listing of the Airport.
     * GET|HEAD /airports
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->airportRepository->pushCriteria(new RequestCriteria($request));
            $this->airportRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $airports = $this->airportRepository->all();

        return $this->sendResponse($airports->toArray(), 'Airports retrieved successfully');
    }

    /**
     * Display the specified Airport.
     * GET|HEAD /airports/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var Airport $airport */
        if (!empty($this->airportRepository)) {
            $airport = $this->airportRepository->findWithoutFail($id);
        }

        if (empty($airport)) {
            return $this->sendError('Airport not found');
        }

        return $this->sendResponse($airport->toArray(), 'Airport retrieved successfully');
    }
}
