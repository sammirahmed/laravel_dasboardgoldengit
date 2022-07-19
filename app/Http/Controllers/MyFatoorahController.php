<?php

namespace App\Http\Controllers;

use MyFatoorah\Library\PaymentMyfatoorahApiV2;

class MyFatoorahController extends Controller {

    public $mfObj;

    /**
     * create MyFatoorah object
     */
    public function __construct() {
        $this->mfObj = new PaymentMyfatoorahApiV2(config('myfatoorah.api_key'), config('myfatoorah.country_iso'), config('myfatoorah.test_mode'));
    }

    /**
     * Create MyFatoorah invoice
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        try {
            $paymentMethodId = 0; // 0 for MyFatoorah invoice or 1 for Knet in test mode
            $data            = $this->mfObj->getInvoiceURL($this->getPayLoadData(), $paymentMethodId);
            if (!empty($data['invoiceURL'])) {
                return redirect($data['invoiceURL']);
            } else {
              //  Flash::error($response['L_LONGMESSAGE0']);
                return response()->json(['IsSuccess' => 'true', 'Message' => 'Invoice created successfully.', 'Data' => $data]);

            }
        } catch (\Exception $e) {
            return response()->json(['IsSuccess' => 'false', 'Message' => $e->getMessage()]);
        }
    }

    /**
     * 
     * @param int|string $orderId
     * @return array
     */
    private function getPayLoadData($orderId = null) {
        $callbackURL = route('myfatoorah.callback');
      //  $callbackURLer = route('error');
        $orderId=1203322;
        return [
            'CustomerName'       => 'Ahmed Samir',
            'InvoiceValue'       => '1',
            'DisplayCurrencyIso' => 'KWD',
            'CustomerEmail'      => 'test12@test.com',
            'CallBackUrl'        => $callbackURL,
            'ErrorUrl'           => $callbackURL,
            'MobileCountryCode'  => '+965',
            'CustomerMobile'     => '12345678',
            'Language'           => 'en',
            'CustomerReference'  => $orderId,
            'SourceInfo'         => 'Laravel ' . app()::VERSION . ' - MyFatoorah Package ' . MYFATOORAH_LARAVEL_PACKAGE_VERSION
        ];
    }

    /**
     * Get MyFatoorah payment information
     * 
     * @return \Illuminate\Http\Response
     */
    public function callback() {
        try {
            $data = $this->mfObj->getPaymentStatus(request('paymentId'), 'PaymentId');

            if ($data->InvoiceStatus == 'Paid') {
                $msg = 'Invoice is paid.';
            } else if ($data->InvoiceStatus == 'Failed') {
                $msg = 'Invoice is not paid due to ' . $data->InvoiceError;
            } else if ($data->InvoiceStatus == 'Expired') {
                $msg = 'Invoice is expired.';
            }
            
            return response()->json(['IsSuccess' => 'true', 'Message' => $msg, 'Data' => $data]);
        } catch (\Exception $e) {
            return response()->json(['IsSuccess' => 'false', 'Message' => $e->getMessage()]);
        }
    }

}
