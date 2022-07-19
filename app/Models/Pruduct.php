<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use Spatie\MediaLibrary\Models\Media;
use Closure;
use Illuminate\Database\Eloquent\Collection as DbCollection;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
/**
 * Class Pruduct
 * @package App\Models
 * @version December 24, 2021, 11:32 pm UTC
 *
 */
class Pruduct extends Model implements HasMedia
{
    use  HasMediaTrait {
        getFirstMediaUrl as protected getFirstMediaUrlTrait;

    }
    public $table = 'pruducts';
    


    public $fillable = [
        'id',
        'name',
        'price',
        'discount_price',
        'description',
        'ingredients',
        'weight',
        'package_items_count',
        'unit',
        'featured',
        'deliverable',
        'refunduble',
        'brand_id',
        'showonlow',
        'best',
        'offer',
        'category_id'

    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'string',
        'image' => 'string',
        'price' => 'double',
        'discount_price' => 'double',
        'description' => 'string',
        'ingredients' => 'string',
        'weight' => 'double',
        'package_items_count' => 'integer',
        'unit' => 'string',
        'featured' => 'boolean',
        'deliverable' => 'boolean',
        'showonlow' => 'boolean',
        'best' => 'boolean',
        'refunduble' => 'boolean',
        'brand_id' => 'integer',
        'category_id' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        
    ];

    /**
     * New Attributes
     *
     * @var array
     */
    protected $appends = [

        'custom_fields',
        'pharmciyes',
        'category',
        'has_media',

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

        $medias = Media::where('model_type', '=', 'App\Models\Pruduct');
        if ($collection) {
             $medias = $medias->where('collection_name', $collection);
            // select * from `media` where `media`.`model_id` = 1 and
            // `media`.`model_id` is not null and `media`.`model_type` = 'App\Models\MainCategorie
            $medias = $medias->where('model_id','=' ,$this->id);
        }

        $medias = $medias->orderBy('id','asc')->get();
        return $medias;
    }
    protected function getDefaultFilterFunction(array $filters): Closure
    {
        return function (Media $media) use ($filters) {
            foreach ($filters as $property => $value) {
                if (! Arr::has($media->custom_properties, $property)) {
                    return false;
                }

                if (Arr::get($media->custom_properties, $property) !== $value) {
                    return false;
                }
            }

            return true;
        };
    }
    protected function applyFilterToMediaCollection(Collection $media, $filter): Collection
    {
        if (is_array($filter)) {
            $filter = $this->getDefaultFilterFunction($filter);
        }

        return $media->filter($filter);
    }
    public function getFirstMediabyuuid($collection = null,$uuid)
    {

        $medias = Media::where('model_type', '=', 'App\Models\Pruduct');
        if ($collection) {
            $medias = $medias->where('collection_name', $collection);
            // select * from `media` where `media`.`model_id` = 1 and
            // `media`.`model_id` is not null and `media`.`model_type` = 'App\Models\MainCategorie
            $medias = $medias->where('model_id','=' ,$this->id);
           // $medias = $medias->where('model_id','=' ,$this->id);
            $medias = $this->applyFilterToMediaCollection($medias->get(), ['uuid' => $uuid]);
        }

       // $medias = $medias->orderBy('id','asc')->get();
        return $medias->first;
    }
    public function getFirstMediaa(string $collectionName = 'default', array $filters = []): ?Media
    {
        //  $media = $this->getMedia($collectionName, $filters);
        $media=   $this->allMedias($collectionName);
        ;
       // $media[0]->mim
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
     * to generate media url in case of fallback will
     * return the file type icon
     * @param string $conversion
     * @return string url
     */
    public function getMediaUrl( $media,$collectionName = 'default',$conversion = '')
    {
        $url =$media->getUrl();
        $array = explode('.', $url);
        $extension = strtolower(end($array));
        if (in_array($extension,config('medialibrary.extensions_has_thumb'))) {
            return asset($media->getUrl($conversion));
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

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     **/
    public function pharmciyes()
    {
        return $this->belongsToMany(\App\Models\Pharmcy::class, 'storge_pharms','product_id','pharm_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Collection
     */
    public function getPharmciyesAttribute()
    {
        return $this->pharmciyes()->get(['pharmcies.id', 'pharmcies.name']);
    }


    public function initialstocks()
    {
        //return $this->hasMany(ProductStock::class);
        return   DB::table('storge_pharms')->where('product_id', $this->id)->sum( 'initquantity')->get();
    }
    public function avilablestocks()
    {
        //return $this->hasMany(ProductStock::class);
        DB::table('storge_pharms')->where('product_id', $this->id)->sum( 'quantity')->get();
    }
    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function category()
    {
        return $this->belongsTo(\App\Models\SubCategorie::class,  'category_id','id');
    }
    public function transform()
    {
          $book=$this->category()->first();
        Log::alert($this->getFillable());
          Log::alert($this->description);
        Log::alert($this->name);
        return [
            'id'   => $book->id,
            'name' => $book->name,

            'main'   => [
                [
                    'name' => $book->category()->first()->name,
                    'id' =>  $book->main_categories_id,
                ]
            ],
        ];
    }
    public function getCategoryAttribute()
    {
        return $this->transform() ;
    }
    /** public function getSubcategoryAttribute()
    {
        return $this->category()->get(['sub_categories.id', 'sub_categories.name']);
    }

     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function brands()
    {
        return $this->belongsTo(\App\Models\Brand::class,  'brand_id','id');
    }
    /**
     * @return float
     */
    public function getPrice(): float
    {
        return $this->discount_price > 0 ? $this->discount_price : $this->price;
    }
}
