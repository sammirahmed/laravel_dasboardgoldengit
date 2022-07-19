@if($customFields)
<h5 class="col-12 pb-4">{!! trans('lang.main_fields') !!}</h5>
@endif
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">
  <!-- service_id Field -->
  <div class="form-group row ">
    {!! Form::label('category_id', trans("العضو"),['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::select('user_id', $user, null, ['class' => 'select2 form-control']) !!}
      <div class="form-text text-muted">{{ trans("اختر العضو") }}</div>
    </div>
  </div>




  <div class="form-group row ">
    {!! Form::label('interval', trans("مدة الاشتراك"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::number('interval', '1',  ['class' => 'form-control','placeholder'=>  trans("مثال  : ١١"),'step'=>"any", 'min'=>"1"]) !!}
      <div class="form-text text-muted">
        {{ trans("ادخل عدد المرات ") }}
      </div>
    </div>
  </div>
  <!-- Expires At Field -->
  <div class="form-group row ">
    {!! Form::label('expires_at', trans("lang.coupon_expires_at"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('expires_at',  null,  ['id' => 'expire','class' => 'form-control datepicker','autocomplete'=>'off','placeholder'=>  trans("lang.coupon_expires_at_placeholder") , 'readonly' => 'true' ]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.coupon_expires_at_help") }}
      </div>
    </div>
  </div>

</div>
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">


  <!-- cycle_id Field -->
  <div class="form-group row ">
    {!! Form::label('category_id', trans("الباقة"),['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::select('package_id', $package, null, ['class' => 'select2 form-control', 'id' => 'cat_id']) !!}
      <div class="form-text text-muted">{{ trans("اختر الباقة") }}</div>
    </div>
  </div>

  <div class="form-group row ">
    {!! Form::label('status', trans("الحالة"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::select('status',
            [
'active' => trans('Active'),
'expire' => trans('Expire'),

]
,   $subscription !=null ?  $subscription->status: 'active'
, ['class' => 'select2 form-control']) !!}
      <div class="form-text text-muted">
        {{ trans("الحالة") }}
      </div>
    </div>
  </div>

</div>
@if($customFields)
<div class="clearfix"></div>
<div class="col-12 custom-field-container">
  <h5 class="col-12 pb-4">{!! trans('lang.custom_field_plural') !!}</h5>
  {!! $customFields !!}
</div>
@endif
<!-- Submit Field -->
<div class="form-group col-12 text-right">
  <button type="submit" class="btn btn-{{setting('theme_color')}}" ><i class="fa fa-save"></i> {{trans('lang.save')}} {{trans('lang.subscription')}}</button>
  <a href="{!! route('subscriptions.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.cancel')}}</a>
</div>
