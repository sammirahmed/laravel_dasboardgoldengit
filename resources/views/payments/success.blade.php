@extends('layouts.appnouser')
@push('css_lib')
<!-- iCheck -->
<link rel="stylesheet" href="{{asset('plugins/iCheck/flat/blue.css')}}">
<!-- select2 -->
<link rel="stylesheet" href="{{asset('plugins/select2/select2.min.css')}}">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="{{asset('plugins/summernote/summernote-bs4.css')}}">
{{--dropzone--}}
<link rel="stylesheet" href="{{asset('plugins/dropzone/bootstrap.min.css')}}">
<style>

  .bg {
    background-color: #ffffff;
    width: 480px;
    overflow: hidden;
    margin: 0 auto;
    box-sizing: border-box;
    padding: 40px;

    font-family: 'Roboto';
    margin-top: 40px;
  }
  .card {
    background-color: #fff;
    width: 100%;
    float: left;
    flex: 1 0 0%;
    border-radius: 5px;
    box-sizing: border-box;
    margin-top: 40px;
    padding: 80px 30px 25px 30px;
    text-align: center;
    position: relative;

    box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  }
  .card__success {
    position: absolute;
    top: -50px;
    left: 145px;
    width: 100px;
    height: 100px;
    border-radius: 100%;
    background-color: #60c878;
    border: 5px solid #fff;
  }
  .card__success i {
    color: #fff;
    line-height: 100px;
    font-size: 45px;
  }
  .card__msg {
    text-transform: uppercase;
    color: #55585b;
    font-size: 18px;
    font-weight: 500;
    margin-bottom: 5px;
  }
  .card__submsg {
    color: #959a9e;
    font-size: 16px;
    font-weight: 400;
    margin-top: 0px;
  }
  .card__body {
    background-color: #f8f6f6;
    border-radius: 4px;
    width: 100%;
    margin-top: 30px;
    float: left;
    box-sizing: border-box;
    padding: 30px;
  }
  .card__avatar {
    width: 50px;
    height: 50px;
    border-radius: 100%;
    display: inline-block;
    margin-right: 10px;
    position: relative;
    top: 7px;
  }
  .card__recipient-info {
    display: inline-block;
  }
  .card__recipient {
    color: #232528;
    text-align: left;
    margin-bottom: 5px;
    font-weight: 600;
  }
  .card__email {
    color: #838890;
    text-align: left;
    margin-top: 0px;
  }
  .card__price {
    color: #232528;
    font-size: 70px;
    margin-top: 25px;
    margin-bottom: 30px;
  }
  .card__price span {
    font-size: 60%;
  }
  .card__method {
    color: #d3cece;
    text-transform: uppercase;
    text-align: left;
    font-size: 11px;
    margin-bottom: 5px;
  }
  .card__payment {
    background-color: #fff;
    border-radius: 4px;
    width: 100%;
    height: 100px;
    box-sizing: border-box;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .card__credit-card {
    width: 50px;
    display: inline-block;
    margin-right: 15px;
  }
  .card__card-details {
    display: inline-block;
    text-align: left;
  }
  .card__card-type {
    text-transform: uppercase;
    color: #232528;
    font-weight: 600;
    font-size: 12px;
    margin-bottom: 3px;
  }
  .card__card-number {
    color: #838890;
    font-size: 12px;
    margin-top: 0px;
  }
  .card__tags {
    clear: both;
    padding-top: 15px;
  }
  .card__tag {
    text-transform: uppercase;
    background-color: #f8f6f6;
    box-sizing: border-box;
    padding: 3px 5px;
    border-radius: 3px;
    font-size: 10px;
    color: #d3cece;
  }



</style>

@endpush
@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark">{{trans('lang.payment_plural')}}<small class="ml-3 mr-3">|</small><small>{{trans('lang.payment_desc')}}</small></h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="{{url('/dashboard')}}"><i class="fa fa-dashboard"></i> {{trans('lang.dashboard')}}</a></li>
          <li class="breadcrumb-item"><a href="{!! route('payments.index') !!}">{{trans('lang.payment_plural')}}</a>
          </li>
          <li class="breadcrumb-item active">{{trans('lang.payment_table')}}</li>
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<div class="content">
  <div class="clearfix"></div>
  <div style="flex: 100%;max-width: 100%;padding: 0 4px;" class="row" >
    <div class="clearfix"></div>
    @include('flash::message')
    @include('adminlte-templates::common.errors')
    <div class="clearfix"></div>
    <div class="card">
      <div class="bg">

        <div class="card">

          <span class="card__success"><i class="fa fa-check"></i></span>

          <h1 class="card__msg">Payment Complete</h1>
          <h2 class="card__submsg">Thank you for your transfer</h2>

          <div class="card__body">

            <div class="card__recipient-info">
              <p class="card__recipient">{{$user->name}}</p>
              <p class="card__email">{{$user->email}}</p>
            </div>

            <h1 class="card__price"><span>SR</span>{{$amount}}</h1>

            <p class="card__method">Payment method</p>
            <div class="card__payment">
              <img src="https://seeklogo.com/images/V/VISA-logo-F3440F512B-seeklogo.com.png" class="card__credit-card">
              <div class="card__card-details">
                <p class="card__card-type">Credit / debit card</p>
                <p class="card__card-number">Visa </p>
              </div>
            </div>

          </div>

          <div class="card__tags">
            <span class="card__tag">completed</span>
            <span class="card__tag">{{$payid}}</span>
          </div>

        </div>

      </div>

    </div>
  </div>

</div>
<!-- /.content-header -->


@endsection
@push('scripts_lib')
<!-- iCheck -->

<script src="{{asset('plugins/iCheck/icheck.min.js')}}"></script>
<!-- select2 -->
<script src="{{asset('plugins/select2/select2.min.js')}}"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="{{asset('plugins/summernote/summernote-bs4.min.js')}}"></script>
{{--dropzone--}}
<script src="{{asset('plugins/dropzone/dropzone.js')}}"></script>
<script type="text/javascript">
    Dropzone.autoDiscover = false;
    var dropzoneFields = [];
</script>


  <script>
      setTimeout(function() {
        window.location.href = "{{URL::to('payments/')}}"
      }, 2000); // 2 second
  </script>

@endpush