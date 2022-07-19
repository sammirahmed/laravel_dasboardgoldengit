<?php

namespace App\Http\Controllers\API;


use App\Models\ProductReviews;
use App\Repositories\ProductReviewsRepository;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use InfyOm\Generator\Criteria\LimitOffsetCriteria;
use Prettus\Repository\Criteria\RequestCriteria;
use Illuminate\Support\Facades\Response;
use Prettus\Repository\Exceptions\RepositoryException;
use Flash;

/**
 * Class ProductReviewsController
 * @package App\Http\Controllers\API
 */

class ProductReviewsAPIController extends Controller
{
    /** @var  ProductReviewsRepository */
    private $productReviewsRepository;

    public function __construct(ProductReviewsRepository $productReviewsRepo)
    {
        $this->productReviewsRepository = $productReviewsRepo;
    }

    /**
     * Display a listing of the ProductReviews.
     * GET|HEAD /productReviews
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try{
            $this->productReviewsRepository->pushCriteria(new RequestCriteria($request));
            $this->productReviewsRepository->pushCriteria(new LimitOffsetCriteria($request));
        } catch (RepositoryException $e) {
            Flash::error($e->getMessage());
        }
        $productReviews = $this->productReviewsRepository->all();

        return $this->sendResponse($productReviews->toArray(), 'Product Reviews retrieved successfully');
    }

    /**
     * Display the specified ProductReviews.
     * GET|HEAD /productReviews/{id}
     *
     * @param  int $id
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        /** @var ProductReviews $productReviews */
        if (!empty($this->productReviewsRepository)) {
            $productReviews = $this->productReviewsRepository->findWithoutFail($id);
        }

        if (empty($productReviews)) {
            return $this->sendError('Product Reviews not found');
        }

        return $this->sendResponse($productReviews->toArray(), 'Product Reviews retrieved successfully');
    }
}
