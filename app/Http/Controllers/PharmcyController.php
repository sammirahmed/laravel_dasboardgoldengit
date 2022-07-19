<?php

namespace App\Http\Controllers;

use App\DataTables\PharmcyDataTable;
use App\Http\Requests;
use App\Http\Requests\CreatePharmcyRequest;
use App\Http\Requests\UpdatePharmcyRequest;
use App\Repositories\BrandRepository;
use App\Repositories\PharmcyRepository;
use App\Repositories\CustomFieldRepository;

use App\Repositories\UploadRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class PharmcyController extends Controller
{
    /** @var  PharmcyRepository */
    private $pharmcyRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    private $uploadRepository;
    private $brandRepository;

    public function __construct(PharmcyRepository $pharmcyRepo,BrandRepository $brandRepo, CustomFieldRepository $customFieldRepo , UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->pharmcyRepository = $pharmcyRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;
        $this->brandRepository = $brandRepo;
    }

    /**
     * Display a listing of the Pharmcy.
     *
     * @param PharmcyDataTable $pharmcyDataTable
     * @return Response
     */
    public function index(PharmcyDataTable $pharmcyDataTable)
    {
        return $pharmcyDataTable->render('pharmcies.index');
    }

    /**
     * Show the form for creating a new Pharmcy.
     *
     * @return Response
     */
    public function create()
    {
        $brand= $this->brandRepository->pluck('name', 'id');


        $hasCustomField = in_array($this->pharmcyRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->pharmcyRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('pharmcies.create')->with("customFields", isset($html) ? $html : false)
            ->with("brand", $brand)
            ;
    }

    /**
     * Store a newly created Pharmcy in storage.
     *
     * @param CreatePharmcyRequest $request
     *
     * @return Response
     */
    public function store(CreatePharmcyRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->pharmcyRepository->model());
        try {
            $pharmcy = $this->pharmcyRepository->create($input);
            $pharmcy->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($pharmcy, 'image');
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.pharmcy')]));

        return redirect(route('pharmcies.index'));
    }

    /**
     * Display the specified Pharmcy.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $pharmcy = $this->pharmcyRepository->findWithoutFail($id);

        if (empty($pharmcy)) {
            Flash::error('Pharmcy not found');

            return redirect(route('pharmcies.index'));
        }

        return view('pharmcies.show')->with('pharmcy', $pharmcy);
    }

    /**
     * Show the form for editing the specified Pharmcy.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $pharmcy = $this->pharmcyRepository->findWithoutFail($id);

        $brand= $this->brandRepository->pluck('name', 'id');


        if (empty($pharmcy)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.pharmcy')]));

            return redirect(route('pharmcies.index'));
        }
        $customFieldsValues = $pharmcy->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->pharmcyRepository->model());
        $hasCustomField = in_array($this->pharmcyRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('pharmcies.edit')->with('pharmcy', $pharmcy)->with("customFields", isset($html) ? $html : false)
            ->with("brand", $brand);
    }

    /**
     * Update the specified Pharmcy in storage.
     *
     * @param  int              $id
     * @param UpdatePharmcyRequest $request
     *
     * @return Response
     */
    public function update($id, UpdatePharmcyRequest $request)
    {
        $pharmcy = $this->pharmcyRepository->findWithoutFail($id);

        if (empty($pharmcy)) {
            Flash::error('Pharmcy not found');
            return redirect(route('pharmcies.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->pharmcyRepository->model());
        try {
            $pharmcy = $this->pharmcyRepository->update($input, $id);

            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($pharmcy, 'image');
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $pharmcy->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.pharmcy')]));

        return redirect(route('pharmcies.index'));
    }

    /**
     * Remove the specified Pharmcy from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $pharmcy = $this->pharmcyRepository->findWithoutFail($id);

        if (empty($pharmcy)) {
            Flash::error('Pharmcy not found');

            return redirect(route('pharmcies.index'));
        }

        $this->pharmcyRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.pharmcy')]));

        return redirect(route('pharmcies.index'));
    }

        /**
     * Remove Media of Pharmcy
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $pharmcy = $this->pharmcyRepository->findWithoutFail($input['id']);
        try {
            if($pharmcy->hasMedia($input['collection'])){
                $pharmcy->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
