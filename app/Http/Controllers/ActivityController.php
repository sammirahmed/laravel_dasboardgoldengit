<?php

namespace App\Http\Controllers;

use App\DataTables\ActivityDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateActivityRequest;
use App\Http\Requests\UpdateActivityRequest;
use App\Repositories\ActivityRepository;
use App\Repositories\CustomFieldRepository;

use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class ActivityController extends Controller
{
    /** @var  ActivityRepository */
    private $activityRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    

    public function __construct(ActivityRepository $activityRepo, CustomFieldRepository $customFieldRepo )
    {
        parent::__construct();
        $this->activityRepository = $activityRepo;
        $this->customFieldRepository = $customFieldRepo;
        
    }

    /**
     * Display a listing of the Activity.
     *
     * @param ActivityDataTable $activityDataTable
     * @return Response
     */
    public function index(ActivityDataTable $activityDataTable)
    {
        return $activityDataTable->render('activities.index');
    }

    /**
     * Show the form for creating a new Activity.
     *
     * @return Response
     */
    public function create()
    {
        
        
        $hasCustomField = in_array($this->activityRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->activityRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('activities.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created Activity in storage.
     *
     * @param CreateActivityRequest $request
     *
     * @return Response
     */
    public function store(CreateActivityRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->activityRepository->model());
        try {
            $activity = $this->activityRepository->create($input);
            $activity->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.activity')]));

        return redirect(route('activities.index'));
    }

    /**
     * Display the specified Activity.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $activity = $this->activityRepository->findWithoutFail($id);

        if (empty($activity)) {
            Flash::error('Activity not found');

            return redirect(route('activities.index'));
        }

        return view('activities.show')->with('activity', $activity);
    }

    /**
     * Show the form for editing the specified Activity.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $activity = $this->activityRepository->findWithoutFail($id);
        
        

        if (empty($activity)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.activity')]));

            return redirect(route('activities.index'));
        }
        $customFieldsValues = $activity->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->activityRepository->model());
        $hasCustomField = in_array($this->activityRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('activities.edit')->with('activity', $activity)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified Activity in storage.
     *
     * @param  int              $id
     * @param UpdateActivityRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateActivityRequest $request)
    {
        $activity = $this->activityRepository->findWithoutFail($id);

        if (empty($activity)) {
            Flash::error('Activity not found');
            return redirect(route('activities.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->activityRepository->model());
        try {
            $activity = $this->activityRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $activity->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.activity')]));

        return redirect(route('activities.index'));
    }

    /**
     * Remove the specified Activity from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $activity = $this->activityRepository->findWithoutFail($id);

        if (empty($activity)) {
            Flash::error('Activity not found');

            return redirect(route('activities.index'));
        }

        $this->activityRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.activity')]));

        return redirect(route('activities.index'));
    }

        /**
     * Remove Media of Activity
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $activity = $this->activityRepository->findWithoutFail($input['id']);
        try {
            if($activity->hasMedia($input['collection'])){
                $activity->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
