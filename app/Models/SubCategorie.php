<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Support\Facades\Log;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use Spatie\MediaLibrary\Models\Media;
/**
 * Class SubCategorie
 * @package App\Models
 * @version December 24, 2021, 3:58 pm UTC
 *
 */
class SubCategorie extends Model implements HasMedia
{

    public $table = 'sub_categories';

    use  HasMediaTrait {
        getFirstMediaUrl as protected getFirstMediaUrlTrait;

    }
    public $fillable = [
        'id',
        'name',
        'description'
        ,
        'main_categories_id'
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

        'category'

    ];
    /**
     * Add Media to api results
     * @return bool
     */
    public function getHasMediaAttribute()
    {
        return $this->hasMedia('image') ? true : false;
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
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function category()
    {
        return $this->belongsTo(\App\Models\MainCategorie::class,  'main_categories_id','id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Collection

    public function getCuisinesAttribute()
    {
        return $this->cuisines()->get(['cuisines.id', 'cuisines.name']);
    }
    /**
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function getCategoryAttribute()
    {
      // return $this->main_categories_id;
    return $this->category()->get(['main_categories.id', 'main_categories.name']);
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
