<?php

namespace App\Http\Controllers;

use App\DataTables\MainCategorieDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateMainCategorieRequest;
use App\Http\Requests\UpdateMainCategorieRequest;
use App\Repositories\CuisineRepository;
use App\Repositories\MainCategorieRepository;
use App\Repositories\CustomFieldRepository;

use App\Repositories\UploadRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class MainCategorieController extends Controller
{
    /** @var  MainCategorieRepository */
    private $mainCategorieRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    private $uploadRepository;
    private $restaurantRepository;

    public function __construct(MainCategorieRepository $mainCategorieRepo, CustomFieldRepository $customFieldRepo , UploadRepository $uploadRepo
    ,CuisineRepository $restaurantRepo)
    {
        parent::__construct();
        $this->mainCategorieRepository = $mainCategorieRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->uploadRepository = $uploadRepo;
        $this->restaurantRepository = $restaurantRepo;
    }

    /**
     * Display a listing of the MainCategorie.
     *
     * @param MainCategorieDataTable $mainCategorieDataTable
     * @return Response
     */
    public function index(MainCategorieDataTable $mainCategorieDataTable)
    {
        return $mainCategorieDataTable->render('main_categories.index');
    }

    /**
     * Show the form for creating a new MainCategorie.
     *
     * @return Response
     */
    public function create()
    {
        
        
        $hasCustomField = in_array($this->mainCategorieRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->mainCategorieRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('main_categories.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created MainCategorie in storage.
     *
     * @param CreateMainCategorieRequest $request
     *
     * @return Response
     */
    public function store(CreateMainCategorieRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->mainCategorieRepository->model());
        try {
            $mainCategorie = $this->mainCategorieRepository->create($input);
            $mainCategorie->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($mainCategorie, 'image');
            }
            if (isset($input['image2']) && $input['image2']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image2']);
                $mediaItem = $cacheUpload->getMedia('image2')->first();
                $mediaItem->copy($mainCategorie, 'image2');
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.main_categorie')]));

        return redirect(route('mainCategories.index'));
    }

    /**
     * Display the specified MainCategorie.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $mainCategorie = $this->mainCategorieRepository->findWithoutFail($id);

        if (empty($mainCategorie)) {
            Flash::error('Main Categorie not found');

            return redirect(route('mainCategories.index'));
        }

        return view('main_categories.show')->with('mainCategorie', $mainCategorie);
    }

    /**
     * Show the form for editing the specified MainCategorie.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $mainCategorie = $this->mainCategorieRepository->findWithoutFail($id);
         $restaurant = $this->restaurantRepository->pluck('name', 'id');
        $restaurantsSelected = $mainCategorie->cuisines()->pluck('cuisines.id')->toArray();



        if (empty($mainCategorie)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.main_categorie')]));

            return redirect(route('mainCategories.index'));
        }
        $customFieldsValues = $mainCategorie->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->mainCategorieRepository->model());
        $hasCustomField = in_array($this->mainCategorieRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('main_categories.edit')->with('mainCategorie', $mainCategorie)->with("customFields", isset($html) ? $html : false)
            ->with("restaurant", $restaurant)->with("restaurantsSelected", $restaurantsSelected);
    }

    /**
     * Update the specified MainCategorie in storage.
     *
     * @param  int              $id
     * @param UpdateMainCategorieRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateMainCategorieRequest $request)
    {
        $mainCategorie = $this->mainCategorieRepository->findWithoutFail($id);

        if (empty($mainCategorie)) {
            Flash::error('Main Categorie not found');
            return redirect(route('mainCategories.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->mainCategorieRepository->model());
        try {
            $mainCategorie = $this->mainCategorieRepository->update($input, $id);
            $input['cuisines'] = isset($input['cuisines']) ? $input['cuisines'] : [];
         //   $mainCategorie->cuisines()->sync( $input['cuisines']);
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($mainCategorie, 'image');
            }
            if (isset($input['image2']) && $input['image2']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image2']);
                $mediaItem = $cacheUpload->getMedia('image2')->first();
                $mediaItem->copy($mainCategorie, 'image2');
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $mainCategorie->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.main_categorie')]));

        return redirect(route('mainCategories.index'));
    }

    /**
     * Remove the specified MainCategorie from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $mainCategorie = $this->mainCategorieRepository->findWithoutFail($id);

        if (empty($mainCategorie)) {
            Flash::error('Main Categorie not found');

            return redirect(route('mainCategories.index'));
        }

        $this->mainCategorieRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.main_categorie')]));

        return redirect(route('mainCategories.index'));
    }

        /**
     * Remove Media of MainCategorie
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $mainCategorie = $this->mainCategorieRepository->findWithoutFail($input['id']);
        try {
            if($mainCategorie->hasMedia($input['collection'])){
                $mainCategorie->getFirstMedias($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
