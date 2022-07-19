@if($customFields)
<h5 class="col-12 pb-4">{!! trans('lang.main_fields') !!}</h5>
@endif
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">
  <!-- Name Field -->
  <div class="form-group row ">
    {!! Form::label('name', trans("lang.food_name"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('name', null,  ['class' => 'form-control','placeholder'=>  trans("lang.food_name_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.food_name_help") }}
      </div>
    </div>
  </div>

  <!-- Image Field -->
  <div class="form-group row">
    {!! Form::label('image', trans("lang.food_image"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      <div style="width: 100%" class="dropzone image" id="image" data-field="image">
        <input type="hidden" name="image">
        <input type="hidden" name="images">
      </div>
      <a href="#loadMediaModal" data-dropzone="image" data-multi="files" data-toggle="modal" data-target="#mediaModal" class="btn btn-outline-{{setting('theme_color','primary')}} btn-sm float-right mt-1">{{ trans('lang.media_select')}}</a>
      <div class="form-text text-muted w-50">
        {{ trans("lang.food_image_help") }}
      </div>
    </div>
  </div>
  @prepend('scripts')
  <script type="text/javascript">
      var var15671147171873255749ble = '';
      @if(isset($pruduct) && $pruduct->hasMedia('image'))

          var15671147171873255749ble = {
          name: "{!! $pruduct->getFirstMedia('image')->name !!}",
          size: "{!! $pruduct->getFirstMedia('image')->size !!}",
          type: "{!! $pruduct->getFirstMedia('image')->mime_type !!}",
          collection_name: "{!! $pruduct->getFirstMedia('image')->collection_name !!}"
      };
              @endif
      var dz_var15671147171873255749ble = $(".dropzone.image").dropzone({
              url: "{!!url('uploads/store')!!}",
              addRemoveLinks: true,
            //  uploadMultiple:true,
              init: function () {
                  @if(isset($pruduct) && $pruduct->hasMedia('image'))
                   @foreach ($pruduct->allMedias('image') as $element)
                      var15671147171873255749ble = {
                      name: "{!! $element->name !!}",
                      size: "{!! $element->size !!}",
                      type: "{!! $element->mime_type !!}",
                      upload: {uuid:"{!! $element->custom_properties['uuid'] !!}"},
                      collection_name: "{!! $element->collection_name !!}",

                  };
                  dzInitz(this, var15671147171873255749ble, '{!! url($pruduct->getMediaUrl($element,'image','thumb')) !!}')
                   @endforeach
                  @endif
              },
              accept: function (file, done) {
                  console.log('accept');
                  dzAccept(file, done, this.element, "{!!config('medialibrary.icons_folder')!!}");
              },
              sending: function (file, xhr, formData) {
                  console.log('sending');

                   dzSending(this, file, formData, '{!! csrf_token() !!}');
              },


               sendingmultiple: function (file, xhr, formData)
               {
                   console.log('sendingmultiple');
                   dzSendingmultiaple(this, file, formData, '{!! csrf_token() !!}');
               },
              maxfilesexceeded: function (file) {
                  dz_var15671147171873255749ble[0].mockFile = '';
                  dzMaxfile(this, file);
              },
              complete: function (file) {
                  zoo.push(file.upload.uuid);
                  this.element.children[1].value = zoo;



                  console.log(zoo);
                  dzComplete(this, file, var15671147171873255749ble, dz_var15671147171873255749ble[0].mockFile);
                   dz_var15671147171873255749ble[0].mockFile = file;
                  console.log(dz_var15671147171873255749ble);
                  console.log(file);
              },
              removedfile: function (file) {
                  dzRemoveFiles(
                      file, var15671147171873255749ble, '{!! url("pruducts/remove-media") !!}',
                      'image', '{!! isset($pruduct) ? $pruduct->id : 0 !!}',file.upload.uuid, '{!! url("uplaods/clear") !!}', '{!! csrf_token() !!}'
                  );
                  console.info( this);
                  const index = zoo.indexOf(file.upload.uuid);
                  if (index > -1) {
                      zoo.splice(index, 1);
                  }
                  console.log(zoo);

              }
          });
      dz_var15671147171873255749ble[0].mockFile = var15671147171873255749ble;
      dropzoneFields['image'] = dz_var15671147171873255749ble;
      var zoo = [];
  </script>
@endprepend

<!-- Price Field -->
  <div class="form-group row ">
    {!! Form::label('price', trans("lang.food_price"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::number('price', null,  ['class' => 'form-control','placeholder'=>  trans("lang.food_price_placeholder"),'step'=>"any", 'min'=>"0"]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.food_price_help") }}
      </div>
    </div>
  </div>

  <!-- Discount Price Field -->
  <div class="form-group row ">
    {!! Form::label('discount_price', trans("lang.food_discount_price"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::number('discount_price', null,  ['class' => 'form-control','placeholder'=>  trans("lang.food_discount_price_placeholder"),'step'=>"any", 'min'=>"0"]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.food_discount_price_help") }}
      </div>
    </div>
  </div>

  <!-- Description Field -->
  <div class="form-group row ">
    {!! Form::label('description', trans("lang.food_description"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::textarea('description', null, ['class' => 'form-control','placeholder'=>
       trans("lang.food_description_placeholder")  ]) !!}
      <div class="form-text text-muted">{{ trans("lang.food_description_help") }}</div>
    </div>
  </div>
   <div style="padding: 0 4px;"  class="form-group row ">
  <div style="flex: 33%;" class="form-group column">

  <!-- 'Boolean Featured Field' -->
  <div class="form-group row ">
    {!! Form::label('featured', trans("lang.food_featured"),['class' => 'col-9 control-label text-right']) !!}
    <div class="checkbox icheck">
      <label class="col-9 ml-2 form-check-inline">
        {!! Form::hidden('featured', 0) !!}
        {!! Form::checkbox('featured', 1, null) !!}
      </label>
    </div>
  </div>

  <!-- 'Boolean deliverable Field' -->
  <div class="form-group row ">
    {!! Form::label('deliverable', trans("lang.food_deliverable"),['class' => 'col-9 control-label text-right']) !!}
    <div class="checkbox icheck">
      <label class="col-9 ml-2 form-check-inline">
        {!! Form::hidden('deliverable', 0) !!}
        {!! Form::checkbox('deliverable', 1, null) !!}
      </label>
    </div>
  </div>
  <!-- 'Boolean refundable Field' -->
  <div class="form-group row ">
    {!! Form::label('refunduble', trans("lang.item_deliverable"),['class' => 'col-9 control-label text-right']) !!}
    <div class="checkbox icheck">
      <label class="col-9 ml-2 form-check-inline">
        {!! Form::hidden('refunduble', 0) !!}
        {!! Form::checkbox('refunduble', 1, null) !!}
      </label>
    </div>
  </div>
  </div>
  <div style="flex: 33%;" class="form-group column">

            <!-- 'Boolean Featured Field' -->
            <div class="form-group row ">
                {!! Form::label('lowstock', trans("lang.lowstock"),['class' => 'col-9 control-label text-right']) !!}
                <div class="checkbox icheck">
                    <label class="col-9 ml-2 form-check-inline">
                        {!! Form::hidden('showonlow', 0) !!}
                        {!! Form::checkbox('showonlow', 1, null) !!}
                    </label>
                </div>
            </div>

            <!-- 'Boolean deliverable Field' -->
            <div class="form-group row ">
                {!! Form::label('deliverable', trans("lang.best"),['class' => 'col-9 control-label text-right']) !!}
                <div class="checkbox icheck">
                    <label class="col-9 ml-2 form-check-inline">
                        {!! Form::hidden('best', 0) !!}
                        {!! Form::checkbox('best', 1, null) !!}
                    </label>
                </div>
            </div>
            <!-- 'Boolean refundable Field' -->
            <div class="form-group row ">
                {!! Form::label('deliverable', trans("lang.offer"),['class' => 'col-9 control-label text-right']) !!}
                <div class="checkbox icheck">
                    <label class="col-9 ml-2 form-check-inline">
                        {!! Form::hidden('offer', 0) !!}
                        {!! Form::checkbox('offer', 1, null) !!}
                    </label>
                </div>
            </div>
        </div>

</div>
</div>
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">

  <!-- Ingredients Field -->
  <div class="form-group row ">
    {!! Form::label('ingredients', trans("lang.food_ingredients"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::textarea('ingredients', null, ['class' => 'form-control','placeholder'=>
       trans("lang.food_ingredients_placeholder")  ]) !!}
      <div class="form-text text-muted">{{ trans("lang.food_ingredients_help") }}</div>
    </div>
  </div>

  <!-- unit Field -->
  <div class="form-group row ">
    {!! Form::label('unit', trans("lang.food_unit"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('unit', null,  ['class' => 'form-control','placeholder'=>  trans("lang.food_unit_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.food_unit_help") }}
      </div>
    </div>
  </div>

  <!-- package_items_count Field -->
  <div class="form-group row ">
    {!! Form::label('package_items_count', trans("lang.food_package_items_count"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::number('package_items_count', null,  ['class' => 'form-control','placeholder'=>  trans("lang.food_package_items_count_placeholder"),'step'=>"any", 'min'=>"0"]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.food_package_items_count_help") }}
      </div>
    </div>
  </div>




  <!-- Restaurants Cuisine -->
  <div class="form-group row ">
    {!! Form::label('restaurants[]', trans("lang.supplier"),['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::select('pharmciyes[]', $restaurant, $restaurantsSelected, ['class' => 'select2 form-control' , 'multiple'=>'multiple']) !!}
      <div class="form-text text-muted">{{ trans("lang.sublir_help") }}</div>
    </div>
  </div>


  <!-- Category Id Field -->
  <div class="form-group row ">
    {!! Form::label('category_id', trans("lang.food_category_id"),['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::select('category_id', $category, null, ['class' => 'select2 form-control']) !!}
      <div class="form-text text-muted">{{ trans("lang.food_category_id_help") }}</div>
    </div>
  </div>
  <!-- Restaurant Id Field -->
  <div class="form-group row ">
    {!! Form::label('restaurant_id', trans("lang.brand"),['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::select('brand_id', $brand, null, ['class' => 'select2 form-control']) !!}
      <div class="form-text text-muted">{{ trans("lang.brand_help") }}</div>
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
  <button type="submit" class="btn btn-{{setting('theme_color')}}" ><i class="fa fa-save"></i> {{trans('lang.save')}} {{trans('lang.pruduct')}}</button>
  <a href="{!! route('pruducts.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.cancel')}}</a>
</div>
