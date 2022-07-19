<?php
/**
 * File name: AppSettingController.php
 * Last modified: 2020.06.11 at 12:54:51
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 */

namespace App\Http\Controllers;

use App\Repositories\CurrencyRepository;
use App\Repositories\MainCategorieRepository;
use App\Repositories\RoleRepository;
use App\Repositories\UploadRepository;
use App\Repositories\UserRepository;
use Flash;
use Illuminate\Filesystem\Filesystem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Str;
use RachidLaasri\LaravelInstaller\Helpers\MigrationsHelper;
use Themsaid\Langman\Manager;
use Twilio\Rest\Client;

class AppSettingController extends Controller
{
    use MigrationsHelper;
    /** @var  UserRepository */
    private $userRepository;

    /**
     * @var RoleRepository
     */
    private $roleRepository;

    private $langManager;
    private $uploadRepository;
    private $currencyRepository;
    private $mcategoryRepository;

    public function __construct(UserRepository $userRepo, RoleRepository $roleRepo,MainCategorieRepository $mcategoryRepo , UploadRepository $uploadRepository, CurrencyRepository $currencyRepository)
    {
        parent::__construct();
        $this->userRepository = $userRepo;
        $this->roleRepository = $roleRepo;
        $this->currencyRepository = $currencyRepository;
        $this->langManager = new Manager(new Filesystem(), config('langman.path'), []);
        $this->uploadRepository = $uploadRepository;
        $this->mcategoryRepository = $mcategoryRepo;
    }

    public function update(Request $request)
    {
        if(!env('APP_DEMO',false)){ 
            $input = $request->except(['_method', '_token']);
            if (Str::endsWith(url()->previous(), "app/globals")) {
                if (empty($input['app_logo'])) {
                    unset($input['app_logo']);
                }

                if (empty($input['app_action1'])) {
                    unset($input['app_action1']);
                    $input['app_action11'] = $this->uploadRepository->findByField('uuid', setting('app_action1'))->first()->getFirstMediaUrl('app_action1' );

                }  else
                {
                    $input['app_action11'] = $this->uploadRepository->findByField('uuid', $input['app_action1'])->first()->getFirstMediaUrl('app_action1');
                    //$uploadaction2 = $this->uploadRepository->findByField('uuid', setting('app_action2'))->first();

                }
                if (empty($input['app_action2'])) {
                    unset($input['app_action2']);
                    $input['app_action22'] = $this->uploadRepository->findByField('uuid', setting('app_action2'))->first()->getFirstMediaUrl('app_action2' );

                }  else
                {
                    $input['app_action22'] = $this->uploadRepository->findByField('uuid', $input['app_action2'])->first()->getFirstMediaUrl('app_action2' );
                    //$uploadaction2 = $this->uploadRepository->findByField('uuid', setting('app_action2'))->first();

                }
                if (empty($input['custom_field_models'])) {
                    setting()->forget('custom_field_models');
                }
                if (!isset($input['blocked_ips'])) {
                    unset($input['blocked_ips']);
                    setting()->forget('blocked_ips');
                }
            } else if (Str::contains(url()->previous(), "payment")) {
                if (isset($input['default_currency'])) {
                    $currency = $this->currencyRepository->findWithoutFail($input['default_currency']);
                    if (!empty($currency)) {
                        $input['default_currency_id'] = $input['default_currency'];
                        $input['default_currency'] = $currency->symbol;
                        $input['default_currency_code'] = $currency->code;
                        $input['default_currency_decimal_digits'] = $currency->decimal_digits;
                        $input['default_currency_rounding'] = $currency->rounding;
                    }
                }
//                if(isset($input['enable_stripe']) && $input['enable_stripe'] == 1){
//                    $input['enable_razorpay'] = 0;
//                }
//                if(isset($input['enable_razorpay']) && $input['enable_razorpay'] == 1){
//                    $input['enable_stripe'] = 0;
//                }
            }
            if (empty($input['mail_password'])) {
                unset($input['mail_password']);
            }
            $input = array_map(function ($value) { return is_null($value)? false : $value; }, $input);

            setting($input)->save();
            Flash::success(trans('lang.app_setting_global').' updated successfully.');
            Artisan::call("config:clear");
        }else{
            Flash::warning('This is only demo app you can\'t change this section ');
        }

        return redirect()->back();
    }

    public function syncTranslation(Request $request)
    {
        if(!env('APP_DEMO',false)) {
            Artisan::call('langman:sync');
        }else{
            Flash::warning('This is only demo app you can\'t change this section ');
        }
        return redirect()->back();
    }

