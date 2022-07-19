<?php

namespace App\Http\Controllers;

use App\DataTables\PackageDataTable;
use App\Http\Requests;
use App\Http\Requests\CreatePackageRequest;
use App\Http\Requests\UpdatePackageRequest;
use App\Repositories\CycleRepository;
use App\Repositories\PackageRepository;
use App\Repositories\CustomFieldRepository;

use App\Repositories\ServiceRepository;
use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class PackageController extends Controller
{
    /** @var  PackageRepository */
    private $packageRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    /** @var  PackageRepository */
    private $cycleRepo;
    /** @var  PackageRepository */
    private $serviceRepo;

    public function __construct(PackageRepository $packageRepo,CycleRepository $cycleRepo,ServiceRepository $serviceRepo, CustomFieldRepository $customFieldRepo )
    {
        parent::__construct();
        $this->packageRepository = $packageRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->cycleRepo = $cycleRepo;
        $this->serviceRepo = $serviceRepo;
    }

    /**
     * Display a listing of the Package.
     *
     * @param PackageDataTable $packageDataTable
     * @return Response
     */
    public function index(PackageDataTable $packageDataTable)
    {
        return $packageDataTable->render('packages.index');
    }

    /**
     * Show the form for creating a new Package.
     *
     * @return Response
     */
    public function create()
    {

        $cycle = $this->cycleRepo->pluck('name', 'id');
        $service = $this->serviceRepo->pluck('name', 'id');

        $hasCustomField = in_array($this->packageRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->packageRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('packages.create')->with('package', null)->with("customFields", isset($html) ? $html : false)
            ->with("cycle", $cycle)->with("service", $service);;
    }

    /**
     * Store a newly created Package in storage.
     *
     * @param CreatePackageRequest $request
     *
     * @return Response
     */
    public function store(CreatePackageRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->packageRepository->model());
        try {
            $package = $this->packageRepository->create($input);
            $package->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.package')]));

        return redirect(route('packages.index'));
    }

    /**
     * Display the specified Package.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $package = $this->packageRepository->findWithoutFail($id);

        if (empty($package)) {
            Flash::error('Package not found');

            return redirect(route('packages.index'));
        }

        return view('packages.show')->with('package', $package);
    }

    /**
     * Show the form for editing the specified Package.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $package = $this->packageRepository->findWithoutFail($id);

        $cycle = $this->cycleRepo->pluck('name', 'id');
        $service = $this->serviceRepo->pluck('name', 'id');


        if (empty($package)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.package')]));

            return redirect(route('packages.index'));
        }
        $customFieldsValues = $package->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->packageRepository->model());
        $hasCustomField = in_array($this->packageRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('packages.edit')->with('package', $package)->with("customFields", isset($html) ? $html : false)
            ->with("cycle", $cycle)->with("service", $service);;;
    }

    /**
     * Update the specified Package in storage.
     *
     * @param  int              $id
     * @param UpdatePackageRequest $request
     *
     * @return Response
     */
    public function update($id, UpdatePackageRequest $request)
    {
        $package = $this->packageRepository->findWithoutFail($id);

        if (empty($package)) {
            Flash::error('Package not found');
            return redirect(route('packages.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->packageRepository->model());
        try {
            $package = $this->packageRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $package->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.package')]));

        return redirect(route('packages.index'));
    }

    /**
     * Remove the specified Package from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $package = $this->packageRepository->findWithoutFail($id);

        if (empty($package)) {
            Flash::error('Package not found');

            return redirect(route('packages.index'));
        }

        $this->packageRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.package')]));

        return redirect(route('packages.index'));
    }

        /**
     * Remove Media of Package
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $package = $this->packageRepository->findWithoutFail($input['id']);
        try {
            if($package->hasMedia($input['collection'])){
                $package->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
