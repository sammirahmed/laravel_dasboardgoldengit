<?php

namespace App\Http\Controllers\API;


use App\Models\SubCategorie;
use App\Repositories\SubCategorieRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class SubCategorieController
 * @package App\Http\Controllers\API
 */

class SubCategorieAPIController extends Controller
{
    /** @var  SubCategorieRepository */
    private $subCategorieRepository;

    public function __construct(SubCategorieRepository $subCategorieRepo)
    {
        $this->subCategorieRepository = $subCategorieRepo;
    }

    /**
     * Display a listing of the SubCategorie.
     * GET|HEAD /subCategories
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->subCategorieRepository->pushCriteria(new RequestCriteria($request));
            $this->subCategorieRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $subCategories = $this->subCategorieRepository->all();

        return $this->sendResponse($subCategories->toArray(), 'Sub Categories retrieved successfully');
    }

    /**
     * Display the specified SubCategorie.
     * GET|HEAD /subCategories/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var SubCategorie $subCategorie */
        if (!empty($this->subCategorieRepository)) {
            $subCategorie = $this->subCategorieRepository->findWithoutFail($id);
        }

        if (empty($subCategorie)) {
            return $this->sendError('Sub Categorie not found');
        }

        return $this->sendResponse($subCategorie->toArray(), 'Sub Categorie retrieved successfully');
    }
    public function categories($id)
    {
        /** @var SubCategorie $subCategorie */
        if (!empty($this->subCategorieRepository)) {
            $subCategorie = $this->subCategorieRepository->allsubbymain($id);
        }

        if (empty($subCategorie)) {
            return $this->sendError('Sub Categorie not found');
        }

        return $this->sendResponse($subCategorie->toArray(), 'Sub Categorie retrieved successfully');
    }
}
