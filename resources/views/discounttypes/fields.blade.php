@if($customFields)
<h5 class="col-12 pb-4">{!! trans('lang.main_fields') !!}</h5>
@endif
<div class="d-flex flex-column col-sm-12 col-md-6">
  <div class="form-group row ">
    {!! Form::label('name', trans("Discount Type"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('name', null,  ['class' => 'form-control','placeholder'=>  trans("Discount Type")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.extra_group_name_help") }}
      </div>
    </div>
  </div>
</div>
<!-- Description Field -->
<div class="form-group row ">
  {!! Form::label('description', trans("lang.extra_description"), ['class' => 'col-3 control-label text-right']) !!}
  <div class="col-9">
    {!! Form::textarea('description', null, ['class' => 'form-control','placeholder'=>
     trans("lang.extra_description_placeholder")  ]) !!}
    <div class="form-text text-muted">{{ trans("lang.extra_description_help") }}</div>
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
  <button type="submit" class="btn btn-{{setting('theme_color')}}" ><i class="fa fa-save"></i> {{trans('lang.save')}} {{trans('lang.discounttype')}}</button>
  <a href="{!! route('discounttypes.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.cancel')}}</a>
</div>
