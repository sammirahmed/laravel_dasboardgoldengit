<?php

namespace App\Http\Controllers;

use App\DataTables\BrandsDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateBrandsRequest;
use App\Http\Requests\UpdateBrandsRequest;
use App\Repositories\BrandsRepository;
use App\Repositories\CustomFieldRepository;

use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class BrandsController extends Controller
{
    /** @var  BrandsRepository */
    private $brandsRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    

    public function __construct(BrandsRepository $brandsRepo, CustomFieldRepository $customFieldRepo )
    {
        parent::__construct();
        $this->brandsRepository = $brandsRepo;
        $this->customFieldRepository = $customFieldRepo;
        
    }

    /**
     * Display a listing of the Brands.
     *
     * @param BrandsDataTable $brandsDataTable
     * @return Response
     */
    public function index(BrandsDataTable $brandsDataTable)
    {
        return $brandsDataTable->render('brands.index');
    }

    /**
     * Show the form for creating a new Brands.
     *
     * @return Response
     */
    public function create()
    {
        
        
        $hasCustomField = in_array($this->brandsRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->brandsRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('brands.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created Brands in storage.
     *
     * @param CreateBrandsRequest $request
     *
     * @return Response
     */
    public function store(CreateBrandsRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->brandsRepository->model());
        try {
            $brands = $this->brandsRepository->create($input);
            $brands->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.brands')]));

        return redirect(route('brands.index'));
    }

    /**
     * Display the specified Brands.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $brands = $this->brandsRepository->findWithoutFail($id);

        if (empty($brands)) {
            Flash::error('Brands not found');

            return redirect(route('brands.index'));
        }

        return view('brands.show')->with('brands', $brands);
    }

    /**
     * Show the form for editing the specified Brands.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $brands = $this->brandsRepository->findWithoutFail($id);
        
        

        if (empty($brands)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.brands')]));

            return redirect(route('brands.index'));
        }
        $customFieldsValues = $brands->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->brandsRepository->model());
        $hasCustomField = in_array($this->brandsRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('brands.edit')->with('brands', $brands)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified Brands in storage.
     *
     * @param  int              $id
     * @param UpdateBrandsRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateBrandsRequest $request)
    {
        $brands = $this->brandsRepository->findWithoutFail($id);

        if (empty($brands)) {
            Flash::error('Brands not found');
            return redirect(route('brands.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->brandsRepository->model());
        try {
            $brands = $this->brandsRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $brands->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.brands')]));

        return redirect(route('brands.index'));
    }

    /**
     * Remove the specified Brands from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $brands = $this->brandsRepository->findWithoutFail($id);

        if (empty($brands)) {
            Flash::error('Brands not found');

            return redirect(route('brands.index'));
        }

        $this->brandsRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.brands')]));

        return redirect(route('brands.index'));
    }

        /**
     * Remove Media of Brands
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $brands = $this->brandsRepository->findWithoutFail($input['id']);
        try {
            if($brands->hasMedia($input['collection'])){
                $brands->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
