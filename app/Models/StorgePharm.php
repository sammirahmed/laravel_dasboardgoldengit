<?php

namespace App\Models;

use Eloquent as Model;

/**
 * Class StorgePharm
 * @package App\Models
 * @version December 28, 2021, 1:57 pm UTC
 *
 */
class StorgePharm extends Model
{

    public $table = 'storge_pharms';
    


    public $fillable = [
        'id',
        'quantity',
        'initquantity',
        'pharm_id',
        'product_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'quantity' => 'double',
        'initquantity' => 'double',
        'pharm_id' => 'integer',
        'product_id' => 'integer'
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
    public function pharm()
    {
        return $this->belongsTo(\App\Models\Pharmcy::class, 'pharm_id', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function extraGroup()
    {
        return $this->belongsTo(\App\Models\ExtraGroup::class, 'pharm_id', 'id');
    }
    
}
