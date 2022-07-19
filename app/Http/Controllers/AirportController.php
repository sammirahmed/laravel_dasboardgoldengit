<?php

namespace App\Http\Controllers;

use App\DataTables\AirportDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateAirportRequest;
use App\Http\Requests\UpdateAirportRequest;
use App\Repositories\AirportRepository;
use App\Repositories\CustomFieldRepository;

use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class AirportController extends Controller
{
    /** @var  AirportRepository */
    private $airportRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    

    public function __construct(AirportRepository $airportRepo, CustomFieldRepository $customFieldRepo )
    {
        parent::__construct();
        $this->airportRepository = $airportRepo;
        $this->customFieldRepository = $customFieldRepo;
        
    }

    /**
     * Display a listing of the Airport.
     *
     * @param AirportDataTable $airportDataTable
     * @return Response
     */
    public function index(AirportDataTable $airportDataTable)
    {
        return $airportDataTable->render('airports.index');
    }

    /**
     * Show the form for creating a new Airport.
     *
     * @return Response
     */
    public function create()
    {
        
        
        $hasCustomField = in_array($this->airportRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->airportRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('airports.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created Airport in storage.
     *
     * @param CreateAirportRequest $request
     *
     * @return Response
     */
    public function store(CreateAirportRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->airportRepository->model());
        try {
            $airport = $this->airportRepository->create($input);
            $airport->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.airport')]));

        return redirect(route('airports.index'));
    }

    /**
     * Display the specified Airport.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $airport = $this->airportRepository->findWithoutFail($id);

        if (empty($airport)) {
            Flash::error('Airport not found');

            return redirect(route('airports.index'));
        }

        return view('airports.show')->with('airport', $airport);
    }

    /**
     * Show the form for editing the specified Airport.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $airport = $this->airportRepository->findWithoutFail($id);
        
        

        if (empty($airport)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.airport')]));

            return redirect(route('airports.index'));
        }
        $customFieldsValues = $airport->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->airportRepository->model());
        $hasCustomField = in_array($this->airportRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('airports.edit')->with('airport', $airport)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified Airport in storage.
     *
     * @param  int              $id
     * @param UpdateAirportRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateAirportRequest $request)
    {
        $airport = $this->airportRepository->findWithoutFail($id);

        if (empty($airport)) {
            Flash::error('Airport not found');
            return redirect(route('airports.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->airportRepository->model());
        try {
            $airport = $this->airportRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $airport->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.airport')]));

        return redirect(route('airports.index'));
    }

    /**
     * Remove the specified Airport from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $airport = $this->airportRepository->findWithoutFail($id);

        if (empty($airport)) {
            Flash::error('Airport not found');

            return redirect(route('airports.index'));
        }

        $this->airportRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.airport')]));

        return redirect(route('airports.index'));
    }

        /**
     * Remove Media of Airport
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $airport = $this->airportRepository->findWithoutFail($input['id']);
        try {
            if($airport->hasMedia($input['collection'])){
                $airport->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
