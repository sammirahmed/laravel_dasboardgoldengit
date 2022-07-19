<?php

namespace App\Http\Controllers;

use App\DataTables\airplanDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateairplanRequest;
use App\Http\Requests\UpdateairplanRequest;
use App\Repositories\airplanRepository;
use App\Repositories\CustomFieldRepository;

use App\Repositories\UploadRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class airplanController extends Controller
{
    /** @var  airplanRepository */
    private $airplanRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    private $uploadRepository;

    public function __construct(airplanRepository $airplanRepo, CustomFieldRepository $customFieldRepo
        , UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->airplanRepository = $airplanRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;
    }

    /**
     * Display a listing of the airplan.
     *
     * @param airplanDataTable $airplanDataTable
     * @return Response
     */
    public function index(airplanDataTable $airplanDataTable)
    {
        return $airplanDataTable->render('airplans.index');
    }

    /**
     * Show the form for creating a new airplan.
     *
     * @return Response
     */
    public function create()
    {
        
        
        $hasCustomField = in_array($this->airplanRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->airplanRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('airplans.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created airplan in storage.
     *
     * @param CreateairplanRequest $request
     *
     * @return Response
     */
    public function store(CreateairplanRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->airplanRepository->model());
        try {
            $airplan = $this->airplanRepository->create($input);
            $airplan->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($airplan, 'image');
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.airplan')]));

        return redirect(route('airplans.index'));
    }

    /**
     * Display the specified airplan.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $airplan = $this->airplanRepository->findWithoutFail($id);

        if (empty($airplan)) {
            Flash::error('Airplan not found');

            return redirect(route('airplans.index'));
        }

        return view('airplans.show')->with('airplan', $airplan);
    }

    /**
     * Show the form for editing the specified airplan.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $airplan = $this->airplanRepository->findWithoutFail($id);
        
        

        if (empty($airplan)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.airplan')]));

            return redirect(route('airplans.index'));
        }
        $customFieldsValues = $airplan->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->airplanRepository->model());
        $hasCustomField = in_array($this->airplanRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('airplans.edit')->with('airplan', $airplan)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified airplan in storage.
     *
     * @param  int              $id
     * @param UpdateairplanRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateairplanRequest $request)
    {
        $airplan = $this->airplanRepository->findWithoutFail($id);

        if (empty($airplan)) {
            Flash::error('Airplan not found');
            return redirect(route('airplans.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->airplanRepository->model());
        try {
            $airplan = $this->airplanRepository->update($input, $id);

            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($airplan, 'image');
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $airplan->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.airplan')]));

        return redirect(route('airplans.index'));
    }

    /**
     * Remove the specified airplan from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $airplan = $this->airplanRepository->findWithoutFail($id);

        if (empty($airplan)) {
            Flash::error('Airplan not found');

            return redirect(route('airplans.index'));
        }

        $this->airplanRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.airplan')]));

        return redirect(route('airplans.index'));
    }

        /**
     * Remove Media of airplan
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $airplan = $this->airplanRepository->findWithoutFail($input['id']);
        try {
            if($airplan->hasMedia($input['collection'])){
                $airplan->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
