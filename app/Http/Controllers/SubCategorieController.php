<?php

namespace App\Http\Controllers;

use App\DataTables\SubCategorieDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateSubCategorieRequest;
use App\Http\Requests\UpdateSubCategorieRequest;
use App\Repositories\MainCategorieRepository;
use App\Repositories\SubCategorieRepository;
use App\Repositories\CustomFieldRepository;

use App\Repositories\UploadRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class SubCategorieController extends Controller
{
    /** @var  SubCategorieRepository */
    private $subCategorieRepository;
    private $mcategoryRepository;
    /**
     * @var UploadRepository
     */
    private $uploadRepository;
    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    

    public function __construct(SubCategorieRepository $subCategorieRepo, CustomFieldRepository $customFieldRepo,
                                MainCategorieRepository $mcategoryRepo , UploadRepository $uploadRepo)
    {
        parent::__construct();
        $this->subCategorieRepository = $subCategorieRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->mcategoryRepository = $mcategoryRepo;
        $this->uploadRepository = $uploadRepo;
        
    }

    /**
     * Display a listing of the SubCategorie.
     *
     * @param SubCategorieDataTable $subCategorieDataTable
     * @return Response
     */
    public function index(SubCategorieDataTable $subCategorieDataTable)
    {
        return $subCategorieDataTable->render('sub_categories.index');
    }

    /**
     * Show the form for creating a new SubCategorie.
     *
     * @return Response
     */
    public function create()
    {

        $restaurant = $this->mcategoryRepository->pluck('name', 'id');

        $hasCustomField = in_array($this->subCategorieRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->subCategorieRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('sub_categories.create')->with("customFields", isset($html) ? $html : false)
            ->with("items", $restaurant)->with("category", $restaurant);
    }

    /**
     * Store a newly created SubCategorie in storage.
     *
     * @param CreateSubCategorieRequest $request
     *
     * @return Response
     */
    public function store(CreateSubCategorieRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->subCategorieRepository->model());
        try {
            $subCategorie = $this->subCategorieRepository->create($input);
            $subCategorie->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($subCategorie, 'image');
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.sub_categorie')]));

        return redirect(route('subCategories.index'));
    }

    /**
     * Display the specified SubCategorie.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $subCategorie = $this->subCategorieRepository->findWithoutFail($id);

        if (empty($subCategorie)) {
            Flash::error('Sub Categorie not found');

            return redirect(route('subCategories.index'));
        }

        return view('sub_categories.show')->with('subCategorie', $subCategorie);
    }

    /**
     * Show the form for editing the specified SubCategorie.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $subCategorie = $this->subCategorieRepository->findWithoutFail($id);

        $restaurant = $this->mcategoryRepository->pluck('name', 'id');
      //  $restaurantsSelected = $subCategorie->cuisines()->pluck('cuisines.id')->toArray();



        if (empty($subCategorie)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.sub_categorie')]));

            return redirect(route('subCategories.index'));
        }
        $customFieldsValues = $subCategorie->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->subCategorieRepository->model());
        $hasCustomField = in_array($this->subCategorieRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('sub_categories.edit')->with('subCategorie', $subCategorie)->with("customFields", isset($html) ? $html : false)
            ->with("items", $restaurant)->with("category", $restaurant);
    }

    /**
     * Update the specified SubCategorie in storage.
     *
     * @param  int              $id
     * @param UpdateSubCategorieRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateSubCategorieRequest $request)
    {
        $subCategorie = $this->subCategorieRepository->findWithoutFail($id);

        if (empty($subCategorie)) {
            Flash::error('Sub Categorie not found');
            return redirect(route('subCategories.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->subCategorieRepository->model());
        try {
            $subCategorie = $this->subCategorieRepository->update($input, $id);

            if (isset($input['image']) && $input['image']) {
                $cacheUpload = $this->uploadRepository->getByUuid($input['image']);
                $mediaItem = $cacheUpload->getMedia('image')->first();
                $mediaItem->copy($subCategorie, 'image');
            }
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $subCategorie->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.sub_categorie')]));

        return redirect(route('subCategories.index'));
    }

    /**
     * Remove the specified SubCategorie from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $subCategorie = $this->subCategorieRepository->findWithoutFail($id);

        if (empty($subCategorie)) {
            Flash::error('Sub Categorie not found');

            return redirect(route('subCategories.index'));
        }

        $this->subCategorieRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.sub_categorie')]));

        return redirect(route('subCategories.index'));
    }

        /**
     * Remove Media of SubCategorie
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $subCategorie = $this->subCategorieRepository->findWithoutFail($input['id']);
        try {
            if($subCategorie->hasMedia($input['collection'])){
                $subCategorie->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
