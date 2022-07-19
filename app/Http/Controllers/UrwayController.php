<?php
/**
 * File name: PayPalController.php
 * Last modified: 2020.06.11 at 16:10:52
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2020
 */

namespace App\Http\Controllers;

use App\Models\Payment;
use Flash;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use URWay\Client;

class UrwayController extends ParentOrderController
{
    /**
     * @var ExpressCheckout
     */
    protected $client;

    public function __init()
    {
        $this->client = new Client();

    }

    public function index()
    {
        return view('welcome');
    }

    /**
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function getExpressCheckout(Request $request)
    {
       // $user = $this->userRepository->findByField('api_token', $request->get('api_token'))->first();
     //   $coupon = $this->couponRepository->findByField('code', $request->get('coupon_code'))->first();
       // $deliveryId = $request->get('delivery_address_id');
        $user=auth()->user();
      //  $out = new \Symfony\Component\Console\Output\ConsoleOutput();
        Log::info('message');
        if (!empty($user)) {
            $this->order->user = $user;
            $this->order->user_id = $user->id;
            //   $this->order->delivery_address_id = $deliveryId;
            //  $this->coupon = $coupon;
          // $return_url =route('urway.callback');// url("payments/urway/express-checkout-success?user_id=" . $this->order->user_id . "&delivery_address_id=" .  '1');


            $this->client->setTrackId('100023910')
                ->setCustomerEmail('sammirahmed@hotmail.com')

                ->setCurrency('USD')
                ->setCountry('EG')
                ->setAmount(5);
           //     ->setRedirectUrl($return_url);



            $redirect_url = $this->client->pay();

            return redirect()->url($redirect_url);


        }



     //   $out->writeln("Hello from Terminal");
        Log::info('message');
      //  return "login success";
       // return redirect($response['paypal_link']);
     return redirect(route('login'));
    }


    /**
     * Set cart data for processing payment on PayPal.
     *
     *
     * @return array
     */
    private function getCheckoutData()
    {
        $data = [];
       // $data["METHOD"] = "SetExpressCheckout";
       // $this->calculateTotal();
        $order_id = $this->paymentRepository->all()->count() + 1;
        $data['items'] = [
            [
                'name'  => 'Product 1',
                'price' => 9.99,
                'qty'   => 1,
            ],
            [
                'name'  => 'Product 2',
                'price' => 4.99,
                'qty'   => 2,
            ],
        ];
        $data['total'] = 10;//$this->total;
        $data['return_url'] = url("payments/paypal/express-checkout-success?user_id=" . $this->order->user_id . "&delivery_address_id=" .  '1');

      //  $nvps["L_PAYMENTREQUEST_0_NUMBER0"] = "$Item";

        if (isset($this->coupon)) {
            $data['return_url'] .= "&coupon_code=" . $this->coupon->code;
        }
        $data['cancel_url'] = url('payments/paypal');
        $data['invoice_id'] = 'PAYPALDEMOAPP_'.$order_id;
        $data['invoice_description'] = "Order #$order_id Invoice";
        $data['cancel_url'] = url('/');

       // $data['invoice_id'] = $order_id . '_' . date("Y_m_d_h_i_sa");
       // $data['invoice_description'] = 'pay for golden';
        $total = 0;
        foreach ($data['items'] as $item) {
            $total += $item['price'] * $item['qty'];
        }

        $data['total'] = $total;
        //dd($data);
        return $data;
    }

    /**
     * Process payment on PayPal.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception
     */
    public function getExpressCheckoutSuccess(Request $request)
    {
        $token = $request->get('token');
        $PayerID = $request->get('PayerID');
        $this->order->user_id = $request->get('user_id', 0);
        $this->order->user = $this->userRepository->findWithoutFail($this->order->user_id);
        $this->coupon = $this->couponRepository->findByField('code', $request->get('coupon_code'))->first();
        $this->order->delivery_address_id = $request->get('delivery_address_id', 0);

        // Verify Express Checkout Token
        $response = $this->provider->getExpressCheckoutDetails($token);
        $payPalCart = $this->getCheckoutData();

        if (in_array(strtoupper($response['ACK']), ['SUCCESS', 'SUCCESSWITHWARNING'])) {

            // Perform transaction on PayPal
            $paymentStatus = $this->provider->doExpressCheckoutPayment($payPalCart, $token, $PayerID);
            Log::info($paymentStatus);
            $this->order->payment = new Payment();
            $this->order->payment->status = $paymentStatus['PAYMENTINFO_0_PAYMENTSTATUS'];
            $this->order->payment->method = 'PayPal';

            $this->createOrder();

            return redirect(url('payments/paypal'));
        } else {
            Flash::error("Error processing PayPal payment for your order");
            return redirect(route('payments.failed'));
        }
    }
}
