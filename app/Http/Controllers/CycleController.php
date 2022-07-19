<?php

namespace App\Http\Controllers;

use App\DataTables\CycleDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateCycleRequest;
use App\Http\Requests\UpdateCycleRequest;
use App\Repositories\CycleRepository;
use App\Repositories\CustomFieldRepository;

use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class CycleController extends Controller
{
    /** @var  CycleRepository */
    private $cycleRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    

    public function __construct(CycleRepository $cycleRepo, CustomFieldRepository $customFieldRepo )
    {
        parent::__construct();
        $this->cycleRepository = $cycleRepo;
        $this->customFieldRepository = $customFieldRepo;
        
    }

    /**
     * Display a listing of the Cycle.
     *
     * @param CycleDataTable $cycleDataTable
     * @return Response
     */
    public function index(CycleDataTable $cycleDataTable)
    {
        return $cycleDataTable->render('cycles.index');
    }

    /**
     * Show the form for creating a new Cycle.
     *
     * @return Response
     */
    public function create()
    {
        
        
        $hasCustomField = in_array($this->cycleRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->cycleRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('cycles.create')->with('cycle', null)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created Cycle in storage.
     *
     * @param CreateCycleRequest $request
     *
     * @return Response
     */
    public function store(CreateCycleRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->cycleRepository->model());
        try {
            $cycle = $this->cycleRepository->create($input);
            $cycle->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.cycle')]));

        return redirect(route('cycles.index'));
    }

    /**
     * Display the specified Cycle.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $cycle = $this->cycleRepository->findWithoutFail($id);

        if (empty($cycle)) {
            Flash::error('Cycle not found');

            return redirect(route('cycles.index'));
        }

        return view('cycles.show')->with('cycle', $cycle);
    }

    /**
     * Show the form for editing the specified Cycle.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $cycle = $this->cycleRepository->findWithoutFail($id);
        
        

        if (empty($cycle)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.cycle')]));

            return redirect(route('cycles.index'));
        }
        $customFieldsValues = $cycle->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->cycleRepository->model());
        $hasCustomField = in_array($this->cycleRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('cycles.edit')->with('cycle', $cycle)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified Cycle in storage.
     *
     * @param  int              $id
     * @param UpdateCycleRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateCycleRequest $request)
    {
        $cycle = $this->cycleRepository->findWithoutFail($id);

        if (empty($cycle)) {
            Flash::error('Cycle not found');
            return redirect(route('cycles.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->cycleRepository->model());
        try {
            $cycle = $this->cycleRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $cycle->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.cycle')]));

        return redirect(route('cycles.index'));
    }

    /**
     * Remove the specified Cycle from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $cycle = $this->cycleRepository->findWithoutFail($id);

        if (empty($cycle)) {
            Flash::error('Cycle not found');

            return redirect(route('cycles.index'));
        }

        $this->cycleRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.cycle')]));

        return redirect(route('cycles.index'));
    }

        /**
     * Remove Media of Cycle
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $cycle = $this->cycleRepository->findWithoutFail($input['id']);
        try {
            if($cycle->hasMedia($input['collection'])){
                $cycle->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
