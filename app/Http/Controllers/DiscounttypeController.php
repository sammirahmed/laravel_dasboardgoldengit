<?php

namespace App\Http\Controllers;

use App\DataTables\DiscounttypeDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateDiscounttypeRequest;
use App\Http\Requests\UpdateDiscounttypeRequest;
use App\Repositories\DiscounttypeRepository;
use App\Repositories\CustomFieldRepository;

use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class DiscounttypeController extends Controller
{
    /** @var  DiscounttypeRepository */
    private $discounttypeRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    

    public function __construct(DiscounttypeRepository $discounttypeRepo, CustomFieldRepository $customFieldRepo )
    {
        parent::__construct();
        $this->discounttypeRepository = $discounttypeRepo;
        $this->customFieldRepository = $customFieldRepo;
        
    }

    /**
     * Display a listing of the Discounttype.
     *
     * @param DiscounttypeDataTable $discounttypeDataTable
     * @return Response
     */
    public function index(DiscounttypeDataTable $discounttypeDataTable)
    {
        return $discounttypeDataTable->render('discounttypes.index');
    }

    /**
     * Show the form for creating a new Discounttype.
     *
     * @return Response
     */
    public function create()
    {
        
        
        $hasCustomField = in_array($this->discounttypeRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->discounttypeRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('discounttypes.create')->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created Discounttype in storage.
     *
     * @param CreateDiscounttypeRequest $request
     *
     * @return Response
     */
    public function store(CreateDiscounttypeRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->discounttypeRepository->model());
        try {
            $discounttype = $this->discounttypeRepository->create($input);
            $discounttype->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.discounttype')]));

        return redirect(route('discounttypes.index'));
    }

    /**
     * Display the specified Discounttype.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $discounttype = $this->discounttypeRepository->findWithoutFail($id);

        if (empty($discounttype)) {
            Flash::error('Discounttype not found');

            return redirect(route('discounttypes.index'));
        }

        return view('discounttypes.show')->with('discounttype', $discounttype);
    }

    /**
     * Show the form for editing the specified Discounttype.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $discounttype = $this->discounttypeRepository->findWithoutFail($id);
        
        

        if (empty($discounttype)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.discounttype')]));

            return redirect(route('discounttypes.index'));
        }
        $customFieldsValues = $discounttype->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->discounttypeRepository->model());
        $hasCustomField = in_array($this->discounttypeRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('discounttypes.edit')->with('discounttype', $discounttype)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified Discounttype in storage.
     *
     * @param  int              $id
     * @param UpdateDiscounttypeRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateDiscounttypeRequest $request)
    {
        $discounttype = $this->discounttypeRepository->findWithoutFail($id);

        if (empty($discounttype)) {
            Flash::error('Discounttype not found');
            return redirect(route('discounttypes.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->discounttypeRepository->model());
        try {
            $discounttype = $this->discounttypeRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $discounttype->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.discounttype')]));

        return redirect(route('discounttypes.index'));
    }

    /**
     * Remove the specified Discounttype from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $discounttype = $this->discounttypeRepository->findWithoutFail($id);

        if (empty($discounttype)) {
            Flash::error('Discounttype not found');

            return redirect(route('discounttypes.index'));
        }

        $this->discounttypeRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.discounttype')]));

        return redirect(route('discounttypes.index'));
    }

        /**
     * Remove Media of Discounttype
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $discounttype = $this->discounttypeRepository->findWithoutFail($input['id']);
        try {
            if($discounttype->hasMedia($input['collection'])){
                $discounttype->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
