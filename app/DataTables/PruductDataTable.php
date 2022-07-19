<?php

namespace App\DataTables;

use App\Models\Pruduct;
use App\Models\CustomField;
use Yajra\DataTables\Services\DataTable;
use Yajra\DataTables\EloquentDataTable;
use Barryvdh\DomPDF\Facade as PDF;

class PruductDataTable extends DataTable
{
    /**
     * custom fields columns
     * @var array
     */
    public static $customFields = [];
    /**
     * Build DataTable class.
     *
     * @param mixed $query Results from query() method.
     * @return \Yajra\DataTables\DataTableAbstract
     */
    public function dataTable($query)
    {
        $dataTable = new EloquentDataTable($query);
        $columns = array_column($this->getColumns(), 'data');
        $dataTable = $dataTable
            ->editColumn('image', function ($food) {
                return getMediaColumn($food, 'image');
            })
            ->editColumn('price', function ($food) {
                return getPriceColumn($food);
            })
            ->editColumn('discount_price', function ($food) {
                return getPriceColumn($food,'discount_price');
            })

            ->editColumn('updated_at', function ($food) {
                return getDateColumn($food, 'updated_at');
            })
            ->editColumn('featured', function ($food) {
                return getBooleanColumn($food, 'featured');
            })
            ->editColumn('offer', function ($food) {
                return getBooleanColumn($food, 'offer');
            })
            ->editColumn('pharmciyes', function ($cuisine) {
                return getLinksColumnByRouteName($cuisine->pharmciyes, 'pharmcies.edit', 'id', 'name');
            })
      /*      ->editColumn('brands', function ($cuisine) {
                // return $cuisine->category;
                return getLinksColumnByRouteName($cuisine->brands, 'brands.edit', 'id', 'name');
            })
            ->editColumn('category', function ($cuisine) {
                // return $cuisine->category;
                return getLinksColumnByRouteName($cuisine->category, 'subCategories.edit', 'id', 'name');
            })
      */
            ->addColumn('action', 'pruducts.datatables_actions')
            ->rawColumns(array_merge($columns, ['action']));

        return $dataTable;
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Models\Post $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Pruduct $model)
    {
        return $model->newQuery()->with("category")->with("brands");
    }

    /**
     * Optional method if you want to use html builder.
     *
     * @return \Yajra\DataTables\Html\Builder
     */
    public function html()
    {
        return $this->builder()
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->addAction(['width' => '80px', 'printable' => false ,'responsivePriority'=>'100'])
            ->parameters(array_merge(
                config('datatables-buttons.parameters'), [
                    'language' => json_decode(
                        file_get_contents(base_path('resources/lang/'.app()->getLocale().'/datatable.json')
                        ),true)
                ]
            ));
    }

    /**
     * Get columns.
     *
     * @return array
     */
    protected function getColumns()
    {
        $columns = [
            [
                'data' => 'image',
                'title' => '',
                'searchable' => false, 'orderable' => false, 'exportable' => false, 'printable' => false,
            ],
            [
                'data' => 'name',
                'title' => trans('lang.food_name'),

            ],

            [
                'data' => 'price',
                'title' => trans('lang.food_price'),

            ],
            [
                'data' => 'category.name',
                'title' => trans('lang.food_category_id'),

            ],
            [
                'data' => 'brands.name',
                'title' => trans('lang.brand'),

            ],
            [
                'data' => 'pharmciyes',
                'title' => trans('lang.supplier'),
                'searchable' => false,

            ],
            [
                'data' => 'offer',
                'title' => trans('lang.offer'),

            ],

            [
                'data' => 'featured',
                'title' => trans('lang.food_featured'),

            ],



            [
                'data' => 'updated_at',
                'title' => trans('lang.food_updated_at'),
                'searchable' => false,
            ]

            ];

        $hasCustomField = in_array(Pruduct::class, setting('custom_field_models',[]));
        if ($hasCustomField) {
            $customFieldsCollection = CustomField::where('custom_field_model', Pruduct::class)->where('in_table', '=', true)->get();
            foreach ($customFieldsCollection as $key => $field) {
                array_splice($columns, $field->order - 1, 0, [[
                    'data' => 'custom_fields.' . $field->name . '.view',
                    'title' => trans('lang.pruduct_' . $field->name),
                    'orderable' => false,
                    'searchable' => false,
                ]]);
            }
        }
        return $columns;
    }

    /**
     * Get filename for export.
     *
     * @return string
     */
    protected function filename()
    {
        return 'pruductsdatatable_' . time();
    }

    /**
     * Export PDF using DOMPDF
     * @return mixed
     */
    public function pdf()
    {
        $data = $this->getDataForPrint();
        $pdf = PDF::loadView($this->printPreview, compact('data'));
        return $pdf->download($this->filename().'.pdf');
    }
}