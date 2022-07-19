<?php

namespace App\Http\Controllers;

use App\DataTables\SubscriptionDataTable;
use App\Http\Requests;
use App\Http\Requests\CreateSubscriptionRequest;
use App\Http\Requests\UpdateSubscriptionRequest;
use App\Models\Cycle;
use App\Models\Package;
use App\Repositories\CycleRepository;
use App\Repositories\PackageRepository;
use App\Repositories\ServiceRepository;
use App\Repositories\SubscriptionRepository;
use App\Repositories\CustomFieldRepository;

use App\Repositories\UserRepository;

use Flash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Prettus\Validator\Exceptions\ValidatorException;

class SubscriptionController extends Controller
{
    /** @var  SubscriptionRepository */
    private $subscriptionRepository;

    /**
     * @var CustomFieldRepository
     */
    private $customFieldRepository;

    private $packageRepo;

    /** @var  PackageRepository */
    private $subscriptionRepo;

    public function __construct(SubscriptionRepository $subscriptionRepo,UserRepository $userRepo,PackageRepository $packageRepo, CustomFieldRepository $customFieldRepo )
    {
        parent::__construct();
        $this->subscriptionRepository = $subscriptionRepo;
        $this->customFieldRepository = $customFieldRepo;
        $this->packageRepo = $packageRepo;
        $this->subscriptionRepo = $userRepo;
    }

    /**
     * Display a listing of the Subscription.
     *
     * @param SubscriptionDataTable $subscriptionDataTable
     * @return Response
     */
    public function index(SubscriptionDataTable $subscriptionDataTable)
    {
        return $subscriptionDataTable->render('subscriptions.index');
    }

    /**
     * Show the form for creating a new Subscription.
     *
     * @return Response
     */
    public function create()
    {

        $package = $this->packageRepo->pluck('name', 'id');
        $user = $this->subscriptionRepo->pluck('name', 'id');


        $hasCustomField = in_array($this->subscriptionRepository->model(),setting('custom_field_models',[]));
            if($hasCustomField){
                $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->subscriptionRepository->model());
                $html = generateCustomField($customFields);
            }
        return view('subscriptions.create')->with('subscription', null)
            ->with("package", $package)->with("user", $user)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Store a newly created Subscription in storage.
     *
     * @param CreateSubscriptionRequest $request
     *
     * @return Response
     */
    public function store(CreateSubscriptionRequest $request)
    {
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->subscriptionRepository->model());
        try {
            if (isset($input['package_id']) && $input['package_id']) {
                $input['service_id'] = $this->packageRepo->find($input['package_id'])->service_id;
                $input['cycle_id']  = $this->packageRepo->find($input['package_id'])->cycle_id;

              //   $input['suspended_at']

            }
            $subscription = $this->subscriptionRepository->create($input);
            $subscription->customFieldsValues()->createMany(getCustomFieldsValues($customFields,$request));
            
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.saved_successfully',['operator' => __('lang.subscription')]));

        return redirect(route('subscriptions.index'));
    }
    public function getamout(Request $request)
    {
        $data = Cycle::where("id",$request->id)->get();
        $output="";

        echo $data;
    }
    /**
     * Display the specified Subscription.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $subscription = $this->subscriptionRepository->findWithoutFail($id);

        if (empty($subscription)) {
            Flash::error('Subscription not found');

            return redirect(route('subscriptions.index'));
        }

        return view('subscriptions.show')->with('subscription', $subscription);
    }

    /**
     * Show the form for editing the specified Subscription.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $subscription = $this->subscriptionRepository->findWithoutFail($id);

        $package = $this->packageRepo->pluck('name', 'id');
        $user = $this->subscriptionRepo->pluck('name', 'id');


        if (empty($subscription)) {
            Flash::error(__('lang.not_found',['operator' => __('lang.subscription')]));

            return redirect(route('subscriptions.index'));
        }
        $customFieldsValues = $subscription->customFieldsValues()->with('customField')->get();
        $customFields =  $this->customFieldRepository->findByField('custom_field_model', $this->subscriptionRepository->model());
        $hasCustomField = in_array($this->subscriptionRepository->model(),setting('custom_field_models',[]));
        if($hasCustomField) {
            $html = generateCustomField($customFields, $customFieldsValues);
        }

        return view('subscriptions.edit')->with('subscription', $subscription)
            ->with("package", $package)->with("user", $user)->with("customFields", isset($html) ? $html : false);
    }

    /**
     * Update the specified Subscription in storage.
     *
     * @param  int              $id
     * @param UpdateSubscriptionRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateSubscriptionRequest $request)
    {
        $subscription = $this->subscriptionRepository->findWithoutFail($id);

        if (empty($subscription)) {
            Flash::error('Subscription not found');
            return redirect(route('subscriptions.index'));
        }
        $input = $request->all();
        $customFields = $this->customFieldRepository->findByField('custom_field_model', $this->subscriptionRepository->model());
        try {
            $subscription = $this->subscriptionRepository->update($input, $id);
            
            
            foreach (getCustomFieldsValues($customFields, $request) as $value){
                $subscription->customFieldsValues()
                    ->updateOrCreate(['custom_field_id'=>$value['custom_field_id']],$value);
            }
        } catch (ValidatorException $e) {
            Flash::error($e->getMessage());
        }

        Flash::success(__('lang.updated_successfully',['operator' => __('lang.subscription')]));

        return redirect(route('subscriptions.index'));
    }

    /**
     * Remove the specified Subscription from storage.
     *
     * @param  int $id
     *
     * @return Response
     */
    public function destroy($id)
    {
        $subscription = $this->subscriptionRepository->findWithoutFail($id);

        if (empty($subscription)) {
            Flash::error('Subscription not found');

            return redirect(route('subscriptions.index'));
        }

        $this->subscriptionRepository->delete($id);

        Flash::success(__('lang.deleted_successfully',['operator' => __('lang.subscription')]));

        return redirect(route('subscriptions.index'));
    }

        /**
     * Remove Media of Subscription
     * @param Request $request
     */
    public function removeMedia(Request $request)
    {
        $input = $request->all();
        $subscription = $this->subscriptionRepository->findWithoutFail($input['id']);
        try {
            if($subscription->hasMedia($input['collection'])){
                $subscription->getFirstMedia($input['collection'])->delete();
            }
        } catch (\Exception $e) {
            Log::error($e->getMessage());
        }
    }
}
