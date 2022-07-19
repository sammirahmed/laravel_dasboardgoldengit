@extends('layouts.app')
@push('css_lib')
<!-- iCheck -->
<link rel="stylesheet" href="{{asset('plugins/iCheck/flat/blue.css')}}">
<!-- select2 -->
<link rel="stylesheet" href="{{asset('plugins/select2/select2.min.css')}}">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="{{asset('plugins/summernote/summernote-bs4.css')}}">
{{--dropzone--}}
<link rel="stylesheet" href="{{asset('plugins/dropzone/bootstrap.min.css')}}">
@endpush
@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark">{{trans('lang.subscription_plural')}} <small>{{trans('lang.subscription_desc')}}</small></h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="{{url('/dashboard')}}"><i class="fa fa-dashboard"></i> {{trans('lang.dashboard')}}</a></li>
          <li class="breadcrumb-item"><a href="{!! route('subscriptions.index') !!}">{{trans('lang.subscription_plural')}}</a>
          </li>
          <li class="breadcrumb-item active">{{trans('lang.subscription_create')}}</li>
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->
<div class="content">
  <div class="clearfix"></div>
  @include('flash::message')
  @include('adminlte-templates::common.errors')
  <div class="clearfix"></div>
  <div class="card">
    <div class="card-header">
      <ul class="nav nav-tabs align-items-end card-header-tabs w-100">
        @can('subscriptions.index')
        <li class="nav-item">
          <a class="nav-link" href="{!! route('subscriptions.index') !!}"><i class="fa fa-list mr-2"></i>{{trans('lang.subscription_table')}}</a>
        </li>
        @endcan
        <li class="nav-item">
          <a class="nav-link active" href="{!! url()->current() !!}"><i class="fa fa-plus mr-2"></i>{{trans('lang.subscription_create')}}</a>
        </li>
      </ul>
    </div>
    <div class="card-body">
      {!! Form::open(['route' => 'subscriptions.store']) !!}
      <div class="row">
        @include('subscriptions.fields')
      </div>
      {!! Form::close() !!}
      <div class="clearfix"></div>
    </div>
  </div>
</div>
@include('layouts.media_modal')
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
    $('#cat_id').on('change', function () {
        var id = $(this).val();
        if (id) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                type: 'GET',
                url: '{{route('pak.numday' )}}',
                data: {id: id},

                success: function (result) {
                    var response = JSON.parse(result);
                    var  tim=new Date(new Date().setDate(new Date().getDate() + response[0].num_days)).toLocaleDateString('en-CA');
                    $("#expire").val( tim);
                    //   result= JSON.stringify(result);

                    console.log(response);
                    // alert(response[0].num_days);
                }
            });
        }
    });

    $( document ).ready(function() {

        var id = $("#cat_id").val();
    //    alert('{{route('pak.numday' )}}');
        if (id) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
           // id=0;
            $.ajax({
                type: 'GET',
                url: '{{route('pak.numday' )}}',
                data: {id: id},

                success: function (result) {
                    var response = JSON.parse(result);
                     var  tim=new Date(new Date().setDate(new Date().getDate() + response[0].num_days)).toLocaleDateString('en-CA');
                    $("#expire").val( tim);
                 //   result= JSON.stringify(result);

                    console.log(response);
                 // alert(response[0].num_days);
                }
            });
        }
    });
</script>
@endpush