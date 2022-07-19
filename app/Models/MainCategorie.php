<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Support\Facades\Log;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use Spatie\MediaLibrary\Models\Media;
/**
 * Class MainCategorie
 * @package App\Models
 * @version December 22, 2021, 11:17 pm UTC
 *
 */
class MainCategorie extends Model implements HasMedia
{

    public $table = 'main_categories';


    use  HasMediaTrait {
        getFirstMediaUrl as protected getFirstMediaUrlTrait;

    }
    public $fillable = [
        'id',
        'name',
        'offer',
        'description'
        ,'text_color'
        ,'image_color'
        ,'background_color'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'string',
        'description' => 'string',
        'image' => 'string',

        'background_color' => 'string',
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required',
        'description' => 'required'

    ];

    /**
     * New Attributes
     *
     * @var array
     */
    protected $appends = [
        'custom_fields',
        'has_media',
        'has_media2',
        'media2',
        'cuisines'
        
    ];
    /**
     * Add Media to api results
     * @return bool
     */
    public function getHasMediaAttribute()
    {
        return $this->hasMedia('image') ? true : false;
    }
    public function getHasMedia2Attribute()
    {
        return $this->hasMedia('image') ? true : false;
    }
    /**
     * Add Media to api results
     * @return bool
     */
    public function getMedia2Attribute()
    {
        return $this->getFirstMedia('image2') ;
    }


    public function hasMediaa(string $collectionName = 'default'): bool
    {
        return count($this->allMedias($collectionName)) ? true : false;
    }

    public function allMedias($collection = null)
    {

        $medias = Media::where('model_type', '=', 'App\Models\Upload');
        if ($collection) {
           // $medias = $medias->where('collection_name', $collection);
            // select * from `media` where `media`.`model_id` = 1 and
            // `media`.`model_id` is not null and `media`.`model_type` = 'App\Models\MainCategorie
            $medias = $medias->where('model_id','=' ,$this->id);
        }

        $medias = $medias->orderBy('id','desc')->get();
        return $medias;
    }
    public function getFirstMediaa(string $collectionName = 'default', array $filters = []): ?Media
    {
        //  $media = $this->getMedia($collectionName, $filters);
        $media=   $this->allMedias($collectionName);
        ;
        return $media->first();
    }

    /**
     * to generate media url in case of fallback will
     * return the file type icon
     * @param string $conversion
     * @return string url
     */
    public function getFirstMediaUrll($collectionName = 'default',$conversion = '')
    {
        // $this->getFirstMedia()
        $url = $this->getFirstMediaUrlTrait($collectionName);
        $media=   $this->allMedias($collectionName);
        $url=$media[0]->getUrl();
        Log::debug( $media[0]->getUrl());
        $array = explode('.', $url);
        $extension = strtolower(end($array));//$this->getFirstMediaUrlTrait($collectionName,$conversion)
        if (in_array($extension,config('medialibrary.extensions_has_thumb'))) {
            return asset($url);
        }else{
            return asset(config('medialibrary.icons_folder').'/'.$extension.'.png');
        }
    }



    /**
     * to generate media url in case of fallback will
     * return the file type icon
     * @param string $conversion
     * @return string url
     */
    public function getFirstMediaUrl($collectionName = 'default',$conversion = '')
    {
        $url = $this->getFirstMediaUrlTrait($collectionName);
        $array = explode('.', $url);
        $extension = strtolower(end($array));
        if (in_array($extension,config('medialibrary.extensions_has_thumb'))) {
            return asset($this->getFirstMediaUrlTrait($collectionName,$conversion));
        }else{

            return asset(config('medialibrary.icons_folder').'/'.$extension.'.png');
        }
    }
    public function getFirstMedias($collectionName = 'default' )
    {
        // $url = $this->getFirstMediaUrlTrait('img');

        $medias = Media::where('model_type', '=', 'App\Models\MainCategorie');
        if ($collectionName) {
            $medias = $medias->where('collection_name', $collectionName);
            // select * from `media` where `media`.`model_id` = 1 and
            // `media`.`model_id` is not null and `media`.`model_type` = 'App\Models\MainCategorie
            $medias = $medias->where('model_id','=' ,$this->id);
        }

        //   $medias = $medias->orderBy('id','desc')->get();
        // $media=   $this->allMedias('img');$media->first()
        return $medias->first() ;

    }

    public function getFirstMediaUrls($collectionName = 'default',$conversion = '')
    {
       // $url = $this->getFirstMediaUrlTrait('img');

        $medias = Media::where('model_type', '=', 'App\Models\MainCategorie');
        if ($collectionName) {
            $medias = $medias->where('collection_name', $collectionName);
            // select * from `media` where `media`.`model_id` = 1 and
            // `media`.`model_id` is not null and `media`.`model_type` = 'App\Models\MainCategorie
            $medias = $medias->where('model_id','=' ,$this->id);
        }

     //   $medias = $medias->orderBy('id','desc')->get();
       // $media=   $this->allMedias('img');$media->first()
        $url=$medias->first()->getUrl();
        $array = explode('.', $url);
        $extension = strtolower(end($array));
        if (in_array($extension,config('medialibrary.extensions_has_thumb'))) {
            return asset($this->getFirstMediaUrlTrait($collectionName,$conversion));
        }else{

            return asset(config('medialibrary.icons_folder').'/'.$extension.'.png');
        }
    }

    /**
     * @param Media|null $media
     * @throws \Spatie\Image\Exceptions\InvalidManipulation
     */
    public function registerMediaConversions(Media $media = null)
    {
        $this->addMediaConversion('thumb')
            ->fit(Manipulations::FIT_CROP, 200, 200)
            ->sharpen(10);

        $this->addMediaConversion('icon')
            ->fit(Manipulations::FIT_CROP, 100, 100)
            ->sharpen(10);
    }
    public function cuisines()

    {
        return $this->belongsToMany(\App\Models\Cuisine::class, 'maincategories_cuisines','maincategories_id','cuisines_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function getCuisinesAttribute()
    {
        return $this->cuisines()->get(['cuisines.id', 'cuisines.name']);
    }
    public function customFieldsValues()
    {
        return $this->morphMany('App\Models\CustomFieldValue', 'customizable');
    }

    public function getCustomFieldsAttribute()
    {
        $hasCustomField = in_array(static::class,setting('custom_field_models',[]));
        if (!$hasCustomField){
            return [];
        }
        $array = $this->customFieldsValues()
            ->join('custom_fields','custom_fields.id','=','custom_field_values.custom_field_id')
            ->where('custom_fields.in_table','=',true)
            ->get()->toArray();

        return convertToAssoc($array,'name');
    }


}
