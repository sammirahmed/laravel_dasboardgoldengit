<?php

namespace App\Http\Controllers;

use App\DataTables\ServiceDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateServiceRequest;
use App\Http\Requests\UpdateServiceRequest;
use App\Repositories\ServiceRepository;
use App\Repositories\CustomFieldRepository;

use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class ServiceController extends Controller
{
    /** @var  ServiceRepository */
    private $serviceRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    

    public function __construct(ServiceRepository $serviceRepo, CustomFieldRepository $customFieldRepo )
    {
        parent::__construct();
        $this->serviceRepository = $serviceRepo;
        $this->customFieldRepository = $customFieldRepo;
        
    }

    /**
     * Display a listing of the Service.
     *
     * @param ServiceDataTable $serviceDataTable
     * @return Response
     */
    public function index(ServiceDataTable $serviceDataTable)
    {
        return $serviceDataTable->render('services.index');
    }

    /**
     * Show the form for creating a new Service.
     *
     * @return Response
     */
    public function create()
    {
        
        
        $hasCustomField = in_array($this->serviceRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->serviceRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('services.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created Service in storage.
     *
     * @param CreateServiceRequest $request
     *
     * @return Response
     */
    public function store(CreateServiceRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->serviceRepository->model());
        try {
            $service = $this->serviceRepository->create($input);
            $service->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.service')]));

        return redirect(route('services.index'));
    }

    /**
     * Display the specified Service.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $service = $this->serviceRepository->findWithoutFail($id);

        if (empty($service)) {
            Flash::error('Service not found');

            return redirect(route('services.index'));
        }

        return view('services.show')->with('service', $service);
    }

    /**
     * Show the form for editing the specified Service.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $service = $this->serviceRepository->findWithoutFail($id);
        
        

        if (empty($service)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.service')]));

            return redirect(route('services.index'));
        }
        $customFieldsValues = $service->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->serviceRepository->model());
        $hasCustomField = in_array($this->serviceRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('services.edit')->with('service', $service)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified Service in storage.
     *
     * @param  int              $id
     * @param UpdateServiceRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateServiceRequest $request)
    {
        $service = $this->serviceRepository->findWithoutFail($id);

        if (empty($service)) {
            Flash::error('Service not found');
            return redirect(route('services.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->serviceRepository->model());
        try {
            $service = $this->serviceRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $service->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.service')]));

        return redirect(route('services.index'));
    }

    /**
     * Remove the specified Service from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $service = $this->serviceRepository->findWithoutFail($id);

        if (empty($service)) {
            Flash::error('Service not found');

            return redirect(route('services.index'));
        }

        $this->serviceRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.service')]));

        return redirect(route('services.index'));
    }

        /**
     * Remove Media of Service
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $service = $this->serviceRepository->findWithoutFail($input['id']);
        try {
            if($service->hasMedia($input['collection'])){
                $service->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
