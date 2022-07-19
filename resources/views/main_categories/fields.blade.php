@if($customFields)
<h5 class="col-12 pb-4">{!! trans('lang.main_fields') !!}</h5>
@endif
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">
  <!-- Name Field -->
  <div class="form-group row ">
    {!! Form::label('name', trans("اسم القسم"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::text('name', null,  ['class' => 'form-control','placeholder'=>  trans("lang.category_name_placeholder")]) !!}
      <div class="form-text text-muted">
        {{ trans("lang.category_name_help") }}
      </div>
    </div>
  </div>
    <div class="form-group row">
        {!! Form::label('background_color', trans("لون خلفية الصورة"), ['class' => 'col-3 control-label text-right']) !!}
        <div class="col-9">
                 {!! Form::text('background_color', null,  ['class' => 'form-control','placeholder'=>  trans("lang.slide_background_color_placeholder"),'autocomplete' => 'off']) !!}


            <div class="form-text text-muted">
                {{ trans("lang.slide_background_color_help") }}
            </div>
        </div>
    </div>
    <!-- Main Color Field -->
    <div class="form-group row">
        {!! Form::label('text_color', trans("لون النص"), ['class' => 'col-3 control-label text-right']) !!}
        <div class="col-9">
            {!! Form::text('text_color', null,  ['class' => 'form-control','placeholder'=>  trans("lang.slide_text_color_placeholder"),'autocomplete' => 'off']) !!}


            <div class="form-text text-muted">
                {{ trans("lang.slide_text_color_help") }}
            </div>
        </div>
    </div>
    <!-- Main Color Field -->
    <div class="form-group row">
        {!! Form::label('image_color', trans("لون تغيير الصورة"), ['class' => 'col-3 control-label text-right']) !!}
        <div class="col-9">
            {!! Form::text('image_color', null,  ['class' => 'form-control','placeholder'=>  trans("Image Color"),'autocomplete' => 'off']) !!}

            <div class="form-text text-muted">
                {{ trans("") }}
            </div>
        </div>
    </div>

    <!-- Description Field -->
  <div class="form-group row ">
    {!! Form::label('description', trans("وصف القسم"), ['class' => 'col-3 control-label text-right']) !!}
    <div class="col-9">
      {!! Form::textarea('description', null, ['class' => 'form-control','placeholder'=>
       trans("lang.category_description_placeholder")  ]) !!}
      <div class="form-text text-muted">{{ trans("lang.category_description_help") }}</div>
    </div>
  </div>
</div>
<div style="flex: 50%;max-width: 50%;padding: 0 4px;" class="column">
    <!-- 'Boolean deliverable Field' -->
    <div class="form-group row ">
        {!! Form::label('deliverable', trans("اظهار في الشاشة الرئيسية"),['class' => 'col-9 control-label text-right']) !!}
        <div class="checkbox icheck">
            <label class="col-9 ml-2 form-check-inline">
                {!! Form::hidden('offer', 0) !!}
                {!! Form::checkbox('offer', 1, null) !!}
            </label>
        </div>
    </div>
  <!-- Image Field -->
    <div class="form-group row">
        {!! Form::label('image', trans("صورة القسم"), ['class' => 'col-3 control-label text-right']) !!}
        <div class="col-9">
            <div style="width: 100%" class="dropzone image" id="image" data-field="image">
                <input type="hidden" name="image">
            </div>
            <a href="#loadMediaModal" data-dropzone="image" data-toggle="modal" data-target="#mediaModal" class="btn btn-outline-{{setting('theme_color','primary')}} btn-sm float-right mt-1">{{ trans('lang.media_select')}}</a>
            <div class="form-text text-muted w-50">
                {{ trans("lang.cuisine_image_help") }}
            </div>
        </div>
    </div>
    <!-- Image Field -->
    <div class="form-group row">
        {!! Form::label('image2', trans("صورة الغلاف للقسم"), ['class' => 'col-3 control-label text-right']) !!}
        <div class="col-9">
            <div style="width: 100%" class="dropzone image2" id="image2" data-field="image2">
                <input type="hidden" name="image2">
            </div>
            <a href="#loadMediaModal" data-dropzone="image2" data-toggle="modal" data-target="#mediaModal" class="btn btn-outline-{{setting('theme_color','primary')}} btn-sm float-right mt-1">{{ trans('lang.media_select')}}</a>
            <div class="form-text text-muted w-50">
                {{ trans("lang.cuisine_image_help") }}
            </div>
        </div>
    </div>

</div>
@prepend('scripts')
<script type="text/javascript">
    var var15866134631720934041ble = '';
    @if(isset($mainCategorie) && $mainCategorie->hasMedia('image'))
        var15866134631720934041ble = {
        name: "{!! $mainCategorie->getFirstMedia('image')->name !!}",
        size: "{!! $mainCategorie->getFirstMedia('image')->size !!}",
        type: "{!! $mainCategorie->getFirstMedia('image')->mime_type !!}",
        collection_name: "{!! $mainCategorie->getFirstMedia('image')->collection_name !!}"};
            @endif
    var dz_var15866134631720934041ble = $(".dropzone.image").dropzone({
            url: "{!!url('uploads/store')!!}",
            addRemoveLinks: true,
            maxFiles: 1,
            init: function () {
                @if(isset($mainCategorie) && $mainCategorie->hasMedia('image'))
                    dzInit(this,var15866134631720934041ble,'{!! url($mainCategorie->getFirstMediaUrl('image','thumb')) !!}')
                @endif
            },
            accept: function(file, done) {
                dzAccept(file,done,this.element,"{!!config('medialibrary.icons_folder')!!}");
            },
            sending: function (file, xhr, formData) {
                dzSending(this,file,formData,'{!! csrf_token() !!}');
            },
            maxfilesexceeded: function (file) {
                dz_var15866134631720934041ble[0].mockFile = '';
                dzMaxfile(this,file);
            },
            complete: function (file) {
                dzComplete(this, file, var15866134631720934041ble, dz_var15866134631720934041ble[0].mockFile);
                dz_var15866134631720934041ble[0].mockFile = file;
            },
            removedfile: function (file) {
                dzRemoveFile(
                    file, var15866134631720934041ble, '{!! url("mainCategorie/remove-media") !!}',
                    'image', '{!! isset($mainCategorie) ? $mainCategorie->id : 0 !!}', '{!! url("uplaods/clear") !!}', '{!! csrf_token() !!}'
                );
            }
        });
    dz_var15866134631720934041ble[0].mockFile = var15866134631720934041ble;
    dropzoneFields['image'] = dz_var15866134631720934041ble;
</script>
<script type="text/javascript">
    var var15866134631720934041ble2 = '';
    @if(isset($mainCategorie) && $mainCategorie->hasMedia('image2'))
        var15866134631720934041ble2 = {
        name: "{!! $mainCategorie->getFirstMedia('image2')->name !!}",
        size: "{!! $mainCategorie->getFirstMedia('image2')->size !!}",
        type: "{!! $mainCategorie->getFirstMedia('image2')->mime_type !!}",
        collection_name: "{!! $mainCategorie->getFirstMedia('image2')->collection_name !!}"};
            @endif
    var dz_var15866134631720934041ble2 = $(".dropzone.image2").dropzone({
            url: "{!!url('uploads/store')!!}",
            addRemoveLinks: true,
            maxFiles: 1,
            init: function () {
                @if(isset($mainCategorie) && $mainCategorie->hasMedia('image2'))
                    dzInit(this,var15866134631720934041ble2,'{!! url($mainCategorie->getFirstMediaUrl('image2','thumb')) !!}')
                @endif
            },
            accept: function(file, done) {
                dzAccept(file,done,this.element,"{!!config('medialibrary.icons_folder')!!}");
            },
            sending: function (file, xhr, formData) {
                dzSending(this,file,formData,'{!! csrf_token() !!}');
            },
            maxfilesexceeded: function (file) {
                dz_var15866134631720934041ble2[0].mockFile = '';
                dzMaxfile(this,file);
            },
            complete: function (file) {
                dzComplete(this, file, var15866134631720934041ble2, dz_var15866134631720934041ble2[0].mockFile);
                dz_var15866134631720934041ble2[0].mockFile = file;
            },
            removedfile: function (file) {
                dzRemoveFile(
                    file, var15866134631720934041ble2, '{!! url("mainCategorie/remove-media") !!}',
                    'image2', '{!! isset($mainCategorie) ? $mainCategorie->id : 0 !!}', '{!! url("uplaods/clear") !!}', '{!! csrf_token() !!}'
                );
            }
        });
    dz_var15866134631720934041ble2[0].mockFile = var15866134631720934041ble2;
    dropzoneFields['image2'] = dz_var15866134631720934041ble2;
</script>

@endprepend
<!-- Restaurants Cuisine -->

@if($customFields)
<div class="clearfix"></div>
<div class="col-12 custom-field-container">
  <h5 class="col-12 pb-4">{!! trans('lang.custom_field_plural') !!}</h5>
  {!! $customFields !!}
</div>
@endif
<!-- Submit Field -->
<div class="form-group col-12 text-right">
  <button type="submit" class="btn btn-{{setting('theme_color')}}" ><i class="fa fa-save"></i> {{trans('lang.save')}} {{trans('lang.main_categorie')}}</button>
  <a href="{!! route('mainCategories.index') !!}" class="btn btn-default"><i class="fa fa-undo"></i> {{trans('lang.cancel')}}</a>
</div>
