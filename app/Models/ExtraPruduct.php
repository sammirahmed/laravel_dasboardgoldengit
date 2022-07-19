<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class ExtraPruduct
 * @package App\Models
 * @version December 30, 2021, 4:34 pm UTC
 *
 */
class ExtraPruduct extends Model
{

    public $table = 'extra_pruducts';
    


    public $fillable = [
        'name',
        'description',
        'price',
        'product_id',
        'extra_group_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'name' => 'string',

        'description' => 'string',
        'price' => 'double',
        'product_id' => 'integer',
        'extra_group_id' => 'integer'
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
        
    ];

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
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function product()
    {
        return $this->belongsTo(\App\Models\Pruduct::class, 'product_id', 'id');
    }
    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function extraGroup()
    {
        return $this->belongsTo(\App\Models\ExtraGroupProuduct::class, 'extra_group_id', 'id');
    }
    
}
