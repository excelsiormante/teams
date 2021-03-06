@extends('layouts.scaffold')

@section('main')

<h1>Show Company</h1>

<p>{{ link_to_route('companies.index', 'Return to all companies') }}</p>

<div class="label_white"><table class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>Company_name</th>
				<th>Address</th>
				<th>City</th>
				<th>Country</th>
				<th>Phone</th>
		</tr>
	</thead>

	<tbody>
		<tr>
			<td>{{{ $company->company_name }}}</td>
					<td>{{{ $company->address }}}</td>
					<td>{{{ $company->city }}}</td>
					<td>{{{ $company->country }}}</td>
					<td>{{{ $company->phone }}}</td>
                    <td>{{ link_to_route('companies.edit', 'Edit', array($company->id), array('class' => 'btn btn-info')) }}</td>
                    <td>
                        {{ Form::open(array('method' => 'DELETE', 'route' => array('companies.destroy', $company->id))) }}
                            {{ Form::submit('Delete', array('class' => 'btn btn-danger')) }}
                        {{ Form::close() }}
                    </td>
		</tr>
	</tbody>
</table></div>

@stop
