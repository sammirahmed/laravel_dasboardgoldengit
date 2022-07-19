<?php

namespace App\Http\Controllers;

use App\DataTables\ProductReviewsDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateProductReviewsRequest;
use App\Http\Requests\UpdateProductReviewsRequest;
use App\Models\ExtraGroupProuduct;
use App\Repositories\ProductReviewsRepository;
use App\Repositories\CustomFieldRepository;

use App\Repositories\PruductRepository;
use App\Repositories\UserRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class ProductReviewsController extends Controller
{
    /** @var  ProductReviewsRepository */
    private $productReviewsRepository;

    /**
     * @var FoodRepository
     */
    private $pruductRepository;
    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;
    /**
     * @var ExtraGroupRepository
     */
    private $extraGroupRepository;

    

    public function __construct(ProductReviewsRepository $productReviewsRepo, CustomFieldRepository $customFieldRepo ,
     PruductRepository $pruductRepo , UserRepository $extraGroupRepo)
    {
        parent::__construct();
        $this->productReviewsRepository = $productReviewsRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->extraGroupRepository=$extraGroupRepo;
        $this->pruductRepository=$pruductRepo;
        
    }

    /**
     * Display a listing of the ProductReviews.
     *
     * @param ProductReviewsDataTable $productReviewsDataTable
     * @return Response
     */
    public function index(ProductReviewsDataTable $productReviewsDataTable)
    {
        return $productReviewsDataTable->render('product_reviews.index');
    }

    /**
     * Show the form for creating a new ProductReviews.
     *
     * @return Response
     */
    public function create()
    {
        $food = $this->pruductRepository->pluck('name', 'id');
        $extraGroup = $this->extraGroupRepository->pluck('name', 'id');


        $hasCustomField = in_array($this->productReviewsRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productReviewsRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('product_reviews.create')->with("customFields", isset($html) ? $html : false)
            ->with("user", $extraGroup)->with("products", $food);;
    }

    /**
     * Store a newly created ProductReviews in storage.
     *
     * @param CreateProductReviewsRequest $request
     *
     * @return Response
     */
    public function store(CreateProductReviewsRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productReviewsRepository->model());
        try {
            $productReviews = $this->productReviewsRepository->create($input);
            $productReviews->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.product_reviews')]));

        return redirect(route('productReviews.index'));
    }

    /**
     * Display the specified ProductReviews.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $productReviews = $this->productReviewsRepository->findWithoutFail($id);

        if (empty($productReviews)) {
            Flash::error('Product Reviews not found');

            return redirect(route('productReviews.index'));
        }

        return view('product_reviews.show')->with('productReviews', $productReviews);
    }

    /**
     * Show the form for editing the specified ProductReviews.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $productReviews = $this->productReviewsRepository->findWithoutFail($id);

        $food = $this->pruductRepository->pluck('name', 'id');
        $extraGroup = $this->extraGroupRepository->pluck('name', 'id');



        if (empty($productReviews)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.product_reviews')]));

            return redirect(route('productReviews.index'));
        }
        $customFieldsValues = $productReviews->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->productReviewsRepository->model());
        $hasCustomField = in_array($this->productReviewsRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('product_reviews.edit')->with('productReviews', $productReviews)->with("customFields", isset($html) ? $html : false)
            ->with("user", $extraGroup)->with("products", $food);;
    }

    /**
     * Update the specified ProductReviews in storage.
     *
     * @param  int              $id
     * @param UpdateProductReviewsRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateProductReviewsRequest $request)
    {
        $productReviews = $this->productReviewsRepository->findWithoutFail($id);

        if (empty($productReviews)) {
            Flash::error('Product Reviews not found');
            return redirect(route('productReviews.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->productReviewsRepository->model());
        try {
            $productReviews = $this->productReviewsRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $productReviews->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.product_reviews')]));

        return redirect(route('productReviews.index'));
    }

    /**
     * Remove the specified ProductReviews from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $productReviews = $this->productReviewsRepository->findWithoutFail($id);

        if (empty($productReviews)) {
            Flash::error('Product Reviews not found');

            return redirect(route('productReviews.index'));
        }

        $this->productReviewsRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.product_reviews')]));

        return redirect(route('productReviews.index'));
    }

        /**
     * Remove Media of ProductReviews
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $productReviews = $this->productReviewsRepository->findWithoutFail($input['id']);
        try {
            if($productReviews->hasMedia($input['collection'])){
                $productReviews->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
