<div class='btn-group btn-group-sm'>
  @can('discounttypes.show')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.view_details')}}" href="{{ route('discounttypes.show', $id) }}" class='btn btn-link'>
    <i class="fa fa-eye"></i>
  </a>
  @endcan

  @can('discounttypes.edit')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.discounttype_edit')}}" href="{{ route('discounttypes.edit', $id) }}" class='btn btn-link'>
    <i class="fa fa-edit"></i>
  </a>
  @endcan

  @can('discounttypes.destroy')
{!! Form::open(['route' => ['discounttypes.destroy', $id], 'method' => 'delete']) !!}
  {!! Form::button('<i class="fa fa-trash"></i>', [
  'type' => 'submit',
  'class' => 'btn btn-link text-danger',
  'onclick' => "return confirm('Are you sure?')"
  ]) !!}
{!! Form::close() !!}
  @endcan
</div>
