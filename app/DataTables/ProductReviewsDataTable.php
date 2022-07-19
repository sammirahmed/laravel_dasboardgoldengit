<?php

namespace App\DataTables;

use App\Models\ProductReviews;
use App\Models\CustomField;
use Yajra\DataTables\Services\DataTable;
use Yajra\DataTables\EloquentDataTable;
use Barryvdh\DomPDF\Facade as PDF;

class ProductReviewsDataTable extends DataTable
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
            ->editColumn('image', function ($extra) {
                return getMediaColumn($extra->food, 'image');
            })

            ->editColumn('updated_at', function ($food_review) {
                return getDateColumn($food_review, 'updated_at');
            })
            
            ->addColumn('action', 'product_reviews.datatables_actions')
            ->rawColumns(array_merge($columns, ['action']));

        return $dataTable;
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Models\Post $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(ProductReviews $model)
    {
        return $model->newQuery()->with("user")->with("food");
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
                'data' => 'review',
                'title' => trans('lang.food_review_review'),

            ],
            [
                'data' => 'rate',
                'title' => trans('lang.food_review_rate'),

            ],
            [
                'data' => 'user.name',
                'title' => trans('lang.food_review_user_id'),

            ],
            [
                'data' => 'image',
                'title' =>  '',
                'searchable' => false, 'orderable' => false, 'exportable' => false, 'printable' => true,
            ],
            [
                'data' => 'food.name',
                'title' => trans('lang.food_review_food_id'),

            ],
            [
                'data' => 'updated_at',
                'title' => trans('lang.food_review_updated_at'),
                'searchable' => false,
            ]
        ];

        $hasCustomField = in_array(ProductReviews::class, setting('custom_field_models',[]));
        if ($hasCustomField) {
            $customFieldsCollection = CustomField::where('custom_field_model', ProductReviews::class)->where('in_table', '=', true)->get();
            foreach ($customFieldsCollection as $key => $field) {
                array_splice($columns, $field->order - 1, 0, [[
                    'data' => 'custom_fields.' . $field->name . '.view',
                    'title' => trans('lang.product_reviews_' . $field->name),
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
        return 'product_reviewsdatatable_' . time();
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