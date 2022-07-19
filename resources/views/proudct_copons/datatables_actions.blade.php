<div class='btn-group btn-group-sm'>
  @can('proudctCopons.show')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.view_details')}}" href="{{ route('proudctCopons.show', $id) }}" class='btn btn-link'>
    <i class="fa fa-eye"></i>
  </a>
  @endcan

  @can('proudctCopons.edit')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.proudct_copon_edit')}}" href="{{ route('proudctCopons.edit', $id) }}" class='btn btn-link'>
    <i class="fa fa-edit"></i>
  </a>
  @endcan

  @can('proudctCopons.destroy')
{!! Form::open(['route' => ['proudctCopons.destroy', $id], 'method' => 'delete']) !!}
  {!! Form::button('<i class="fa fa-trash"></i>', [
  'type' => 'submit',
  'class' => 'btn btn-link text-danger',
  'onclick' => "return confirm('Are you sure?')"
  ]) !!}
{!! Form::close() !!}
  @endcan
</div>
