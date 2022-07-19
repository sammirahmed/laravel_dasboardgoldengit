<?php

namespace App\Http\Controllers;

use App\DataTables\BrandDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateBrandRequest;
use App\Http\Requests\UpdateBrandRequest;
use App\Repositories\BrandRepository;
use App\Repositories\CustomFieldRepository;

use App\Repositories\UploadRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class BrandController extends Controller
{
    /** @var  BrandRepository */
    private $brandRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    

    public function __construct(BrandRepository $brandRepo, CustomFieldRepository $customFieldRepo , UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->brandRepository = $brandRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;
        
    }

    /**
     * Display a listing of the Brand.
     *
     * @param BrandDataTable $brandDataTable
     * @return Response
     */
    public function index(BrandDataTable $brandDataTable)
    {
        return $brandDataTable->render('brands.index');
    }

    /**
     * Show the form for creating a new Brand.
     *
     * @return Response
     */
    public function create()
    {
        
        
        $hasCustomField = in_array($this->brandRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->brandRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('brands.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created Brand in storage.
     *
     * @param CreateBrandRequest $request
     *
     * @return Response
     */
    public function store(CreateBrandRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->brandRepository->model());
        try {
            $brand = $this->brandRepository->create($input);
            $brand->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($brand, 'image');
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.brand')]));

        return redirect(route('brands.index'));
    }

    /**
     * Display the specified Brand.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $brand = $this->brandRepository->findWithoutFail($id);

        if (empty($brand)) {
            Flash::error('Brand not found');

            return redirect(route('brands.index'));
        }

        return view('brands.show')->with('brand', $brand);
    }

    /**
     * Show the form for editing the specified Brand.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $brand = $this->brandRepository->findWithoutFail($id);
        
        

        if (empty($brand)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.brand')]));

            return redirect(route('brands.index'));
        }
        $customFieldsValues = $brand->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->brandRepository->model());
        $hasCustomField = in_array($this->brandRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('brands.edit')->with('brand', $brand)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified Brand in storage.
     *
     * @param  int              $id
     * @param UpdateBrandRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateBrandRequest $request)
    {
        $brand = $this->brandRepository->findWithoutFail($id);

        if (empty($brand)) {
            Flash::error('Brand not found');
            return redirect(route('brands.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->brandRepository->model());
        try {
            $brand = $this->brandRepository->update($input, $id);

            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($brand, 'image');
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $brand->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.brand')]));

        return redirect(route('brands.index'));
    }

    /**
     * Remove the specified Brand from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $brand = $this->brandRepository->findWithoutFail($id);

        if (empty($brand)) {
            Flash::error('Brand not found');

            return redirect(route('brands.index'));
        }

        $this->brandRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.brand')]));

        return redirect(route('brands.index'));
    }

        /**
     * Remove Media of Brand
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $brand = $this->brandRepository->findWithoutFail($input['id']);
        try {
            if($brand->hasMedia($input['collection'])){
                $brand->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
