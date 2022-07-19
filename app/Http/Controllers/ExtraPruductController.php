<?php

namespace App\Http\Controllers;

use App\DataTables\ExtraPruductDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateExtraPruductRequest;
use App\Http\Requests\UpdateExtraPruductRequest;
use App\Models\ExtraGroupProuduct;
use App\Repositories\ExtraPruductRepository;
use App\Repositories\CustomFieldRepository;

use App\Repositories\PruductRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class ExtraPruductController extends Controller
{
    /** @var  ExtraPruductRepository */
    private $extraPruductRepository;

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
    

    public function __construct(ExtraPruductRepository $extraPruductRepo, CustomFieldRepository $customFieldRepo,
      PruductRepository $pruductRepo , ExtraGroupProuduct $extraGroupRepo)
    {
        parent::__construct();
        $this->extraPruductRepository = $extraPruductRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->pruductRepository = $pruductRepo;
        $this->extraGroupRepository = $extraGroupRepo;
    }

    /**
     * Display a listing of the ExtraPruduct.
     *
     * @param ExtraPruductDataTable $extraPruductDataTable
     * @return Response
     */
    public function index(ExtraPruductDataTable $extraPruductDataTable)
    {
        return $extraPruductDataTable->render('extra_pruducts.index');
    }

    /**
     * Show the form for creating a new ExtraPruduct.
     *
     * @return Response
     */
    public function create()
    {
        $food = $this->pruductRepository->pluck('name', 'id');
        $extraGroup = $this->extraGroupRepository->pluck('name', 'id');


        $hasCustomField = in_array($this->extraPruductRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->extraPruductRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('extra_pruducts.create')->with("customFields", isset($html) ? $html : false)
            ->with("products", $food)->with("extraGroup", $extraGroup);;
    }

    /**
     * Store a newly created ExtraPruduct in storage.
     *
     * @param CreateExtraPruductRequest $request
     *
     * @return Response
     */
    public function store(CreateExtraPruductRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->extraPruductRepository->model());
        try {
            $extraPruduct = $this->extraPruductRepository->create($input);
            $extraPruduct->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.extra_pruduct')]));

        return redirect(route('extraPruducts.index'));
    }

    /**
     * Display the specified ExtraPruduct.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $extraPruduct = $this->extraPruductRepository->findWithoutFail($id);

        if (empty($extraPruduct)) {
            Flash::error('Extra Pruduct not found');

            return redirect(route('extraPruducts.index'));
        }

        return view('extra_pruducts.show')->with('extraPruduct', $extraPruduct);
    }

    /**
     * Show the form for editing the specified ExtraPruduct.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $extraPruduct = $this->extraPruductRepository->findWithoutFail($id);

        $food = $this->pruductRepository->pluck('name', 'id');
        $extraGroup = $this->extraGroupRepository->pluck('name', 'id');


        if (empty($extraPruduct)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.extra_pruduct')]));

            return redirect(route('extraPruducts.index'));
        }
        $customFieldsValues = $extraPruduct->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->extraPruductRepository->model());
        $hasCustomField = in_array($this->extraPruductRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues)
            ;
        }

        return view('extra_pruducts.edit')->with('extraPruduct', $extraPruduct)->with("customFields", isset($html) ? $html : false)
            ->with("products", $food)->with("extraGroup", $extraGroup);;;
    }

    /**
     * Update the specified ExtraPruduct in storage.
     *
     * @param  int              $id
     * @param UpdateExtraPruductRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateExtraPruductRequest $request)
    {
        $extraPruduct = $this->extraPruductRepository->findWithoutFail($id);

        if (empty($extraPruduct)) {
            Flash::error('Extra Pruduct not found');
            return redirect(route('extraPruducts.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->extraPruductRepository->model());
        try {
            $extraPruduct = $this->extraPruductRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $extraPruduct->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.extra_pruduct')]));

        return redirect(route('extraPruducts.index'));
    }

    /**
     * Remove the specified ExtraPruduct from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $extraPruduct = $this->extraPruductRepository->findWithoutFail($id);

        if (empty($extraPruduct)) {
            Flash::error('Extra Pruduct not found');

            return redirect(route('extraPruducts.index'));
        }

        $this->extraPruductRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.extra_pruduct')]));

        return redirect(route('extraPruducts.index'));
    }

        /**
     * Remove Media of ExtraPruduct
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $extraPruduct = $this->extraPruductRepository->findWithoutFail($input['id']);
        try {
            if($extraPruduct->hasMedia($input['collection'])){
                $extraPruduct->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
