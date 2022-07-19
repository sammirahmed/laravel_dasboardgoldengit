@extends('layouts.settings.default')
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
@section('settings_title',trans('lang.user_table'))
@section('settings_content')
    @include('flash::message')
    @include('adminlte-templates::common.errors')
    <div class="clearfix"></div>
    <div class="card">
        <div class="card-header">
            <ul class="nav nav-tabs align-items-end card-header-tabs w-100">

                <li class="nav-item">
                    <a class="nav-link " href="{!! url('settings/sms/builder') !!}">
                        <i class="fa fa-envelope-o mr-2"></i>{{trans('SMS Default')}}
                        @if(setting('enable_stripe',false))<span class="badge ml-2 badge-success">{{trans('lang.active')}}</span>@endif
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="{!! url('settings/sms/sendsms') !!}">
                        <i class="fa fa-envelope-o mr-2"></i>{{trans('Send SMS')}}@if(setting('enable_razorpay',false))<span class="badge ml-2 badge-success">{{trans('lang.active')}}</span>@endif
                    </a>
                </li>
            </ul>
        </div>
        <div class="card-body">
            {!! Form::open(['url' => ['settings/sendsms'], 'method' => 'post']) !!}
            <div class="row">
                <div style="flex: 70%;max-width: 70%;padding: 0 4px;" class="column">
                <!-- 'Boolean enable_facebook Field' -->

                    <!-- facebook_app_id Field -->


                    <div class="form-group row col-12">
                        {!! Form::label('stripe_key', trans('TWILIO_NUMBER'), ['class' => 'col-3 control-label text-right']) !!}
                        <div class="col-9">
                            {!! Form::text('number', '+201118994058',  ['class' => 'form-control','placeholder'=>  trans('NUMBER')]) !!}
                            <div class="form-text text-muted">
                                {!! trans('INSERT YOUR TWILIO NUMBER IN [E.164] FORMAT') !!}
                            </div>
                        </div>
                    </div>
                    <div class="form-group row ">
                        {!! Form::label('description', trans("Notification Message"), ['class' => 'col-3 control-label text-right']) !!}
                        <div class="col-9">
                            {!! Form::textarea('msg', null, ['class' => 'form-control','placeholder'=>
                             trans("lang.category_description_placeholder")  ]) !!}
                            <div class="form-text text-muted">{{ trans("lang.category_description_help") }}</div>
                        </div>
                    </div>
                </div>
                </div>

                <div style="flex: 30%;max-width: 30%;padding: 0 4px;" class="column">
                    <!-- TODO explain stripe here-->
                </div>
                <!-- Submit Field -->
                <div class="form-group mt-4 col-12 text-right">
                    <button type="submit" class="btn btn-{{setting('theme_color')}}"><i class="fa fa-save"></i> {{trans('Send SMS NOW')}}  </button>
                    <a href="{!! route('users.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.cancel')}}</a>
                </div>

            </div>
            {!! Form::close() !!}
            <div class="clearfix"></div>
        </div>
    </div>
    </div>
    @include('layouts.media_modal',['collection'=>null])
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
@endpush