    public function checkForUpdates(Request $request)
    {
        if (!env('APP_DEMO', false)) {
            Artisan::call('config:clear');
            Artisan::call('cache:clear');
            Artisan::call('cache:forget', ['key' => 'spatie.permission.cache']);
            Artisan::call('view:clear');
            Artisan::call('route:clear');
            $executedMigrations = $this->getExecutedMigrations();
            $newMigrations = $this->getMigrations(config('installer.currentVersion', 'v100'));

            $containsUpdate = !empty($newMigrations) && count(array_intersect($newMigrations, $executedMigrations->toArray())) == count($newMigrations);
            if (!$containsUpdate) {
                return redirect(url('update/' . config('installer.currentVersion', 'v100')));
            }
        }
        Flash::warning(__('lang.app_setting_already_updated'));
        return redirect()->back();

    }
    public function sendMessage(Request $request)
    {
        $input = $request->except(['_method', '_token']);

        //    $message, $recipients;setting('TWILIO_NUMBER')
        $account_sid = setting("TWILIO_SID");
        $auth_token = setting("TWILIO_AUTH_TOKEN");
        $twilio_number = setting("TWILIO_NUMBER");
        $client = new Client($account_sid, $auth_token);
        $message = $client->messages->create($input['number'],
             ['from' => $twilio_number, 'body' => $input['msg']] );//
        Flash::success($message->sid. 'updated successfully.');
        return redirect()->back();

    }
    public function clearCache(Request $request)
    {
        if (!env('APP_DEMO', false)) {
            Artisan::call('cache:forget', ['key' => 'spatie.permission.cache']);
            Artisan::call('cache:clear');
            Artisan::call('config:clear');
            Artisan::call('view:clear');
            Artisan::call('route:clear');
            Flash::success(__('lang.app_setting_cache_is_cleared'));
        } else {
            Flash::warning('This is only demo app you can\'t change this section ');
        }
        return redirect()->back();
    }

    public function translate(Request $request)
    {
        //translate only lang.php file

        if(!env('APP_DEMO',false)) {
            $inputs = $request->except(['_method', '_token', '_current_lang']);
            $currentLang = $request->input('_current_lang');
            if (!$inputs && !count($inputs)) {
                Flash::error('Translate not loaded');
                return redirect()->back();
            }
            $langFiles = $this->langManager->files();
            $langFiles = array_filter($langFiles, function($v, $k) {
                return $k == 'lang';
            }, ARRAY_FILTER_USE_BOTH);

            if (!$langFiles && !count($langFiles)) {
                Flash::error('Translate not loaded');
                return redirect()->back();
            }
            foreach ($langFiles as $filename => $items) {
                $path = $items[$currentLang];
                $needed = [];
                foreach ($inputs as $key => $input) {
                    if (starts_with($key, $filename)) {
                        $langKeyWithoutFile = explode('|',$key,2)[1];
                        $needed = array_merge_recursive($needed , getNeededArray('|',$langKeyWithoutFile,$input));
                    }
                }
                ksort($needed);
                $this->langManager->writeFile($path, $needed);
            }
        }else{
            Flash::warning('This is only demo app you can\'t change this section ');
        }

        return redirect()->back();
    }


    public function index($type = null, $tab = null)
    {
        if (empty($type)) {
            Flash::error(trans('lang.app_setting_global').'not found');
            return redirect()->back();
        }
        $executedMigrations = $this->getExecutedMigrations();
        $newMigrations = $this->getMigrations(config('installer.currentVersion', 'v100'));
        $containsUpdate = !empty($newMigrations) && count(array_intersect($newMigrations, $executedMigrations->toArray())) != count($newMigrations);

        $langFiles = [];
        $languages = getAvailableLanguages();
        $mobileLanguages = getLanguages();
        if ($type && $type === 'translation' && $tab) {
            if (!array_has($languages, $tab)) {
                Flash::error('Translate not loaded');
                return redirect()->back();
            }
            $langFiles = $this->langManager->files();
            return view('settings.' . $type . '.index', compact(['languages', 'type', 'tab', 'langFiles']));

        }

        foreach (timezone_abbreviations_list() as $abbr => $timezone) {
            foreach ($timezone as $val) {
                if (isset($val['timezone_id'])) {
                    $group = preg_split('/\//', $val['timezone_id'])[0];
                    $timezones[$group][$val['timezone_id']] = $val['timezone_id'];
                }
            }
        }
        $upload = $this->uploadRepository->findByField('uuid', setting('app_logo'))->first();
        $uploadaction = $this->uploadRepository->findByField('uuid', setting('app_action1'))->first();
        $uploadaction2 = $this->uploadRepository->findByField('uuid', setting('app_action2'))->first();

        $currencies = $this->currencyRepository->all()->pluck('name_symbol', 'id');
        $restaurant = $this->mcategoryRepository->pluck('name', 'id');

        $customFieldModels = getModelsClasses(app_path('Models'));

        return view('settings.' . $type . '.' . $tab . '', compact(['languages', 'type', 'tab','uploadaction','uploadaction2','restaurant', 'langFiles', 'timezones', 'upload', 'customFieldModels', 'currencies', 'mobileLanguages', 'containsUpdate']));
    }

    public function initFirebase()
    {
        return response()->view('vendor.notifications.sw_firebase')->header('Content-Type', 'application/javascript');
    }


}
