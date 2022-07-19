<?php
/**
 * File name: ParentOrderController.php
 * Last modified: 2020.06.11 at 16:10:52
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 */

namespace App\Http\Controllers;

use App\Models\Coupon;
use App\Models\Cycle;
use App\Models\Order;
use App\Notifications\NewOrder;
use App\Repositories\CartRepository;
use App\Repositories\CouponRepository;
use App\Repositories\NotificationRepository;
use App\Repositories\OrderRepository;
use App\Repositories\OrderStatusRepository;
use App\Repositories\PackageRepository;
use App\Repositories\PaymentRepository;
use App\Repositories\FoodOrderRepository;
use App\Repositories\SubscriptionRepository;
use App\Repositories\UserRepository;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Notification;
use Prettus\Validator\Exceptions\ValidatorException;
use Exception;

abstract class ParentOrderController extends Controller
{
    /** @var  OrderRepository */
    protected $orderRepository;
    /** @var  FoodOrderRepository */
    protected $foodOrderRepository;
    /** @var  CartRepository */
    protected $cartRepository;
    /** @var  UserRepository */
    protected $userRepository;
    /** @var  PaymentRepository */
    protected $paymentRepository;
    /** @var  NotificationRepository */
    protected $notificationRepository;

    /** @var double */
    protected $total;
    /** @var double */
    protected $subtotal;

    /** @var Order */
    protected $order;
    /** @var Coupon */
    protected $coupon;
    protected $pakge;
    protected $pak_id;
    /**
     * @var OrderStatusRepository
     */
    protected $orderStatusRepository;
    /**
     * @var CouponRepository
     */
    protected $couponRepository;

    protected $subscriptionRepository;
 protected $packageRepository;
    /**
     * OrderAPIController constructor.
     * @param OrderRepository $orderRepo
     * @param FoodOrderRepository $foodOrderRepository
     * @param CartRepository $cartRepo
     * @param PaymentRepository $paymentRepo
     * @param NotificationRepository $notificationRepo
     * @param UserRepository $userRepository
     */
    public function __construct(OrderRepository $orderRepo, FoodOrderRepository $foodOrderRepository,
                                SubscriptionRepository $subscriptionRepository,
                                PackageRepository $packageRepository,CartRepository $cartRepo, PaymentRepository $paymentRepo, NotificationRepository $notificationRepo, UserRepository $userRepository, OrderStatusRepository $orderStatusRepository, CouponRepository $couponRepository)
    {
        parent::__construct();
        $this->orderRepository = $orderRepo;
        $this->foodOrderRepository = $foodOrderRepository;
        $this->subscriptionRepository = $subscriptionRepository;
        $this->packageRepository = $packageRepository;
        $this->cartRepository = $cartRepo;
        $this->userRepository = $userRepository;
        $this->paymentRepository = $paymentRepo;
        $this->notificationRepository = $notificationRepo;
        $this->orderStatusRepository = $orderStatusRepository;
        $this->couponRepository = $couponRepository;
        $this->order = new Order();
        $this->coupon = new Coupon();

        $this->__init();
    }

    abstract public function __init();

