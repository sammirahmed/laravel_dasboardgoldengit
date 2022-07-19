<?php

namespace App\Http\Controllers;

use App\DataTables\PruductDataTable;
use App\Http\Requests;
use App\Http\Requests\CreatePruductRequest;
use App\Http\Requests\UpdatePruductRequest;
use App\Repositories\BrandRepository;
use App\Repositories\PharmcyRepository;
use App\Repositories\PruductRepository;
use App\Repositories\CustomFieldRepository;

use App\Repositories\SubCategorieRepository;
use App\Repositories\UploadRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class PruductController extends Controller
{
    /** @var  PruductRepository */
    private $pruductRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;
    private $mcategoryRepository;

    /**
     * @var ExtraGroupRepository
     */
    private $pharmcyRepository;
    private $brandRepository;
    private $uploadRepository;
    public function __construct(PruductRepository $pruductRepo, CustomFieldRepository $customFieldRepo,
                                PharmcyRepository $pharmcyRepo,  SubCategorieRepository $mcategoryRepo,
                                    BrandRepository $brandRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->pruductRepository = $pruductRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->pharmcyRepository = $pharmcyRepo;
        $this->mcategoryRepository = $mcategoryRepo;
        $this->brandRepository = $brandRepo;
        $this->uploadRepository = $uploadRepo;
    }

    /**
     * Display a listing of the Pruduct.
     *
     * @param PruductDataTable $pruductDataTable
     * @return Response
     */
    public function index(PruductDataTable $pruductDataTable)
    {
        return $pruductDataTable->render('pruducts.index');
    }

    /**
     * Show the form for creating a new Pruduct.
     *
     * @return Response
     */
    public function create()
    {

        $extraGroup = $this->pharmcyRepository->pluck('name', 'id');
        $restaurantsSelected = [];
        $restaurant = $this->mcategoryRepository->pluck('name', 'id');
        $brand= $this->brandRepository->pluck('name', 'id');
        $hasCustomField = in_array($this->pruductRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->pruductRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('pruducts.create')->with("customFields", isset($html) ? $html : false)
            ->with("restaurantsSelected", $restaurantsSelected)
            ->with("restaurant", $extraGroup)
            ->with("brand", $brand)

            ->with("category", $restaurant);;
    }

    /**
     * Store a newly created Pruduct in storage.
     *
     * @param CreatePruductRequest $request
     *
     * @return Response
     */
    public function store(CreatePruductRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->pruductRepository->model());
        try {
            $pruduct = $this->pruductRepository->create($input);
            $pruduct->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            if (isset($input['images']) && $input['images']) {
                $str_arr =   preg_split ("/\,/", $input['images']);
                foreach ($str_arr as $child) {
                    $cacheUpload = $this->uploadRepository->getByUuid($child);
                    $mediaItem = $cacheUpload->getMedia('image')->first();
                    $mediaItem->copy($pruduct, 'image');
                }

            }
            else if (isset($input['image']) && $input['image']) {

                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($pruduct, 'image');
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.pruduct')]));

        return redirect(route('pruducts.index'));
    }

    /**
     * Display the specified Pruduct.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $pruduct = $this->pruductRepository->findWithoutFail($id);

        if (empty($pruduct)) {
            Flash::error('Pruduct not found');

            return redirect(route('pruducts.index'));
        }

        return view('pruducts.show')->with('pruduct', $pruduct);
    }

    /**
     * Show the form for editing the specified Pruduct.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $pruduct = $this->pruductRepository->findWithoutFail($id);


        $extraGroup = $this->pharmcyRepository->pluck('name', 'id');
        $restaurantsSelected = $pruduct->pharmciyes()->pluck('pharmcies.id')->toArray();
        $restaurant = $this->mcategoryRepository->pluck('name', 'id');
        $brand= $this->brandRepository->pluck('name', 'id');
        if (empty($pruduct)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.pruduct')]));

            return redirect(route('pruducts.index'));
        }
        $customFieldsValues = $pruduct->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->pruductRepository->model());
        $hasCustomField = in_array($this->pruductRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('pruducts.edit')->with('pruduct', $pruduct)->with("customFields", isset($html) ? $html : false)
            ->with("restaurantsSelected", $restaurantsSelected)
            ->with("restaurant", $extraGroup)
            ->with("brand", $brand)

            ->with("category", $restaurant);;;
    }

    /**
     * Update the specified Pruduct in storage.
     *
     * @param  int              $id
     * @param UpdatePruductRequest $request
     *
     * @return Response
     */
    public function update($id, UpdatePruductRequest $request)
    {
        $pruduct = $this->pruductRepository->findWithoutFail($id);

        if (empty($pruduct)) {
            Flash::error('Pruduct not found');
            return redirect(route('pruducts.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->pruductRepository->model());
        $input['pharmciyes'] = isset($input['pharmciyes']) ? $input['pharmciyes'] : [];
        if (isset($input['images']) && $input['images']) {
            $str_arr =   preg_split ("/\,/", $input['images']);
            foreach ($str_arr as $child) {
                $cacheUpload = $this->uploadRepository->getByUuid($child);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($pruduct, 'image');
            }

        }
        else if (isset($input['image']) && $input['image']) {

            $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
            $mediaItem = $cacheUpload->getMedia('image')->first();
            $mediaItem->copy($pruduct, 'image');
        }
        try {
            $pruduct = $this->pruductRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $pruduct->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.pruduct')]));

        return redirect(route('pruducts.index'));
    }

    /**
     * Remove the specified Pruduct from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $pruduct = $this->pruductRepository->findWithoutFail($id);

        if (empty($pruduct)) {
            Flash::error('Pruduct not found');

            return redirect(route('pruducts.index'));
        }

        $this->pruductRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.pruduct')]));

        return redirect(route('pruducts.index'));
    }

        /**
     * Remove Media of Pruduct
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $pruduct = $this->pruductRepository->findWithoutFail($input['id']);
        try {

             if (isset($input['uuid']) && $input['uuid']) {
                $pruduct->getFirstMediabyuuid($input['collection'],$input['uuid'])->delete();
            }
          //  if($pruduct->hasMedia($input['collection']))
            {
            //    $pruduct->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
