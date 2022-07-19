@if($customFields)
<h5 class="col-12 pb-4">{!! trans('lang.main_fields') !!}</h5>
@endif
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">
  <!-- Name Field -->
  <div class="form-group row ">
    {!! Form::label('name', trans("lang.category_name"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('name', null,  ['class' => 'form-control','placeholder'=>  trans("lang.category_name_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.category_name_help") }}
      </div>
    </div>
  </div>

  <!-- Description Field -->
  <div class="form-group row ">
    {!! Form::label('description', trans("lang.category_description"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::textarea('description', null, ['class' => 'form-control','placeholder'=>
       trans("lang.category_description_placeholder")  ]) !!}
      <div class="form-text text-muted">{{ trans("lang.category_description_help") }}</div>
    </div>
  </div>
</div>
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">
  <div class="form-group row ">
    {!! Form::label('amount', trans("مبلغ الاشتراك"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::number('amount', null,  ['class' => 'form-control','placeholder'=>  trans("مثال  : ١١"),'step'=>"any", 'min'=>"0"]) !!}
      <div class="form-text text-muted">
        {{ trans("ادخل مبلغ ") }}
      </div>
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
,   $package !=null ?  $package->status: 'active'
, ['class' => 'select2 form-control']) !!}
      <div class="form-text text-muted">
        {{ trans("الحالة") }}
      </div>
    </div>
  </div>
  <!-- service_id Field -->
  <div class="form-group row ">
    {!! Form::label('category_id', trans("نوع الاشتراك"),['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::select('service_id', $service, null, ['class' => 'select2 form-control']) !!}
      <div class="form-text text-muted">{{ trans("نوع الاشتراك") }}</div>
    </div>
  </div>
  <!-- cycle_id Field -->
  <div class="form-group row ">
    {!! Form::label('category_id', trans("دورة القبض"),['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::select('cycle_id', $cycle, null, ['class' => 'select2 form-control']) !!}
      <div class="form-text text-muted">{{ trans("اختر دورة القبض") }}</div>
    </div>
  </div>
  <div class="form-group row ">
    {!! Form::label('enter', trans("عدد مرات الدخول"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::number('enter', null,  ['class' => 'form-control','placeholder'=>  trans("مثال  : ١١"),'step'=>"any", 'min'=>"-10"]) !!}
      <div class="form-text text-muted">
        {{ trans("ادخل العدد ") }}
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
  <button type="submit" class="btn btn-{{setting('theme_color')}}" ><i class="fa fa-save"></i> {{trans('lang.save')}} {{trans('lang.package')}}</button>
  <a href="{!! route('packages.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.cancel')}}</a>
</div>
