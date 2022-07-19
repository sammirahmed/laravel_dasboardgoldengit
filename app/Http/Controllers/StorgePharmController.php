<?php

namespace App\Http\Controllers;

use App\DataTables\StorgePharmDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateStorgePharmRequest;
use App\Http\Requests\UpdateStorgePharmRequest;
use App\Repositories\PharmcyRepository;
use App\Repositories\PruductRepository;
use App\Repositories\StorgePharmRepository;
use App\Repositories\CustomFieldRepository;

use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class StorgePharmController extends Controller
{
    /** @var  StorgePharmRepository */
    private $storgePharmRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /**
     * @var FoodRepository
     */
    private $pruductRepository;
    /**
     * @var ExtraGroupRepository
     */
    private $pharmcyRepository;

    public function __construct(StorgePharmRepository $storgePharmRepo, CustomFieldRepository $customFieldRepo,
                                PruductRepository $pruductRepo ,
PharmcyRepository $pharmcyRepo)
    {
        parent::__construct();
        $this->storgePharmRepository = $storgePharmRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->pruductRepository = $pruductRepo;
        $this->pharmcyRepository = $pharmcyRepo;
        
    }

    /**
     * Display a listing of the StorgePharm.
     *
     * @param StorgePharmDataTable $storgePharmDataTable
     * @return Response
     */
    public function index(StorgePharmDataTable $storgePharmDataTable)
    {
        return $storgePharmDataTable->render('storge_pharms.index');
    }

    /**
     * Show the form for creating a new StorgePharm.
     *
     * @return Response
     */
    public function create()
    {

     //  $food = $this->pharmcyRepository->groupedByRestaurants();
        $extraGroup = $this->pharmcyRepository->pluck('name', 'id');
        $food = $this->pruductRepository->pluck('name', 'id');

        $hasCustomField = in_array($this->storgePharmRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->storgePharmRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('storge_pharms.create')->with("customFields", isset($html) ? $html : false)
            ->with("products", $food)->with("pharms", $extraGroup);
    }

    /**
     * Store a newly created StorgePharm in storage.
     *
     * @param CreateStorgePharmRequest $request
     *
     * @return Response
     */
    public function store(CreateStorgePharmRequest $request)
    {
        $input = $request->all();
        $input['initquantity']= $input['quantity'];
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->storgePharmRepository->model());
        try {
            $storgePharm = $this->storgePharmRepository->create($input);
            $storgePharm->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.storge_pharm')]));

        return redirect(route('storgePharms.index'));
    }

    /**
     * Display the specified StorgePharm.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $storgePharm = $this->storgePharmRepository->findWithoutFail($id);

        if (empty($storgePharm)) {
            Flash::error('Storge Pharm not found');

            return redirect(route('storgePharms.index'));
        }

        return view('storge_pharms.show')->with('storgePharm', $storgePharm);
    }

    /**
     * Show the form for editing the specified StorgePharm.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $storgePharm = $this->storgePharmRepository->findWithoutFail($id);

        $extraGroup = $this->pharmcyRepository->pluck('name', 'id');
        $food = $this->pruductRepository->pluck('name', 'id');


        if (empty($storgePharm)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.storge_pharm')]));

            return redirect(route('storgePharms.index'));
        }
        $customFieldsValues = $storgePharm->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->storgePharmRepository->model());
        $hasCustomField = in_array($this->storgePharmRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('storge_pharms.edit')->with('storgePharm', $storgePharm)->with("customFields", isset($html) ? $html : false)
            ->with("products", $food)->with("pharms", $extraGroup); ;
    }

    /**
     * Update the specified StorgePharm in storage.
     *
     * @param  int              $id
     * @param UpdateStorgePharmRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateStorgePharmRequest $request)
    {
        $storgePharm = $this->storgePharmRepository->findWithoutFail($id);

        if (empty($storgePharm)) {
            Flash::error('Storge Pharm not found');
            return redirect(route('storgePharms.index'));
        }
        $input = $request->all();
        $input['initquantity']= $input['quantity'];

        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->storgePharmRepository->model());
        try {
            $storgePharm = $this->storgePharmRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $storgePharm->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.storge_pharm')]));

        return redirect(route('storgePharms.index'));
    }

    /**
     * Remove the specified StorgePharm from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $storgePharm = $this->storgePharmRepository->findWithoutFail($id);

        if (empty($storgePharm)) {
            Flash::error('Storge Pharm not found');

            return redirect(route('storgePharms.index'));
        }

        $this->storgePharmRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.storge_pharm')]));

        return redirect(route('storgePharms.index'));
    }

        /**
     * Remove Media of StorgePharm
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $storgePharm = $this->storgePharmRepository->findWithoutFail($input['id']);
        try {
            if($storgePharm->hasMedia($input['collection'])){
                $storgePharm->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
