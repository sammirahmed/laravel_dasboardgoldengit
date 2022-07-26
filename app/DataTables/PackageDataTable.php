<?php

namespace App\DataTables;

use App\Models\Package;
use App\Models\CustomField;
use Yajra\DataTables\Services\DataTable;
use Yajra\DataTables\EloquentDataTable;
use Barryvdh\DomPDF\Facade as PDF;

class PackageDataTable extends DataTable
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

            ->editColumn('updated_at', function ($slide) {
                return getDateColumn($slide, 'updated_at');
            })
            ->editColumn('status', function ($slide) {
                return getActiveColumn($slide, 'status');
            })


            ->editColumn('maincat', function ($cuisine) {
                // return $cuisine->category;
                return getLinksColumnByRouteName($cuisine->service, 'services.edit', 'id', 'name');
            })
            ->editColumn('maincat2', function ($cuisine) {
                // return $cuisine->category;
                return getLinksColumnByRouteName($cuisine->cycle, 'cycles.edit', 'id', 'name');
            })

            ->addColumn('action', 'packages.datatables_actions')
            ->rawColumns(array_merge($columns, ['action']));

        return $dataTable;
    }

    /**
     * Get query source of dataTable.
     *
     * @param \App\Models\Post $model
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function query(Package $model)
    {
        return $model->newQuery();
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
                'data' => 'name',
                'title' => trans('lang.category_name'),

            ],

            [
                'data' => 'status',
                'title' => trans('الحالة'),

            ],
            [
                'data' => 'maincat',
                'title' => trans('الخدمة'),
                'searchable' => false,

            ]  ,
            [
                'data' => 'maincat2',
                'title' => trans('دورة إعداد الفواتير'),
                'searchable' => false,

            ]  ,


            [
                'data' => 'updated_at',
                'title' => trans('lang.category_updated_at'),
                'searchable' => false,
            ]
            ];

        $hasCustomField = in_array(Package::class, setting('custom_field_models',[]));
        if ($hasCustomField) {
            $customFieldsCollection = CustomField::where('custom_field_model', Package::class)->where('in_table', '=', true)->get();
            foreach ($customFieldsCollection as $key => $field) {
                array_splice($columns, $field->order - 1, 0, [[
                    'data' => 'custom_fields.' . $field->name . '.view',
                    'title' => trans('lang.package_' . $field->name),
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
        return 'packagesdatatable_' . time();
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