    protected function createOrder()
    {
        if (isset($this->order->payment->status)) {
            $this->calculateTotal();
            $this->order->order_status_id = 1;
            try {
                $orders = (collect($this->order))->only('user_id', 'order_status_id', 'tax', 'delivery_address_id', 'delivery_fee', 'hint')->toArray();
                $order = $this->orderRepository->create($orders);
                $this->order->id = $order->id;
                $this->syncFoods();
                $payment = $this->createPayment();
                $this->cartRepository->deleteWhere(['user_id' => $this->order->user_id]);
                $this->orderRepository->update(['payment_id' => $payment->id], $this->order->id);
            } catch (ValidatorException $e) {
                Log::error($e->getMessage());
            }
            $this->sendNotificationToManagers();
        }
    }
    protected function createOrderur()
    {
        if (isset($this->order->payment->status)) {
          //  $this->calculateTotal();
            $this->order->order_status_id = 1;
            try {
                $orders = (collect($this->order))->only('user_id', 'order_status_id', 'tax', 'delivery_address_id', 'delivery_fee', 'hint')->toArray();
                $order = $this->orderRepository->create($orders);
                $this->order->id = $order->id;
                $this->syncSubscription();
                $payment = $this->createPayment();
               // $this->cartRepository->deleteWhere(['user_id' => $this->order->user_id]);
               $this->orderRepository->update(['payment_id' => $payment->id], $this->order->id);
            } catch (ValidatorException $e) {
                Log::error($e->getMessage());
            }
           // $this->sendNotificationToManagers();
        }
    }
    /*
    public function applyCoupon($coupon): float
    {
        $price = $this->getPrice();
        if(isset($coupon)   ){
            if ($coupon->discount_type == 'fixed') {
                $price -= $coupon->discount;
            } else {
                $price = $price - ($price * $coupon->discount / 100);
            }
            if ($price < 0) $price = 0;
        }
        return $price;
    }

    /**
     * @return float
     */
    protected function calculateTotal(): float
    {
        $carts = $this->order->user->cart;
        foreach ($carts as $_cart) {
            $price = $_cart->food->applyCoupon($this->coupon);
            foreach ($_cart->extras as $option) {
                $price += $option->price;
            }
            $this->total += $price * $_cart->quantity;
        }
        $this->subtotal = $this->total;

        $this->calculateDeliveryFee();
        $this->calculateTaxFee();

        $this->total = round($this->total, 2);

        return $this->total;
    }

    /**
     * calculate the total of order with delivery fee
     */
    protected function calculateDeliveryFee(): void
    {
        try {
            $carts = $this->order->user->cart;
            $this->order->delivery_fee = $carts[0]->food->restaurant->delivery_fee;
            $this->total += $this->order->delivery_fee;
        } catch (Exception $exception) {
            Log::error($exception->getMessage());
        }
    }

    /**
     * calculate the total of the order with the tax fee
     */
    protected function calculateTaxFee(): void
    {
        try {
            $carts = $this->order->user->cart;
            if (empty($carts[0]->food->restaurant->default_tax)) {
                $this->order->tax = setting('default_tax', 0);
            } else {
                $this->order->tax = $carts[0]->food->restaurant->default_tax;
            }
            $this->total += $this->total * ($this->order->tax / 100);

        } catch (Exception $exception) {
            Log::error($exception->getMessage());
        }
    }

    protected function syncFoods()
    {

        foreach ($this->order->user->cart as $cart) {
            $foods = [
                'order_id' => $this->order->id,
                'food_id' => $cart->food_id,
                'price' => $cart->food->applyCoupon($this->coupon),
                'quantity' => $cart->quantity,
                'options' => $cart->extras->pluck('id')->toArray(),
            ];
            try {
                $this->foodOrderRepository->create($foods);
            } catch (ValidatorException $e) {
            }

        }
    }

    protected function syncSubscription()
    {
        $this->subscriptionRepository->deleteWhere(['user_id' => $this->order->user_id]);
        $this->userRepository->update(['num_enter' => $this->pakge->enter], $this->order->user_id);
        $iSecsInDay = 86400;
        $data = Cycle::where("id",$this->pakge->cycle_id)->get()->first();;

        $iTotalDays =$data->num_days;
        $user_signup = time() + ($iSecsInDay * $iTotalDays);
         {
            $foods = [
                'user_id'=> $this->order->user_id,
                'package_id'=> $this->pakge->id,
                'service_id'=> $this->pakge->service_id,
                 'cycle_id'=> $this->pakge->cycle_id,
                'expires_at'=> date('y:m:d',$user_signup),
                'suspended_at'=> date('y:m:d',$user_signup),
                'interval'=> 1,
                'status'=> 'active',

            ];
            try {
               $this->subscriptionRepository->create($foods);
            } catch (ValidatorException $e) {
            }

        }
    }

    /**
     * @return mixed
     * @throws ValidatorException
     */
    protected function createPayment()
    {

        $payment = $this->paymentRepository->create([
            "user_id" => $this->order->user_id,
            "description" => $this->order->payment->description ?? trans("lang.payment_order_done"),
            "price" => $this->order->payment->price,
            "status" => $this->order->payment->status,
            "method" => $this->order->payment->method,
        ]);

        return $payment;
    }

    protected function sendNotificationToManagers()
    {
        Notification::send($this->order->user->cart[0]->food->restaurant->users, new NewOrder($this->order));
    }

}
