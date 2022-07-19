<?php

/**
 * Created by John Dave Decano<johndavedecano@gmail.com>.
 * Date: Mon, 16 Apr 2018 18:21:38 +0000.
 */

namespace App\Models;

use Eloquent as Model;
/**
 * Class Package
 *
 * @property int $id
 * @property int $service_id
 * @property int $cycle_id
 * @property float $amount
 * @property string $name
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 *
 * @package App\Models
 */
class Package extends Model
{
    use HasService;

    use HasCycle;
    
    use HasSubscriptions;

    protected $casts = [
        'service_id' => 'int',
        'cycle_id' => 'int',
        'amount' => 'float',
    ];

    protected $fillable = [
        'service_id',
        'cycle_id',
        'amount',
        'name',
        'status'
        ,'enter'
    ];
    public static $rules = [
        'name' => 'required',


    ];
    protected $appends = [
        'custom_fields',
        'service',
        'cycle'

    ];
    public function customFieldsValues()
    {
        return $this->morphMany('App\Models\CustomFieldValue', 'customizable');
    }
    public function service()
    {
        return $this->belongsTo(\App\Models\Service::class,  'service_id','id');
    }
    public function getServiceAttribute()
    {
        // return $this->main_categories_id;
        return $this->service()->get( );
    }
    public function cycle()
    {
        return $this->belongsTo(\App\Models\Cycle::class,  'cycle_id','id');
    }
    public function getCycleAttribute()
    {
        // return $this->main_categories_id;
        return $this->cycle()->get( );
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
