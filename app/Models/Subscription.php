<?php

/**
 * Created by John Dave Decano<johndavedecano@gmail.com>.
 * Date: Mon, 16 Apr 2018 18:21:38 +0000.
 */

namespace App\Models;

use Eloquent as Model;
/**
 * Class Subscription
 *
 * @property int $id
 * @property int $user_id
 * @property int $package_id
 * @property int $service_id
 * @property int $cycle_id
 * @property \Carbon\Carbon $expires_at
 * @property \Carbon\Carbon $suspended_at
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 *
 * @package App\Models
 */
class Subscription extends Model
{
    use HasService;

    use HasCycle;
    
    use HasPackage;

    use HasUser;

    protected $casts = [
        'user_id' => 'int',
        'package_id' => 'int',
        'service_id' => 'int',
        'cycle_id' => 'int',
        'interval' => 'int'
    ];

    protected $dates = [
   //     'expires_at',
    //    'suspended_at'
    ];
    public static $rules = [
        'user_id' => 'required',


    ];
    protected $fillable = [
        'user_id',
        'package_id',
        'service_id',
        'cycle_id',
        'expires_at',
        'suspended_at',
        'interval',
        'status'
    ];
    protected $appends = [
        'custom_fields',
        'service',
        'user',


    ];
    public function customFieldsValues()
    {
        return $this->morphMany('App\Models\CustomFieldValue', 'customizable');
    }
    public function service()
    {
        return $this->belongsTo(\App\Models\Package::class,  'package_id','id');
    }
    public function user()
    {
        return  $this->belongsTo(\App\Models\User::class,  'user_id','id');
    }
    public function getServiceAttribute()
    {
        // return $this->main_categories_id;
        return $this->service()->get();
    }
    public function getUserAttribute()
    {
        // return $this->main_categories_id;

        return $this->user()->get( );
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
