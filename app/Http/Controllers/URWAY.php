<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;


use App\Models\Payment;
use Flash;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use URWay\Client;

class URWAY   extends ParentOrderController
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
    function get_server_ip() {
        $ipaddress = '';
        if (getenv('HTTP_CLIENT_IP'))
            $ipaddress = getenv('HTTP_CLIENT_IP');
        else if(getenv('HTTP_X_FORWARDED_FOR'))
            $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
        else if(getenv('HTTP_X_FORWARDED'))
            $ipaddress = getenv('HTTP_X_FORWARDED');
        else if(getenv('HTTP_FORWARDED_FOR'))
            $ipaddress = getenv('HTTP_FORWARDED_FOR');
        else if(getenv('HTTP_FORWARDED'))
            $ipaddress = getenv('HTTP_FORWARDED');
        else if(getenv('REMOTE_ADDR'))
            $ipaddress = getenv('REMOTE_ADDR');
        else
            $ipaddress = '156.214.230.71';
        return $ipaddress;
    }
    /**
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function getExpressCheckout(Request $request)
{
      $user = $this->userRepository->findByField('api_token', $request->get('api_token'))->first();
    $user = $this->userRepository->findByField('id', $request->get('user_id'))->first();

    $coupon = $this->couponRepository->findByField('code', $request->get('coupon_code'))->first();
     $pak_id = $request->get('pak_id');
    $pakege = $this->packageRepository->findByField('id', $pak_id)->first();

    //$user=auth()->user();
    //  $out = new \Symfony\Component\Console\Output\ConsoleOutput();
    Log::info('message');



    $idorder = 'PHP_' . rand(1, 1000);//Customer Order ID


    $terminalId = "heedo";// Will be provided by URWAY
    $password = "Urway@123";// Will be provided by URWAY
    $merchant_key = "82227d1eb5322321c8274545c59178e7d3e95b11b64a4c3085b0d520512dd9e8";// Will be provided by URWAY
    $currencycode = "SAR";
    if ( $request->get('amount')!=null)
        $amount =  $request->get('amount');
    else
        $amount = $pakege->amount;


if ($amount==0)
{
    $return_url =route('urway.callback',['user_id'=>  $request->get('user_id'),
        'Result'=>  'Successful',
        'ResponseCode'=> '000',
        'amount'=> $request->get('amount'),
        'pak_id'=>  $request->get('pak_id'), 'coupon_code'=>  $request->get('coupon_code') ]);

    header('Location: '. $return_url, true, 307);
    return redirect($return_url);
}

//$request->get('Result') === 'Successful'  &&  $request->get('ResponseCode')==='000'


    $ipp = $this->get_server_ip();
//Generate Hash
        $txn_details= $idorder.'|'.$terminalId.'|'.$password.'|'.$merchant_key.'|'.$amount.'|'.$currencycode;
        $hash=hash('sha256', $txn_details);
        $return_url =route('urway.callback',['user_id'=>  $request->get('user_id'),
            'pak_id'=>  $request->get('pak_id'), 'coupon_code'=>  $request->get('coupon_code') ]);

        $fields = array(
            'trackid' => $idorder,
            'terminalId' => $terminalId,
            'customerEmail' => $user->email,
            'action' => "1",  // action is always 1
            'merchantIp' =>$ipp,
            'password'=> $password,
            'currency' => $currencycode,
            'country'=>"SA",
            'amount' => $amount,
            "udf1"              =>"Test1",
            "udf2"              =>$return_url,//Response page URL
            "udf3"              =>"",
            "udf4"              =>"",
            "udf5"              =>"Test5",
            'requestHash' => $hash  //generated Hash
        );
        $data = json_encode($fields);
        $ch=curl_init('https://payments-dev.urway-tech.com/URWAYPGService/transaction/jsonProcess/JSONrequest'); // Will be provided by URWAY
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                'Content-Length: ' . strlen($data))
        );
        curl_setopt($ch, CURLOPT_TIMEOUT, 5);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
        //execute post
        $server_output =curl_exec($ch);
        //close connection
        curl_close($ch);
        $result = json_decode($server_output);
        if (!empty($result->payid) && !empty($result->targetUrl)) {
            $url = $result->targetUrl . '?paymentid=' .  $result->payid;
            header('Location: '. $url, true, 307);//Redirect to Payment Page
            return redirect($url);
        }else {

            print_r($result);
            echo "<br/>error <br/>";
            print_r($data);
            return;
        }






    if (!empty($user)) {
      //  $user=auth()->user();
        $this->order->user = $user;
        $this->order->user_id = $user->id;
        //   $this->order->delivery_address_id = $deliveryId;
          $this->coupon = $coupon;
        // $return_url =route('urway.callback');// url("payments/urway/express-checkout-success?user_id=" . $this->order->user_id . "&delivery_address_id=" .  '1');


        $this->client->setTrackId('100023910')
            ->setCustomerEmail('sammirahmed@hotmail.com')

            ->setCurrency('USD')
            ->setCountry('EG')
            ->setAmount(5);
        //     ->setRedirectUrl($return_url);



        try {
            $redirect_url = $this->client->pay();
            Log::error($redirect_url->getPaymentUrl());
            //   return redirect($response['paypal_link']);
            return "Error processing PayPal payment for your order :" .  json_decode( json_encode($redirect_url), true);;
            if (!empty($response['paypal_link'])) {
                return redirect($response['paypal_link']);
            } else {
                Flash::error($response['L_LONGMESSAGE0']);
                return "Error processing PayPal payment for your order : L_LONGMESSAGE0" . $response ;
            }
        } catch (\Exception $e) {

            Session::flash('flash_message', 'Task successfully added!');
            Log::error($e->getMessage());
            Flash::error("Error processing PayPal payment for your order :" . $e->getMessage());
            return "Error processing PayPal payment for your order :" . $e->getMessage();
            // $out->writeln("Hello from Terminal");
        }
        return redirect()->url($redirect_url);


    }



    //   $out->writeln("Hello from Terminal");
    Log::info('message');
    //  return "login success";
    // return redirect($response['paypal_link']);
   // return redirect(route('login'));
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
   // print_r($request);
  //  $user=auth()->user();
    $user = $this->userRepository->findByField('id', $request->get('user_id'))->first();

  //  $coupon = $this->couponRepository->findByField('code', $request->get('coupon_code'))->first();
    $pak_id = $request->get('pak_id');
    $this->pakge = $this->packageRepository->findByField('id', $pak_id)->first();
    $this->pak_id=$pak_id;
    $this->order->user_id = $request->get('user_id', 0);
   // $this->order->user = $this->userRepository->findWithoutFail($this->order->user_id);
    $this->coupon = $this->couponRepository->findByField('code', $request->get('coupon_code'))->first();
   // $this->order->delivery_address_id = $request->get('delivery_address_id', 0);

    if ( $request->get('Result') === 'Successful'  &&  $request->get('ResponseCode')==='000')
    {
        $trackid = $request->get('TrackId');
        $responseCode = $request->get('ResponseCode');

        $this->order->user = $user;
        $this->order->user_id = $user->id;
        $amount = $request->get('amount');
        $this->order->payment = new Payment();
        $this->order->payment->status = $request->get('Result');
        $this->order->payment->method = 'URWAY';
        $this->order->total=$amount;
        $this->total=$amount;
        $this->order->payment->price=$amount;
      //  echo   $this->order->total ;
       // $this->order->id=$trackid;
        $this->createOrderur();
        $return_url = url("payments?user_id=" . $this->order->user_id . "&delivery_address_id=" .  '1');

      //  return   redirect()->to(('payments'));
        $payid = $request->get('PaymentId');

        return view('payments.success',compact(['user','amount','payid']));

       //    echo $request ;
        return;
    }
 //   echo 'error' ;
   // print_r($data);
   // $user=auth()->user();
    $amount = $request->get('amount');
    $payid = $request->get('PaymentId');

    return view('payments.error',compact(['user','amount','payid']));
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
