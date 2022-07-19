<div class='btn-group btn-group-sm'>
  @can('extraGroupProuducts.show')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.view_details')}}" href="{{ route('extraGroupProuducts.show', $id) }}" class='btn btn-link'>
    <i class="fa fa-eye"></i>
  </a>
  @endcan

  @can('extraGroupProuducts.edit')
  <a data-toggle="tooltip" data-placement="bottom" title="{{trans('lang.extra_group_prouduct_edit')}}" href="{{ route('extraGroupProuducts.edit', $id) }}" class='btn btn-link'>
    <i class="fa fa-edit"></i>
  </a>
  @endcan

  @can('extraGroupProuducts.destroy')
{!! Form::open(['route' => ['extraGroupProuducts.destroy', $id], 'method' => 'delete']) !!}
  {!! Form::button('<i class="fa fa-trash"></i>', [
  'type' => 'submit',
  'class' => 'btn btn-link text-danger',
  'onclick' => "return confirm('Are you sure?')"
  ]) !!}
{!! Form::close() !!}
  @endcan
</div>
