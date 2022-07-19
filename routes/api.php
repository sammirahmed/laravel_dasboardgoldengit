<?php
/**
 * File name: api.php
 * Last modified: 2020.08.20 at 17:21:16
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 */

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('driver')->group(function () {
    Route::post('login', 'API\Driver\UserAPIController@login');
    Route::post('register', 'API\Driver\UserAPIController@register');
    Route::post('send_reset_link_email', 'API\UserAPIController@sendResetLinkEmail');
    Route::get('user', 'API\Driver\UserAPIController@user');
    Route::get('logout', 'API\Driver\UserAPIController@logout');
    Route::get('settings', 'API\Driver\UserAPIController@settings');
});

Route::prefix('manager')->group(function () {
    Route::post('login', 'API\Manager\UserAPIController@login');
    Route::post('register', 'API\Manager\UserAPIController@register');
    Route::post('send_reset_link_email', 'API\UserAPIController@sendResetLinkEmail');
    Route::get('user', 'API\Manager\UserAPIController@user');
    Route::get('logout', 'API\Manager\UserAPIController@logout');
    Route::get('settings', 'API\Manager\UserAPIController@settings');
});


Route::post('login', 'API\UserAPIController@login');
Route::post('register', 'API\UserAPIController@register');
Route::post('send_reset_link_email', 'API\UserAPIController@sendResetLinkEmail');
Route::get('user', 'API\UserAPIController@user');
Route::get('logout', 'API\UserAPIController@logout');
Route::get('settings', 'API\UserAPIController@settings');
Route::post('uploadavatar', 'API\UserAPIControlle@upload');
Route::resource('cuisines', 'API\CuisineAPIController');
Route::resource('categories', 'API\CategoryAPIController');
Route::resource('restaurants', 'API\RestaurantAPIController');

Route::resource('faq_categories', 'API\FaqCategoryAPIController');
Route::get('foods/categories', 'API\FoodAPIController@categories');
Route::resource('foods', 'API\FoodAPIController');
Route::resource('galleries', 'API\GalleryAPIController');
Route::resource('food_reviews', 'API\FoodReviewAPIController');
Route::resource('nutrition', 'API\NutritionAPIController');
Route::resource('extras', 'API\ExtraAPIController');
Route::resource('extra_groups', 'API\ExtraGroupAPIController');
Route::resource('faqs', 'API\FaqAPIController');
Route::resource('restaurant_reviews', 'API\RestaurantReviewAPIController');
Route::resource('currencies', 'API\CurrencyAPIController');
Route::resource('slides', 'API\SlideAPIController')->except([
    'show'
]);

Route::middleware('auth:api')->group(function () {
    Route::group(['middleware' => ['role:driver']], function () {
        Route::prefix('driver')->group(function () {
            Route::resource('orders', 'API\OrderAPIController');
            Route::resource('notifications', 'API\NotificationAPIController');
            Route::post('users/{id}', 'API\UserAPIController@update');
            Route::resource('faq_categories', 'API\FaqCategoryAPIController');
            Route::resource('faqs', 'API\FaqAPIController');
        });
    });
    Route::group(['middleware' => ['role:manager']], function () {
        Route::prefix('manager')->group(function () {
            Route::post('users/{id}', 'API\UserAPIController@update');
            Route::get('users/drivers_of_restaurant/{id}', 'API\Manager\UserAPIController@driversOfRestaurant');
            Route::get('dashboard/{id}', 'API\DashboardAPIController@manager');
            Route::resource('restaurants', 'API\Manager\RestaurantAPIController');
            Route::resource('faq_categories', 'API\FaqCategoryAPIController');
            Route::resource('faqs', 'API\FaqAPIController');
        });
    });
    Route::post('users/{id}', 'API\UserAPIController@update');

    Route::resource('order_statuses', 'API\OrderStatusAPIController');

    Route::get('payments/byMonth', 'API\PaymentAPIController@byMonth')->name('payments.byMonth');
    Route::resource('payments', 'API\PaymentAPIController');

    Route::get('favorites/exist', 'API\FavoriteAPIController@exist');
    Route::resource('favorites', 'API\FavoriteAPIController');

    Route::resource('orders', 'API\OrderAPIController');

    Route::resource('food_orders', 'API\FoodOrderAPIController');

    Route::resource('notifications', 'API\NotificationAPIController');

    Route::get('carts/count', 'API\CartAPIController@count')->name('carts.count');
    Route::resource('carts', 'API\CartAPIController');

    Route::resource('delivery_addresses', 'API\DeliveryAddressAPIController');

    Route::resource('drivers', 'API\DriverAPIController');

    Route::resource('earnings', 'API\EarningAPIController');

    Route::resource('driversPayouts', 'API\DriversPayoutAPIController');

    Route::resource('restaurantsPayouts', 'API\RestaurantsPayoutAPIController');


});
Route::resource('coupons', 'API\CouponAPIController')->except([
    'show'
]);
Route::resource('posts', 'API\PostAPIController');

