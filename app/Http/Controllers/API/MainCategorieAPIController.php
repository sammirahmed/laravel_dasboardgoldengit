<?php

namespace App\Http\Controllers\API;


use App\Models\MainCategorie;
use App\Repositories\MainCategorieRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class MainCategorieController
 * @package App\Http\Controllers\API
 */

class MainCategorieAPIController extends Controller
{
    /** @var  MainCategorieRepository */
    private $mainCategorieRepository;

    public function __construct(MainCategorieRepository $mainCategorieRepo)
    {
        $this->mainCategorieRepository = $mainCategorieRepo;
    }

    /**
     * Display a listing of the MainCategorie.
     * GET|HEAD /mainCategories
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->mainCategorieRepository->pushCriteria(new RequestCriteria($request));
            $this->mainCategorieRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $mainCategories = $this->mainCategorieRepository->all();

        return $this->sendResponse($mainCategories->toArray(), 'Main Categories retrieved successfully');
    }

    /**
     * Display the specified MainCategorie.
     * GET|HEAD /mainCategories/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var MainCategorie $mainCategorie */
        if (!empty($this->mainCategorieRepository)) {
            $mainCategorie = $this->mainCategorieRepository->findWithoutFail($id);
        }

        if (empty($mainCategorie)) {
            return $this->sendError('Main Categorie not found');
        }

        return $this->sendResponse($mainCategorie->toArray(), 'Main Categorie retrieved successfully');
    }
}
