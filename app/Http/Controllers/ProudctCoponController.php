<?php

namespace App\Http\Controllers;
use App\Repositories\BrandRepository;
use App\Repositories\DiscounttypeRepository;
use App\Repositories\PharmcyRepository;
use App\Repositories\PruductRepository;

use App\DataTables\ProudctCoponDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateProudctCoponRequest;
use App\Http\Requests\UpdateProudctCoponRequest;
use App\Repositories\ProudctCoponRepository;
use App\Repositories\CustomFieldRepository;

use App\Repositories\SubCategorieRepository;
use App\Repositories\UploadRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class ProudctCoponController extends Controller
{
    /** @var  ProudctCoponRepository */
    private $proudctCoponRepository;

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

    public function __construct(ProudctCoponRepository $proudctCoponRepo, CustomFieldRepository $customFieldRepo,
                                SubCategorieRepository $pharmcyRepo,  DiscounttypeRepository $mcategoryRepo,
                                    BrandRepository $brandRepo, UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->proudctCoponRepository = $proudctCoponRepo;
        $this->customFieldRepository = $customFieldRepo;
          $this->pharmcyRepository = $pharmcyRepo;
        $this->mcategoryRepository = $mcategoryRepo;
        $this->brandRepository = $brandRepo;
        $this->uploadRepository = $uploadRepo;
        
    }

    /**
     * Display a listing of the ProudctCopon.
     *
     * @param ProudctCoponDataTable $proudctCoponDataTable
     * @return Response
     */
    public function index(ProudctCoponDataTable $proudctCoponDataTable)
    {
        return $proudctCoponDataTable->render('proudct_copons.index');
    }

    /**
     * Show the form for creating a new ProudctCopon.
     *
     * @return Response
     */
    public function create()
    {

        $extraGroup = $this->pharmcyRepository->pluck('name', 'id');
        $restaurantsSelected = [];
        $restaurant = $this->mcategoryRepository->pluck('name', 'id');
        $brand= $this->brandRepository->pluck('name', 'id');

        $hasCustomField = in_array($this->proudctCoponRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->proudctCoponRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('proudct_copons.create')->with("customFields", isset($html) ? $html : false)
            ->with("restaurantsSelected", $restaurantsSelected)
            ->with("categoryy", $extraGroup)
            ->with("brand", $brand)

            ->with("category", $restaurant);;
    }

    /**
     * Store a newly created ProudctCopon in storage.
     *
     * @param CreateProudctCoponRequest $request
     *
     * @return Response
     */
    public function store(CreateProudctCoponRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->proudctCoponRepository->model());
        try {
            $proudctCopon = $this->proudctCoponRepository->create($input);
            $proudctCopon->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            if (isset($input['images']) && $input['images']) {
                $str_arr =   preg_split ("/\,/", $input['images']);
                foreach ($str_arr as $child) {
                    $cacheUpload = $this->uploadRepository->getByUuid($child);
                    $mediaItem = $cacheUpload->getMedia('image')->first();
                    $mediaItem->copy($proudctCopon, 'image');
                }

            }
            else if (isset($input['image']) && $input['image']) {

                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($proudctCopon, 'image');
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.proudct_copon')]));

        return redirect(route('proudctCopons.index'));
    }

    /**
     * Display the specified ProudctCopon.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $proudctCopon = $this->proudctCoponRepository->findWithoutFail($id);

        if (empty($proudctCopon)) {
            Flash::error('Proudct Copon not found');

            return redirect(route('proudctCopons.index'));
        }

        return view('proudct_copons.show')->with('proudctCopon', $proudctCopon);
    }

    /**
     * Show the form for editing the specified ProudctCopon.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $proudctCopon = $this->proudctCoponRepository->findWithoutFail($id);

        $extraGroup = $this->pharmcyRepository->pluck('name', 'id');
       // $restaurantsSelected = $pruduct->pharmciyes()->pluck('pharmcies.id')->toArray();
        $restaurant = $this->mcategoryRepository->pluck('name', 'id');
        $brand= $this->brandRepository->pluck('name', 'id');


        if (empty($proudctCopon)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.proudct_copon')]));

            return redirect(route('proudctCopons.index'));
        }
        $customFieldsValues = $proudctCopon->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->proudctCoponRepository->model());
        $hasCustomField = in_array($this->proudctCoponRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('proudct_copons.edit')->with('proudctCopon', $proudctCopon)->with("customFields", isset($html) ? $html : false)
           // ->with("restaurantsSelected", $restaurantsSelected)
            ->with("categoryy", $extraGroup)
            ->with("brand", $brand)

            ->with("category", $restaurant);;;
    }

    /**
     * Update the specified ProudctCopon in storage.
     *
     * @param  int              $id
     * @param UpdateProudctCoponRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateProudctCoponRequest $request)
    {
        $proudctCopon = $this->proudctCoponRepository->findWithoutFail($id);

        if (empty($proudctCopon)) {
            Flash::error('Proudct Copon not found');
            return redirect(route('proudctCopons.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->proudctCoponRepository->model());
     //   $input['pharmciyes'] = isset($input['pharmciyes']) ? $input['pharmciyes'] : [];
        if (isset($input['images']) && $input['images']) {
            $str_arr =   preg_split ("/\,/", $input['images']);
            foreach ($str_arr as $child) {
                $cacheUpload = $this->uploadRepository->getByUuid($child);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($proudctCopon, 'image');
            }

        }
        else if (isset($input['image']) && $input['image']) {

            $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
            $mediaItem = $cacheUpload->getMedia('image')->first();
            $mediaItem->copy($proudctCopon, 'image');
        }
        try {
            $proudctCopon = $this->proudctCoponRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $proudctCopon->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.proudct_copon')]));

        return redirect(route('proudctCopons.index'));
    }

    /**
     * Remove the specified ProudctCopon from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $proudctCopon = $this->proudctCoponRepository->findWithoutFail($id);

        if (empty($proudctCopon)) {
            Flash::error('Proudct Copon not found');

            return redirect(route('proudctCopons.index'));
        }

        $this->proudctCoponRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.proudct_copon')]));

        return redirect(route('proudctCopons.index'));
    }

        /**
     * Remove Media of ProudctCopon
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $proudctCopon = $this->proudctCoponRepository->findWithoutFail($input['id']);
        try {
            if($proudctCopon->hasMedia($input['collection'])){
                $proudctCopon->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
