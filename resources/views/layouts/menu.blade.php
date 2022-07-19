@can('dashboard')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('dashboard*') ? 'active' : '' }}" href="{!! url('dashboard') !!}">@if($icons)
                <i class="nav-icon fa fa-dashboard"></i>@endif
            <p>{{trans('لوحة التحكم')}}</p></a>
    </li>
@endcan

@can('favorites.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('favorites*') ? 'active' : '' }}" href="{!! route('favorites.index') !!}">@if($icons)
                <i class="nav-icon fa fa-heart"></i>@endif<p>{{trans('المفضلة')}}</p></a>
    </li>
@endcan

@can('services.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('services*') ? 'active' : '' }}" href="{!! route('services.index') !!}">@if($icons)<i class="nav-icon fa fa-file"></i>@endif<p>{{trans('lang.service_plural')}}</p></a>
    </li>
@endcan



@can('cycles.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('cycles*') ? 'active' : '' }}" href="{!! route('cycles.index') !!}">@if($icons)<i class="nav-icon fa fa-file"></i>@endif<p>{{trans('lang.cycle_plural')}}</p></a>
    </li>
@endcan

@can('packages.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('packages*') ? 'active' : '' }}" href="{!! route('packages.index') !!}">@if($icons)<i class="nav-icon fa fa-file"></i>@endif<p>{{trans('lang.package_plural')}}</p></a>
    </li>
@endcan

@can('subscriptions.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('subscriptions*') ? 'active' : '' }}" href="{!! route('subscriptions.index') !!}">@if($icons)<i class="nav-icon fa fa-file"></i>@endif<p>{{trans('lang.subscription_plural')}}</p></a>
    </li>
@endcan

@can('activities.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('activities*') ? 'active' : '' }}" href="{!! route('activities.index') !!}">@if($icons)<i class="nav-icon fa fa-file"></i>@endif<p>{{trans('lang.activity_plural')}}</p></a>
    </li>
@endcan

<li class="nav-item has-treeview {{ Request::is('settings/mobile*') || Request::is('slides*') ? 'menu-open' : '' }}">
    <a href="#" class="nav-link {{ Request::is('settings/mobile*') || Request::is('slides*') ? 'active' : '' }}">
        @if($icons)<i class="nav-icon fa fa-mobile"></i>@endif
        <p>
            {{trans('lang.mobile_menu')}}
            <i class="right fa fa-angle-left"></i>
        </p></a>
    <ul class="nav nav-treeview">
        <li class="nav-item">
            <a href="{!! url('settings/mobile/globals') !!}" class="nav-link {{  Request::is('settings/mobile/globals*') ? 'active' : '' }}">
                @if($icons)<i class="nav-icon fa fa-cog"></i> @endif <p>{{trans('lang.app_setting_globals')}}
                    <span class="right badge badge-danger">New</span></p>
            </a>
        </li>

        <li class="nav-item">
            <a href="{!! url('settings/mobile/colors') !!}" class="nav-link {{  Request::is('settings/mobile/colors*') ? 'active' : '' }}">
                @if($icons)<i class="nav-icon fa fa-pencil"></i> @endif <p>{{trans('lang.mobile_colors')}} <span class="right badge badge-danger">New</span>
                </p>
            </a>
        </li>

        <li class="nav-item">
            <a href="{!! url('settings/mobile/home') !!}" class="nav-link {{  Request::is('settings/mobile/home*') ? 'active' : '' }}">
                @if($icons)<i class="nav-icon fa fa-home"></i> @endif <p>{{trans('lang.mobile_home')}}
                    <span class="right badge badge-danger">New</span></p>
            </a>
        </li>

        @can('slides.index')
            <li class="nav-item">
                <a class="nav-link {{ Request::is('slides*') ? 'active' : '' }}" href="{!! route('slides.index') !!}">@if($icons)<i class="nav-icon fa fa-magic"></i>@endif<p>{{trans('lang.slide_plural')}} <span class="right badge badge-danger">New</span></p></a>
            </li>
        @endcan
    </ul>

</li>

<li class="nav-header">{{trans('التحكم في البرنامج')}}</li>
@can('users.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('users*') ? 'active' : '' }}" href="{!! route('users.index') !!}">@if($icons)
                <i class="nav-icon fa fa-users"></i>@endif
            <p>{{trans('lang.user_plural')}}</p></a>
    </li>
@endcan
@can('cuisines.indexxx')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('cuisines*') ? 'active' : '' }}" href="{!! route('cuisines.index') !!}">@if($icons)
                <i class="nav-icon fa fa-globe"></i>@endif<p>{{trans('lang.cuisine_plural')}}</p></a>
    </li>
@endcan

@can('brands.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('brands*') ? 'active' : '' }}" href="{!! route('brands.index') !!}">
            @if($icons)<i class="nav-icon fa fa-copyright"></i>@endif<p>{{trans('البرندات او المطاعم')}}</p></a>
    </li>
@endcan
@can('pharmcies.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('pharmcies*') ? 'active' : '' }}" href="{!! route('pharmcies.index') !!}">@if($icons)
                <i class="nav-icon fa fa-building"></i>@endif<p>{{trans('الفروع المرتبطة ')}}</p></a>
    </li>
@endcan
@can('campagins.indexxxx')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('campagins*') ? 'active' : '' }}" href="{!! route('campagins.index') !!}">@if($icons)<i class="nav-icon fa fa-opencart"></i>@endif<p>{{trans('lang.campagin_plural')}}</p></a>
    </li>
@endcan

@can('mainCategories.index')
    <li class="nav-item has-treeview {{ Request::is('mainCategories*')
    || Request::is('subCategories*') || Request::is('foodReviews*') || Request::is('nutrition*') ? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{ Request::is('subCategories*') || Request::is('mainCategories*') || Request::is('foodReviews*') || Request::is('nutrition*') ? 'active' : '' }}"> @if($icons)
                <i class="nav-icon fa fa-fire"></i>@endif
            <p>{{trans('التحكم في الاقسام')}} <i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">
            <li class="nav-item">
                <a class="nav-link {{ Request::is('mainCategories*') ? 'active' : '' }}"
                   href="{!! route('mainCategories.index') !!}">@if($icons)
                        <i class="nav-icon fa fa-plus-circle"></i>@endif<p>{{trans('الاقسام الرئيسية')}}</p></a>


            </li>
            @can('subCategories.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('subCategories*') ? 'active' : '' }}"
                       href="{!! route('subCategories.index') !!}">
                        @if($icons)<i class="nav-icon fa fa-plus-circle"></i>
                        @endif<p>{{trans('الاقسام الفرعية')}}</p></a>
                </li>
            @endcan

        </ul>
    </li>
@endcan
@can('proudctCopons.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('proudctCopons*') ? 'active' : '' }}" href="{!! route('proudctCopons.index') !!}">@if($icons)<i class="nav-icon fa fa-ticket"></i>@endif<p>{{trans('الكوبونات')}}</p></a>
    </li>
@endcan
@can('discounttypes.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('discounttypes*') ? 'active' : '' }}" href="{!! route('discounttypes.index') !!}">@if($icons)<i class="nav-icon fa fa-sort"></i>@endif<p>{{trans('اضافة انواع الخصومات')}}</p></a>
    </li>
@endcan
@can('airplans.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('airplans*') ? 'active' : '' }}" href="{!! route('airplans.index') !!}">@if($icons)<i class="nav-icon fa fa-plane"></i>@endif<p>{{trans('lang.airplan_plural')}}</p></a>
    </li>
@endcan

<!--
<li class="nav-item has-treeview {{ Request::is('storgePharms*') || Request::is('extraPruducts*')  || Request::is('pruducts*')
  || Request::is('productReviews*') || Request::is('extraGroupProuducts*') ? 'menu-open' : '' }}">
    <a href="#" class="nav-link {{ Request::is('storgePharms*') || Request::is('extraGroupProuducts*') || Request::is('productReviews*') || Request::is('pruducts*') || Request::is('extraPruducts*') ? 'active' : '' }}"> @if($icons)
            <i class="nav-icon fa fa-product-hunt"></i>@endif
        <p>{{trans('lang.category_products')}} <i class="right fa fa-angle-left"></i>
        </p>
    </a>
    <ul class="nav nav-treeview">
@can('pruducts.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('pruducts*') ? 'active' : '' }}" href="{!! route('pruducts.index') !!}">@if($icons)
                <i class="nav-icon fa fa-fire"></i>@endif<p>{{trans('lang.pruduct_plural')}}</p></a>
    </li>
        @endcan
    @can('extraGroupProuducts.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('extraGroupProuducts*') ? 'active' : '' }}"
                       href="{!! route('extraGroupProuducts.index') !!}">
                        @if($icons)<i class="nav-icon fa fa-plus-square"></i>
                        @endif<p>{{trans('lang.extra_group_prouduct_plural')}}</p>
                    </a>
                </li>
   @endcan

    @can('extraPruducts.index')
        <li class="nav-item">
            <a class="nav-link {{ Request::is('extraPruducts*') ? 'active' : '' }}"
               href="{!! route('extraPruducts.index') !!}">@if($icons)<i class="nav-icon fa fa-plus-square"></i>@endif<p>{{trans('lang.extra_pruduct_plural')}}</p></a>
        </li>
    @endcan

    @can('storgePharms.index')
        <li class="nav-item">
            <a class="nav-link {{ Request::is('storgePharms*') ? 'active' : '' }}"
               href="{!! route('storgePharms.index') !!}">
                @if($icons)<i class="nav-icon fa fa-plus-circle"></i>
                @endif<p>{{trans('lang.storge_pharm_plural')}}</p></a>
        </li>
    @endcan


    @can('productReviews.index')
        <li class="nav-item">
            <a class="nav-link {{ Request::is('productReviews*') ? 'active' : '' }}"
               href="{!! route('productReviews.index') !!}">@if($icons)<i class="nav-icon fa fa-comments"></i>@endif<p>{{trans('lang.product_reviews_plural')}}</p></a>
        </li>
    @endcan
    </ul>
</li>
-->
@can('restaurants.indexxx')
    <li class="nav-item has-treeview {{ (Request::is('restaurants*') || Request::is('requestedRestaurants*') || Request::is('galleries*') || Request::is('restaurantReviews*')) && !Request::is('restaurantsPayouts*') ? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{ (Request::is('restaurants*') || Request::is('requestedRestaurants*') || Request::is('galleries*') || Request::is('restaurantReviews*')) && !Request::is('restaurantsPayouts*')? 'active' : '' }}"> @if($icons)
                <i class="nav-icon fa fa-cutlery"></i>@endif
            <p>{{trans('lang.restaurant_plural')}} <i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">
            @can('restaurants.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('requestedRestaurants*') ? 'active' : '' }}" href="{!! route('requestedRestaurants.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-reorder"></i>@endif<p>{{trans('lang.requested_restaurants_plural')}}</p></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('restaurants*') ? 'active' : '' }}" href="{!! route('restaurants.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-cutlery"></i>@endif<p>{{trans('lang.restaurant_plural')}}</p></a>
                </li>
            @endcan
            @can('galleries.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('galleries*') ? 'active' : '' }}" href="{!! route('galleries.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-image"></i>@endif<p>{{trans('lang.gallery_plural')}}</p></a>
                </li>
            @endcan
            @can('restaurantReviews.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('restaurantReviews*') ? 'active' : '' }}" href="{!! route('restaurantReviews.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-comments"></i>@endif<p>{{trans('lang.restaurant_review_plural')}}</p></a>
                </li>
            @endcan
        </ul>
    </li>
@endcan



@can('foods.indexx')
    <li class="nav-item has-treeview {{ Request::is('foods*') || Request::is('extra*') || Request::is('foodReviews*') || Request::is('nutrition*') ? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{ Request::is('foods*') || Request::is('extra*') || Request::is('foodReviews*') || Request::is('nutrition*') ? 'active' : '' }}"> @if($icons)
                <i class="nav-icon fa fa-fire"></i>@endif
            <p>{{trans('lang.food_plural')}} <i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">
            @can('foods.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('foods*') ? 'active' : '' }}" href="{!! route('foods.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-fire"></i>@endif
                        <p>{{trans('lang.food_plural')}}</p></a>
                </li>
            @endcan
            @can('extraGroups.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('extraGroups*') ? 'active' : '' }}" href="{!! route('extraGroups.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-plus-square"></i>@endif<p>{{trans('lang.extra_group_plural')}}</p></a>
                </li>
            @endcan
            @can('extras.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('extras*') ? 'active' : '' }}" href="{!! route('extras.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-plus-circle"></i>@endif<p>{{trans('lang.extra_plural')}}</p></a>
                </li>
            @endcan

            @can('foodReviews.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('foodReviews*') ? 'active' : '' }}" href="{!! route('foodReviews.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-comments"></i>@endif<p>{{trans('lang.food_review_plural')}}</p></a>
                </li>
            @endcan


            @can('nutrition.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('nutrition*') ? 'active' : '' }}" href="{!! route('nutrition.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-tasks"></i>@endif<p>{{trans('lang.nutrition_plural')}}</p></a>
                </li>
            @endcan

        </ul>
    </li>
@endcan

@can('orders.index')
    <li class="nav-item has-treeview {{ Request::is('orders*') || Request::is('orderStatuses*') || Request::is('deliveryAddresses*')? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{ Request::is('orders*') || Request::is('orderStatuses*') || Request::is('deliveryAddresses*')? 'active' : '' }}"> @if($icons)
                <i class="nav-icon fa fa-shopping-basket"></i>@endif
            <p>{{trans('lang.order_plural')}} <i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">

            @can('orders.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('orders*') ? 'active' : '' }}" href="{!! route('orders.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-shopping-basket"></i>@endif<p>{{trans('lang.order_plural')}}</p></a>
                </li>
            @endcan
            @can('orderStatuses.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('orderStatuses*') ? 'active' : '' }}" href="{!! route('orderStatuses.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-server"></i>@endif<p>{{trans('lang.order_status_plural')}}</p></a>
                </li>
            @endcan

            @can('deliveryAddresses.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('deliveryAddresses*') ? 'active' : '' }}" href="{!! route('deliveryAddresses.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-map"></i>@endif<p>{{trans('lang.delivery_address_plural')}}</p></a>
                </li>
            @endcan

        </ul>
    </li>
@endcan

@can('coupons.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('coupons*') ? 'active' : '' }}" href="{!! route('coupons.index') !!}">@if($icons)<i class="nav-icon fa fa-ticket"></i>@endif<p>{{trans('lang.coupon_plural')}} <span class="right badge badge-danger">New</span></p></a>
    </li>
@endcan

@can('drivers.index')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('drivers*') ? 'active' : '' }}" href="{!! route('drivers.index') !!}">@if($icons)<i class="nav-icon fa fa-car"></i>@endif<p>{{trans('lang.driver_plural')}} </p></a>
    </li>
@endcan

@can('faqs.index')
    <li class="nav-item has-treeview {{ Request::is('faqCategories*') || Request::is('faqs*') ? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{ Request::is('faqs*') || Request::is('faqCategories*') ? 'active' : '' }}"> @if($icons)
                <i class="nav-icon fa fa-support"></i>@endif
            <p>{{trans('lang.faq_plural')}} <i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">
            @can('faqCategories.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('faqCategories*') ? 'active' : '' }}" href="{!! route('faqCategories.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-folder"></i>@endif<p>{{trans('lang.faq_category_plural')}}</p></a>
                </li>
            @endcan

            @can('faqs.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('faqs*') ? 'active' : '' }}" href="{!! route('faqs.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-question-circle"></i>@endif
                        <p>{{trans('lang.faq_plural')}}</p></a>
                </li>
            @endcan
        </ul>
    </li>
@endcan

<li class="nav-header">{{trans('lang.app_setting')}}</li>
@can('medias')
    <li class="nav-item">
        <a class="nav-link {{ Request::is('medias*') ? 'active' : '' }}" href="{!! url('medias') !!}">@if($icons)<i class="nav-icon fa fa-picture-o"></i>@endif
            <p>{{trans('lang.media_plural')}}</p></a>
    </li>
@endcan

@can('payments.index')
    <li class="nav-item has-treeview {{ Request::is('earnings*') || Request::is('driversPayouts*') || Request::is('restaurantsPayouts*') || Request::is('payments*') ? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{ Request::is('earnings*') || Request::is('driversPayouts*') || Request::is('restaurantsPayouts*') || Request::is('payments*') ? 'active' : '' }}"> @if($icons)
                <i class="nav-icon fa fa-credit-card"></i>@endif
            <p>{{trans('lang.payment_plural')}}<i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">

            @can('payments.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('payments*') ? 'active' : '' }}" href="{!! route('payments.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-money"></i>@endif<p>{{trans('lang.payment_plural')}}</p></a>
                </li>
            @endcan

            @can('earnings.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('earnings*') ? 'active' : '' }}" href="{!! route('earnings.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-money"></i>@endif<p>{{trans('lang.earning_plural')}} <span class="right badge badge-danger">New</span></p>
                    </a>
                </li>
            @endcan

            @can('driversPayouts.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('driversPayouts*') ? 'active' : '' }}" href="{!! route('driversPayouts.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-dollar"></i>@endif<p>{{trans('lang.drivers_payout_plural')}}</p></a>
                </li>
            @endcan

            @can('restaurantsPayouts.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('restaurantsPayouts*') ? 'active' : '' }}" href="{!! route('restaurantsPayouts.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-dollar"></i>@endif<p>{{trans('lang.restaurants_payout_plural')}}</p></a>
                </li>
            @endcan

        </ul>
    </li>
@endcan

@can('app-settings')
    <li class="nav-item has-treeview {{
    (Request::is('settings*') ||
     Request::is('users*')) && !Request::is('settings/mobile*')
        ? 'menu-open' : '' }}">
        <a href="#" class="nav-link {{
        (Request::is('settings*') ||
         Request::is('users*')) && !Request::is('settings/mobile*')
          ? 'active' : '' }}"> @if($icons)<i class="nav-icon fa fa-cogs"></i>@endif
            <p>{{trans('lang.app_setting')}} <i class="right fa fa-angle-left"></i>
            </p>
        </a>
        <ul class="nav nav-treeview">
            <li class="nav-item">
                <a href="{!! url('settings/app/globals') !!}" class="nav-link {{  Request::is('settings/app/globals*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-cog"></i> @endif <p>{{trans('lang.app_setting_globals')}}</p>
                </a>
            </li>


            @can('permissions.index')
                <li class="nav-item has-treeview {{ Request::is('settings/permissions*') || Request::is('settings/roles*') ? 'menu-open' : '' }}">
                    <a href="#" class="nav-link {{ Request::is('settings/permissions*') || Request::is('settings/roles*') ? 'active' : '' }}">
                        @if($icons)<i class="nav-icon fa fa-user-secret"></i>@endif
                        <p>
                            {{trans('lang.permission_menu')}}
                            <i class="right fa fa-angle-left"></i>
                        </p></a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a class="nav-link {{ Request::is('settings/permissions') ? 'active' : '' }}" href="{!! route('permissions.index') !!}">
                                @if($icons)<i class="nav-icon fa fa-circle-o"></i>@endif
                                <p>{{trans('lang.permission_table')}}</p>
                            </a>
                        </li>
                        @can('permissions.create')
                            <li class="nav-item">
                                <a class="nav-link {{ Request::is('settings/permissions/create') ? 'active' : '' }}" href="{!! route('permissions.create') !!}">
                                    @if($icons)<i class="nav-icon fa fa-circle-o"></i>@endif
                                    <p>{{trans('lang.permission_create')}}</p>
                                </a>
                            </li>
                        @endcan
                        @can('roles.index')
                            <li class="nav-item">
                                <a class="nav-link {{ Request::is('settings/roles') ? 'active' : '' }}" href="{!! route('roles.index') !!}">
                                    @if($icons)<i class="nav-icon fa fa-circle-o"></i>@endif
                                    <p>{{trans('lang.role_table')}}</p>
                                </a>
                            </li>
                        @endcan
                        @can('roles.create')
                            <li class="nav-item">
                                <a class="nav-link {{ Request::is('settings/roles/create') ? 'active' : '' }}" href="{!! route('roles.create') !!}">
                                    @if($icons)<i class="nav-icon fa fa-circle-o"></i>@endif
                                    <p>{{trans('lang.role_create')}}</p>
                                </a>
                            </li>
                        @endcan
                    </ul>

                </li>
            @endcan

            <li class="nav-item">
                <a class="nav-link {{ Request::is('settings/customFields*') ? 'active' : '' }}" href="{!! route('customFields.index') !!}">@if($icons)
                        <i class="nav-icon fa fa-list"></i>@endif<p>{{trans('lang.custom_field_plural')}}</p></a>
            </li>

            <li class="nav-item">
                <a href="{!! url('settings/app/localisation') !!}" class="nav-link {{  Request::is('settings/app/localisation*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-language"></i> @endif <p>{{trans('lang.app_setting_localisation')}}</p></a>
            </li>
            <li class="nav-item">
                <a href="{!! url('settings/translation/en') !!}" class="nav-link {{ Request::is('settings/translation*') ? 'active' : '' }}">
                    @if($icons) <i class="nav-icon fa fa-language"></i> @endif <p>{{trans('lang.app_setting_translation')}}</p></a>
            </li>
            @can('currencies.index')
                <li class="nav-item">
                    <a class="nav-link {{ Request::is('settings/currencies*') ? 'active' : '' }}" href="{!! route('currencies.index') !!}">@if($icons)
                            <i class="nav-icon fa fa-dollar"></i>@endif<p>{{trans('lang.currency_plural')}}</p></a>
                </li>
            @endcan

            <li class="nav-item">
                <a href="{!! url('settings/payment/payment') !!}" class="nav-link {{  Request::is('settings/payment*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-credit-card"></i> @endif <p>{{trans('lang.app_setting_payment')}}</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{!! url('settings/app/social') !!}" class="nav-link {{  Request::is('settings/app/social*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-globe"></i> @endif <p>{{trans('lang.app_setting_social')}}</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{!! url('settings/app/notifications') !!}" class="nav-link {{  Request::is('settings/app/notifications*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-bell"></i> @endif <p>{{trans('lang.app_setting_notifications')}}</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{!! url('settings/mail/smtp') !!}" class="nav-link {{ Request::is('settings/mail*') ? 'active' : '' }}">
                    @if($icons)<i class="nav-icon fa fa-envelope"></i> @endif <p>{{trans('lang.app_setting_mail')}}</p>
                </a>
            </li>

        </ul>
    </li>
@endcan


















@can('airports.index')
<li class="nav-item">
  <a class="nav-link {{ Request::is('airports*') ? 'active' : '' }}" href="{!! route('airports.index') !!}">@if($icons)<i class="nav-icon fa fa-file"></i>@endif<p>{{trans('lang.airport_plural')}}</p></a>
</li>
@endcan

