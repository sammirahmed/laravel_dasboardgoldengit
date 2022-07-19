<div class='btn-group btn-group-sm'>
  @can('pharmcies.show')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.view_details')}}" href="{{ route('pharmcies.show', $id) }}" class='btn btn-link'>
    <i class="fa fa-eye"></i>
  </a>
  @endcan

  @can('pharmcies.edit')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.pharmcy_edit')}}" href="{{ route('pharmcies.edit', $id) }}" class='btn btn-link'>
    <i class="fa fa-edit"></i>
  </a>
  @endcan

  @can('pharmcies.destroy')
{!! Form::open(['route' => ['pharmcies.destroy', $id], 'method' => 'delete']) !!}
  {!! Form::button('<i class="fa fa-trash"></i>', [
  'type' => 'submit',
  'class' => 'btn btn-link text-danger',
  'onclick' => "return confirm('Are you sure?')"
  ]) !!}
{!! Form::close() !!}
  @endcan
</div>
