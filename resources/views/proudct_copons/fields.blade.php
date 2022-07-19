@if($customFields)
  <h5 class="col-12 pb-4">{!! trans('lang.main_fields') !!}</h5>
@endif
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">
  <!-- Name Field -->
  <div class="form-group row ">
    {!! Form::label('name', trans("اسم الكوبون"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('name', null,  ['class' => 'form-control','placeholder'=>  trans("اسم الكوبون")]) !!}
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
      @if(isset($proudctCopon) && $proudctCopon->hasMedia('image'))

          var15671147171873255749ble = {
          name: "{!! $proudctCopon->getFirstMedia('image')->name !!}",
          size: "{!! $proudctCopon->getFirstMedia('image')->size !!}",
          type: "{!! $proudctCopon->getFirstMedia('image')->mime_type !!}",
          collection_name: "{!! $proudctCopon->getFirstMedia('image')->collection_name !!}"
      };
              @endif
      var dz_var15671147171873255749ble = $(".dropzone.image").dropzone({
              url: "{!!url('uploads/store')!!}",
              addRemoveLinks: true,
              //  uploadMultiple:true,
              init: function () {
                @if(isset($proudctCopon) && $proudctCopon->hasMedia('image'))
                        @foreach ($proudctCopon->allMedias('image') as $element)
                    var15671147171873255749ble = {
                    name: "{!! $element->name !!}",
                    size: "{!! $element->size !!}",
                    type: "{!! $element->mime_type !!}",
                    upload: {uuid:"{!! $element->custom_properties['uuid'] !!}"},
                    collection_name: "{!! $element->collection_name !!}",

                };
                  dzInitz(this, var15671147171873255749ble, '{!! url($proudctCopon->getMediaUrl($element,'image','thumb')) !!}')
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
                      file, var15671147171873255749ble, '{!! url("pruductcopon/remove-media") !!}',
                      'image', '{!! isset($proudctCopon) ? $proudctCopon->id : 0 !!}',file.upload.uuid, '{!! url("uplaods/clear") !!}', '{!! csrf_token() !!}'
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
    {!! Form::label('price', trans("سعر القديم"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::number('price', null,  ['class' => 'form-control','placeholder'=>  trans("lang.food_price_placeholder"),'step'=>"any", 'min'=>"0"]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.food_price_help") }}
      </div>
    </div>
  </div>
    <!-- Category Id Field -->
    <div class="form-group row ">
        {!! Form::label('discount_type', trans("نوع الخصم"),['class' => 'col-3 control-label text-right']) !!}
        <div class="col-9">
            {!! Form::select('discount_type', $category, null, ['class' => 'select2 form-control']) !!}
            <div class="form-text text-muted">{{ trans("نوع الخصم") }}</div>
        </div>
    </div>
  <!-- Discount Price Field -->
  <div class="form-group row ">
    {!! Form::label('discount_price', trans("قيمة الخصم او السعر الجديد"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::number('discount_price', null,  ['class' => 'form-control','placeholder'=>  trans("lang.food_discount_price_placeholder"),'step'=>"any", 'min'=>"0"]) !!}
      <div class="form-text text-muted">
        {{ trans("قيمة الخصم") }}
      </div>
    </div>
  </div>
    <div class="form-group row">
         {!! Form::label('discount_price', trans("Code"), ['class' => 'col-3 control-label text-right']) !!}
        <div class="col-9">
            {!! Form::text('code', \Illuminate\Support\Str::random(10),  ['class' => 'form-control','placeholder'=>  trans("اسم الكوبون"),'value' => \Illuminate\Support\Str::random(10)])  !!}
            <div class="form-text text-muted">
                {{ trans("lang.food_name_help") }}
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


</div>
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">

    <!-- Category Id Field -->
    <div class="form-group row ">
        {!! Form::label('category_id', trans("lang.food_category_id"),['class' => 'col-3 control-label text-right']) !!}
        <div class="col-9">
            {!! Form::select('category_id', $categoryy, null, ['class' => 'select2 form-control']) !!}
            <div class="form-text text-muted">{{ trans("lang.food_category_id_help") }}</div>
        </div>
    </div>
  <!-- Ingredients Field -->
  <div class="form-group row ">
    {!! Form::label('ingredients', trans("تعليمات"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::textarea('rules', null, ['class' => 'form-control','placeholder'=>
       trans("lang.food_ingredients_placeholder")  ]) !!}
      <div class="form-text text-muted">{{ trans("تعليمات الاستخدام للكوبون") }}</div>
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
    <div style="padding: 0 4px;"  class="form-group row ">
        <div style="flex: 33%;" class="form-group column">

            <!-- 'Boolean Featured Field' -->
            <div class="form-group row ">
                {!! Form::label('showprice', trans("اظهار السعر الجديد"),['class' => 'col-9 control-label text-right']) !!}
                <div class="checkbox icheck">
                    <label class="col-9 ml-2 form-check-inline">
                        {!! Form::hidden('showprice', 0) !!}
                        {!! Form::checkbox('showprice', 1, null) !!}
                    </label>
                </div>
            </div>

            <!-- 'Boolean Featured Field' -->
            <div class="form-group row ">
                {!! Form::label('showpercent', trans("اظهار نسبة الخصم"),['class' => 'col-9 control-label text-right']) !!}
                <div class="checkbox icheck">
                    <label class="col-9 ml-2 form-check-inline">
                        {!! Form::hidden('showpercent', 0) !!}
                        {!! Form::checkbox('showpercent', 1, null) !!}
                    </label>
                </div>
            </div>
            <!-- 'Boolean deliverable Field' -->
            <div class="form-group row ">
                {!! Form::label('deliverable', trans("اظهار في العروض الاكثر استخدام"),['class' => 'col-9 control-label text-right']) !!}
                <div class="checkbox icheck">
                    <label class="col-9 ml-2 form-check-inline">
                        {!! Form::hidden('offer', 0) !!}
                        {!! Form::checkbox('offer', 1, null) !!}
                    </label>
                </div>
            </div>
            <!-- 'Boolean refundable Field' -->
            <div style="flex: 33%;" class="form-group column">

                <!-- 'Boolean Featured Field' -->
                <div class="form-group row ">
                    {!! Form::label('featured', trans(" عرض مميز "),['class' => 'col-9 control-label text-right']) !!}
                    <div class="checkbox icheck">
                        <label class="col-9 ml-2 form-check-inline">
                            {!! Form::hidden('featured', 0) !!}
                            {!! Form::checkbox('featured', 1, null) !!}
                        </label>
                    </div>
                </div>

                <!-- 'Boolean deliverable Field' -->
                <div class="form-group row ">
                    {!! Form::label('oneplusone', trans("عرض ١+١"),['class' => 'col-9 control-label text-right']) !!}
                    <div class="checkbox icheck">
                        <label class="col-9 ml-2 form-check-inline">
                            {!! Form::hidden('oneplusone', 0) !!}
                            {!! Form::checkbox('oneplusone', 1, null) !!}
                        </label>
                    </div>
                </div>
                <!-- 'Boolean refundable Field' -->
                <div class="form-group row ">
                    {!! Form::label('showoldprice', trans("اظهار السعر القديم"),['class' => 'col-9 control-label text-right']) !!}
                    <div class="checkbox icheck">
                        <label class="col-9 ml-2 form-check-inline">
                            {!! Form::hidden('showoldprice', 0) !!}
                            {!! Form::checkbox('showoldprice', 1, null) !!}
                        </label>
                    </div>
                </div>
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
  <button type="submit" class="btn btn-{{setting('theme_color')}}" ><i class="fa fa-save"></i> {{trans('lang.save')}} {{trans('lang.pruduct')}}</button>
  <a href="{!! route('proudctCopons.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.cancel')}}</a>
</div>
