<?php

namespace App\Http\Controllers;

use App\DataTables\CampaginDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateCampaginRequest;
use App\Http\Requests\UpdateCampaginRequest;
use App\Repositories\CampaginRepository;
use App\Repositories\CustomFieldRepository;

use App\Repositories\PruductRepository;
use App\Repositories\UploadRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class CampaginController extends Controller
{
    /** @var  CampaginRepository */
    private $campaginRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    private $pharmcyRepository;
    private $brandRepository;
    private $uploadRepository;

    public function __construct(CampaginRepository $campaginRepo, CustomFieldRepository $customFieldRepo,
     PruductRepository $pharmcyRepo  , UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->campaginRepository = $campaginRepo;
        $this->customFieldRepository = $customFieldRepo;


        $this->pharmcyRepository = $pharmcyRepo;

        $this->uploadRepository = $uploadRepo;
        
    }

    /**
     * Display a listing of the Campagin.
     *
     * @param CampaginDataTable $campaginDataTable
     * @return Response
     */
    public function index(CampaginDataTable $campaginDataTable)
    {
        return $campaginDataTable->render('campagins.index');
    }

    /**
     * Show the form for creating a new Campagin.
     *
     * @return Response
     */
    public function create()
    {

        $restaurantsSelected = [];
        $restaurant = $this->pharmcyRepository->pluck('name', 'id');
        $hasCustomField = in_array($this->campaginRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->campaginRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('campagins.create')->with("customFields", isset($html) ? $html : false)
            ->with("restaurantsSelected", $restaurantsSelected)
            ->with("restaurant", $restaurant);
    }

    /**
     * Store a newly created Campagin in storage.
     *
     * @param CreateCampaginRequest $request
     *
     * @return Response
     */
    public function store(CreateCampaginRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->campaginRepository->model());
        try {
            $campagin = $this->campaginRepository->create($input);
            $campagin->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($campagin, 'image');
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.campagin')]));

        return redirect(route('campagins.index'));
    }

    /**
     * Display the specified Campagin.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $campagin = $this->campaginRepository->findWithoutFail($id);

        if (empty($campagin)) {
            Flash::error('Campagin not found');

            return redirect(route('campagins.index'));
        }

        return view('campagins.show')->with('campagin', $campagin);
    }

    /**
     * Show the form for editing the specified Campagin.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $campagin = $this->campaginRepository->findWithoutFail($id);


      //  $extraGroup = $this->pharmcyRepository->pluck('name', 'id');
        $restaurantsSelected = $campagin->products()->pluck('pruducts.id')->toArray();
        $restaurant = $this->pharmcyRepository->pluck('name', 'id');
        if (empty($campagin)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.campagin')]));

            return redirect(route('campagins.index'));
        }
        $customFieldsValues = $campagin->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->campaginRepository->model());
        $hasCustomField = in_array($this->campaginRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('campagins.edit')->with('campagin', $campagin)->with("customFields", isset($html) ? $html : false)
            ->with("restaurantsSelected", $restaurantsSelected)
            ->with("restaurant", $restaurant);
    }

    /**
     * Update the specified Campagin in storage.
     *
     * @param  int              $id
     * @param UpdateCampaginRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateCampaginRequest $request)
    {
        $campagin = $this->campaginRepository->findWithoutFail($id);

        if (empty($campagin)) {
            Flash::error('Campagin not found');
            return redirect(route('campagins.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->campaginRepository->model());
        $input['products'] = isset($input['products']) ? $input['products'] : [];

        try {
            $campagin = $this->campaginRepository->update($input, $id);
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($campagin, 'image');
            }

            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $campagin->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.campagin')]));

        return redirect(route('campagins.index'));
    }

    /**
     * Remove the specified Campagin from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $campagin = $this->campaginRepository->findWithoutFail($id);

        if (empty($campagin)) {
            Flash::error('Campagin not found');

            return redirect(route('campagins.index'));
        }

        $this->campaginRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.campagin')]));

        return redirect(route('campagins.index'));
    }

        /**
     * Remove Media of Campagin
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $campagin = $this->campaginRepository->findWithoutFail($input['id']);
        try {
            if($campagin->hasMedia($input['collection'])){
                $campagin->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }

}
