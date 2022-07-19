<div class='btn-group btn-group-sm'>
  @can('extraPruducts.show')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.view_details')}}" href="{{ route('extraPruducts.show', $id) }}" class='btn btn-link'>
    <i class="fa fa-eye"></i>
  </a>
  @endcan

  @can('extraPruducts.edit')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.extra_pruduct_edit')}}" href="{{ route('extraPruducts.edit', $id) }}" class='btn btn-link'>
    <i class="fa fa-edit"></i>
  </a>
  @endcan

  @can('extraPruducts.destroy')
{!! Form::open(['route' => ['extraPruducts.destroy', $id], 'method' => 'delete']) !!}
  {!! Form::button('<i class="fa fa-trash"></i>', [
  'type' => 'submit',
  'class' => 'btn btn-link text-danger',
  'onclick' => "return confirm('Are you sure?')"
  ]) !!}
{!! Form::close() !!}
  @endcan
</div>
