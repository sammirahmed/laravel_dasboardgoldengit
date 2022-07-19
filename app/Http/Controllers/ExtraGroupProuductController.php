<?php

namespace App\Http\Controllers;

use App\DataTables\ExtraGroupProuductDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateExtraGroupProuductRequest;
use App\Http\Requests\UpdateExtraGroupProuductRequest;
use App\Repositories\ExtraGroupProuductRepository;
use App\Repositories\CustomFieldRepository;

use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class ExtraGroupProuductController extends Controller
{
    /** @var  ExtraGroupProuductRepository */
    private $extraGroupProuductRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    

    public function __construct(ExtraGroupProuductRepository $extraGroupProuductRepo, CustomFieldRepository $customFieldRepo )
    {
        parent::__construct();
        $this->extraGroupProuductRepository = $extraGroupProuductRepo;
        $this->customFieldRepository = $customFieldRepo;
        
    }

    /**
     * Display a listing of the ExtraGroupProuduct.
     *
     * @param ExtraGroupProuductDataTable $extraGroupProuductDataTable
     * @return Response
     */
    public function index(ExtraGroupProuductDataTable $extraGroupProuductDataTable)
    {
        return $extraGroupProuductDataTable->render('extra_group_prouducts.index');
    }

    /**
     * Show the form for creating a new ExtraGroupProuduct.
     *
     * @return Response
     */
    public function create()
    {
        
        
        $hasCustomField = in_array($this->extraGroupProuductRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->extraGroupProuductRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('extra_group_prouducts.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created ExtraGroupProuduct in storage.
     *
     * @param CreateExtraGroupProuductRequest $request
     *
     * @return Response
     */
    public function store(CreateExtraGroupProuductRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->extraGroupProuductRepository->model());
        try {
            $extraGroupProuduct = $this->extraGroupProuductRepository->create($input);
            $extraGroupProuduct->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.extra_group_prouduct')]));

        return redirect(route('extraGroupProuducts.index'));
    }

    /**
     * Display the specified ExtraGroupProuduct.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $extraGroupProuduct = $this->extraGroupProuductRepository->findWithoutFail($id);

        if (empty($extraGroupProuduct)) {
            Flash::error('Extra Group Prouduct not found');

            return redirect(route('extraGroupProuducts.index'));
        }

        return view('extra_group_prouducts.show')->with('extraGroupProuduct', $extraGroupProuduct);
    }

    /**
     * Show the form for editing the specified ExtraGroupProuduct.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $extraGroupProuduct = $this->extraGroupProuductRepository->findWithoutFail($id);
        
        

        if (empty($extraGroupProuduct)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.extra_group_prouduct')]));

            return redirect(route('extraGroupProuducts.index'));
        }
        $customFieldsValues = $extraGroupProuduct->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->extraGroupProuductRepository->model());
        $hasCustomField = in_array($this->extraGroupProuductRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('extra_group_prouducts.edit')->with('extraGroupProuduct', $extraGroupProuduct)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified ExtraGroupProuduct in storage.
     *
     * @param  int              $id
     * @param UpdateExtraGroupProuductRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateExtraGroupProuductRequest $request)
    {
        $extraGroupProuduct = $this->extraGroupProuductRepository->findWithoutFail($id);

        if (empty($extraGroupProuduct)) {
            Flash::error('Extra Group Prouduct not found');
            return redirect(route('extraGroupProuducts.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->extraGroupProuductRepository->model());
        try {
            $extraGroupProuduct = $this->extraGroupProuductRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $extraGroupProuduct->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.extra_group_prouduct')]));

        return redirect(route('extraGroupProuducts.index'));
    }

    /**
     * Remove the specified ExtraGroupProuduct from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $extraGroupProuduct = $this->extraGroupProuductRepository->findWithoutFail($id);

        if (empty($extraGroupProuduct)) {
            Flash::error('Extra Group Prouduct not found');

            return redirect(route('extraGroupProuducts.index'));
        }

        $this->extraGroupProuductRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.extra_group_prouduct')]));

        return redirect(route('extraGroupProuducts.index'));
    }

        /**
     * Remove Media of ExtraGroupProuduct
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $extraGroupProuduct = $this->extraGroupProuductRepository->findWithoutFail($input['id']);
        try {
            if($extraGroupProuduct->hasMedia($input['collection'])){
                $extraGroupProuduct->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
