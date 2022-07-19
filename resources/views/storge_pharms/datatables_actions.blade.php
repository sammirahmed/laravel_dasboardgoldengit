<div class='btn-group btn-group-sm'>
  @can('storgePharms.show')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.view_details')}}" href="{{ route('storgePharms.show', $id) }}" class='btn btn-link'>
    <i class="fa fa-eye"></i>
  </a>
  @endcan

  @can('storgePharms.edit')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.storge_pharm_edit')}}" href="{{ route('storgePharms.edit', $id) }}" class='btn btn-link'>
    <i class="fa fa-edit"></i>
  </a>
  @endcan

  @can('storgePharms.destroy')
{!! Form::open(['route' => ['storgePharms.destroy', $id], 'method' => 'delete']) !!}
  {!! Form::button('<i class="fa fa-trash"></i>', [
  'type' => 'submit',
  'class' => 'btn btn-link text-danger',
  'onclick' => "return confirm('Are you sure?')"
  ]) !!}
{!! Form::close() !!}
  @endcan
</div>