Route::resource('posts', 'API\PostAPIController');

Route::resource('brands', 'API\BrandAPIController');


Route::resource('categories', 'API\CategoryAPIController');

Route::resource('categories', 'API\CategoryAPIController');

Route::resource('categories', 'API\CategoryAPIController');

Route::resource('categories', 'API\CategoryAPIController');

Route::resource('main_categories', 'API\MainCategorieAPIController');

Route::resource('main_categories', 'API\MainCategorieAPIController');

Route::resource('sub_categories', 'API\SubCategorieAPIController');

Route::resource('sub_categories', 'API\SubCategorieAPIController');

Route::resource('pruducts', 'API\PruductAPIController');

Route::resource('pruducts', 'API\PruductAPIController');

Route::get('pruductspup','API\PruductAPIController@pup');
Route::resource('pharmcies', 'API\PharmcyAPIController');

Route::resource('pharmcies', 'API\PharmcyAPIController');

Route::resource('extra_group_prouducts', 'API\ExtraGroupProuductAPIController');

Route::resource('extra_group_prouducts', 'API\ExtraGroupProuductAPIController');

Route::resource('storge_pharms', 'API\StorgePharmAPIController');

Route::resource('storge_pharms', 'API\StorgePharmAPIController');

Route::resource('extra_pruducts', 'API\ExtraPruductAPIController');

Route::resource('extra_pruducts', 'API\ExtraPruductAPIController');

Route::resource('product_reviews', 'API\ProductReviewsAPIController');

Route::resource('product_reviews', 'API\ProductReviewsAPIController');

Route::resource('campagins', 'API\CampaginAPIController');

Route::resource('campagins', 'API\CampaginAPIController');

Route::resource('proudct_copons', 'API\ProudctCoponAPIController');

//Route::resource('proudct_copons', 'API\ProudctCoponAPIController');

Route::resource('discounttypes', 'API\DiscounttypeAPIController');

Route::resource('discounttypes', 'API\DiscounttypeAPIController');

Route::resource('airplans', 'API\airplanAPIController');

Route::resource('airplans', 'API\airplanAPIController');
Route::get('subcatg/{id}', 'API\SubCategorieAPIController@categories');

Route::resource('services', 'API\ServiceAPIController');

Route::resource('services', 'API\ServiceAPIController');

Route::resource('cycles', 'API\CycleAPIController');

Route::resource('cycles', 'API\CycleAPIController');

Route::resource('packages', 'API\PackageAPIController');

Route::resource('packages', 'API\PackageAPIController');

Route::resource('subscriptions', 'API\SubscriptionAPIController');

Route::resource('subscriptions', 'API\SubscriptionAPIController');

Route::resource('activities', 'API\ActivityAPIController');

Route::resource('activities', 'API\ActivityAPIController');

Route::resource('airports', 'API\AirportAPIController');

Route::resource('airports', 'API\AirportAPIController');