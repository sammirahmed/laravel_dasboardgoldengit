@if($customFields)
<h5 class="col-12 pb-4">{!! trans('lang.main_fields') !!}</h5>
@endif
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">
  <!-- Name Field -->
  <div class="form-group row ">
    {!! Form::label('name', trans("lang.restaurant_name"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('name', null,  ['class' => 'form-control','placeholder'=>  trans("lang.restaurant_name_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.restaurant_name_help") }}
      </div>
    </div>
  </div>
    <!-- Restaurant Id Field -->
    <div class="form-group row ">
        {!! Form::label('brand_id', trans("lang.brand"),['class' => 'col-3 control-label text-right']) !!}
        <div class="col-9">
            {!! Form::select('brand_id', $brand, null, ['class' => 'select2 form-control']) !!}
            <div class="form-text text-muted">{{ trans("lang.brand_help") }}</div>
        </div>
    </div>
@hasanyrole('admin|manager')

  <!-- delivery_fee Field -->
  <div class="form-group row ">
    {!! Form::label('delivery_fee', trans("lang.restaurant_delivery_fee"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::number('delivery_fee', null,  ['class' => 'form-control','step'=>'any','placeholder'=>  trans("lang.restaurant_delivery_fee_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.restaurant_delivery_fee_help") }}
      </div>
    </div>
  </div>

  <!-- delivery_range Field -->
  <div class="form-group row ">
    {!! Form::label('delivery_range', trans("lang.restaurant_delivery_range"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::number('delivery_range', null,  ['class' => 'form-control', 'step'=>'any','placeholder'=>  trans("lang.restaurant_delivery_range_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.pharm_delivery_range_help") }}
      </div>
    </div>
  </div>

  <!-- default_tax Field -->
  <div class="form-group row ">
    {!! Form::label('default_tax', trans("lang.pharm_default_tax"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::number('default_tax', null,  ['class' => 'form-control', 'step'=>'any','placeholder'=>  trans("lang.restaurant_default_tax_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.restaurant_default_tax_help") }}
      </div>
    </div>
  </div>

@endhasanyrole

<!-- Phone Field -->
  <div class="form-group row ">
    {!! Form::label('phone', trans("lang.restaurant_phone"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('phone', null,  ['class' => 'form-control','placeholder'=>  trans("lang.restaurant_phone_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.restaurant_phone_help") }}
      </div>
    </div>
  </div>

  <!-- Mobile Field -->
  <div class="form-group row ">
    {!! Form::label('mobile', trans("lang.restaurant_mobile"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('mobile', null,  ['class' => 'form-control','placeholder'=>  trans("lang.restaurant_mobile_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.restaurant_mobile_help") }}
      </div>
    </div>
  </div>

  <!-- Address Field -->
  <div class="form-group row ">
    {!! Form::label('address', trans("lang.restaurant_address"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('address', null,  ['class' => 'form-control','placeholder'=>  trans("lang.restaurant_address_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.restaurant_address_help") }}
      </div>
    </div>
  </div>

  <!-- Latitude Field -->
  <div class="form-group row ">
    {!! Form::label('latitude', trans("lang.restaurant_latitude"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('latitude', null,  ['class' => 'form-control','placeholder'=>  trans("lang.restaurant_latitude_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.restaurant_latitude_help") }}
      </div>
    </div>
  </div>

  <!-- Longitude Field -->
  <div class="form-group row ">
    {!! Form::label('longitude', trans("lang.restaurant_longitude"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('longitude', null,  ['class' => 'form-control','placeholder'=>  trans("lang.restaurant_longitude_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.restaurant_longitude_help") }}
      </div>
    </div>
  </div>
  <!-- 'Boolean closed Field' -->
  <div class="form-group row ">
    {!! Form::label('closed', trans("lang.pharm_closed"),['class' => 'col-3 control-label text-right']) !!}
    <div class="checkbox icheck">
      <label class="col-9 ml-2 form-check-inline">
        {!! Form::hidden('closed', 0) !!}
        {!! Form::checkbox('closed', 1, null) !!}
      </label>
    </div>
  </div>

  <!-- 'Boolean available_for_delivery Field' -->
  <div class="form-group row ">
    {!! Form::label('available_for_delivery', trans("lang.restaurant_available_for_delivery"),['class' => 'col-3 control-label text-right']) !!}
    <div class="checkbox icheck">
      <label class="col-9 ml-2 form-check-inline">
        {!! Form::hidden('available_for_delivery', 0) !!}
        {!! Form::checkbox('available_for_delivery', 1, null) !!}
      </label>
    </div>
  </div>

</div>
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">

  <!-- Image Field -->
  <div class="form-group row">
    {!! Form::label('image', trans("lang.restaurant_image"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      <div style="width: 100%" class="dropzone image" id="image" data-field="image">
        <input type="hidden" name="image">
      </div>
      <a href="#loadMediaModal" data-dropzone="image" data-toggle="modal" data-target="#mediaModal" class="btn btn-outline-{{setting('theme_color','primary')}} btn-sm float-right mt-1">{{ trans('lang.media_select')}}</a>
      <div class="form-text text-muted w-50">
        {{ trans("lang.restaurant_image_help") }}
      </div>
    </div>
  </div>
  @prepend('scripts')
  <script type="text/javascript">

      var var15671147011688676454ble = '';
      @if(isset($pharmcy) && $pharmcy->hasMedia('image'))
          var15671147011688676454ble = {
          name: "{!! $pharmcy->getFirstMedia('image')->name !!}",
          size: "{!! $pharmcy->getFirstMedia('image')->size !!}",
          type: "{!! $pharmcy->getFirstMedia('image')->mime_type !!}",
          collection_name: "{!! $pharmcy->getFirstMedia('image')->collection_name !!}"
      };
              @endif
      var dz_var15671147011688676454ble = $(".dropzone.image").dropzone({
              url: "{!!url('uploads/store')!!}",
              addRemoveLinks: true,
              maxFiles: 1,
              init: function () {
                  @if(isset($pharmcy) && $pharmcy->hasMedia('image'))
                  dzInit(this, var15671147011688676454ble, '{!! url($pharmcy->getFirstMediaUrl('image','thumb')) !!}')
                @endif
              },
              accept: function (file, done) {
                  dzAccept(file, done, this.element, "{!!config('medialibrary.icons_folder')!!}");
              },
              sending: function (file, xhr, formData) {
                  dzSending(this, file, formData, '{!! csrf_token() !!}');
              },
              maxfilesexceeded: function (file) {
                  dz_var15671147011688676454ble[0].mockFile = '';
                  dzMaxfile(this, file);
              },
              complete: function (file) {
                  dzComplete(this, file, var15671147011688676454ble, dz_var15671147011688676454ble[0].mockFile);
                  dz_var15671147011688676454ble[0].mockFile = file;
              },
              removedfile: function (file) {
                  dzRemoveFile(
                      file, var15671147011688676454ble, '{!! url("pharmcy/remove-media") !!}',
                      'image', '{!! isset($pharmcy) ? $pharmcy->id : 0 !!}', '{!! url("uplaods/clear") !!}', '{!! csrf_token() !!}'
                  );
              }
          });
      dz_var15671147011688676454ble[0].mockFile = var15671147011688676454ble;
      dropzoneFields['image'] = dz_var15671147011688676454ble;
  </script>
@endprepend

<!-- Description Field -->
  <div class="form-group row ">
    {!! Form::label('description', trans("lang.restaurant_description"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::textarea('description', null, ['class' => 'form-control','placeholder'=>
       trans("lang.restaurant_description_placeholder")  ]) !!}
      <div class="form-text text-muted">{{ trans("lang.restaurant_description_help") }}</div>
    </div>
  </div>
  <!-- Information Field -->
  <div class="form-group row ">
    {!! Form::label('information', trans("lang.restaurant_information"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::textarea('information', null, ['class' => 'form-control','placeholder'=>
       trans("lang.restaurant_information_placeholder")  ]) !!}
      <div class="form-text text-muted">{{ trans("lang.restaurant_information_help") }}</div>
    </div>
  </div>
    <div class="form-group row ">
        {!! Form::label('information', trans("lang.start_information"), ['class' => 'col-3 control-label text-right']) !!}
        <div class="col-9">


            <input placeholder="Selected time" name="checkin" value="{!!  !empty($pharmcy) ? $pharmcy->checkin : '' !!}" type="text" id="input_starttime" class="form-control timepicker">
        </div>

    </div>
    <div class="form-group row ">
        {!! Form::label('information', trans("lang.end_information"), ['class' => 'col-3 control-label text-right']) !!}
        <div class="col-9">


            <input placeholder="Selected time"   name="checkout" value="{!!  !empty($pharmcy) ? $pharmcy->checkout : '' !!}"  type="text" id="input_starttime2" class="form-control timepicker">
        </div>

    </div>

    @prepend('scripts')
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script type="text/javascript">

            $('#input_starttime').timepicker({

            });
            $('#input_starttime2').timepicker({

            });
         //  $('#input_starttime').timepicker('setTime', new Date());



      //  $('#input_starttime') .timepicker({ zindex: 9999999});
    </script>
        @endprepend
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
  <button type="submit" class="btn btn-{{setting('theme_color')}}" ><i class="fa fa-save"></i> {{trans('lang.save')}} {{trans('lang.pharmcy')}}</button>
  <a href="{!! route('pharmcies.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.cancel')}}</a>
</div>
