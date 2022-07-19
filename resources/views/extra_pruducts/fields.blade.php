@if($customFields)
<h5 class="col-12 pb-4">{!! trans('lang.main_fields') !!}</h5>
@endif
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">

  <div class="form-group row ">
    {!! Form::label('food_id', trans("lang.extra_food_id"),['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::select('product_id', $products, null, ['class' => 'select2 form-control']) !!}
      <div class="form-text text-muted">{{ trans("lang.extra_food_id_help") }}</div>
    </div>
  </div>

  <!-- Extra Group Id Field -->
  <div class="form-group row ">
    {!! Form::label('extra_group_id', trans("lang.extra_extra_group_id"),['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::select('extra_group_id', $extraGroup, null, ['class' => 'select2 form-control']) !!}
      <div class="form-text text-muted">{{ trans("lang.extra_extra_group_id_help") }}</div>
    </div>
  </div>

</div>
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">
  <!-- Name Field -->
  <div class="form-group row ">
    {!! Form::label('name', trans("lang.extra_value"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('name', null,  ['class' => 'form-control','placeholder'=>  trans("lang.extra_name_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.extra_value_help") }}
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
  <button type="submit" class="btn btn-{{setting('theme_color')}}" ><i class="fa fa-save"></i> {{trans('lang.save')}} {{trans('lang.extra_pruduct')}}</button>
  <a href="{!! route('extraPruducts.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.cancel')}}</a>
</div>
