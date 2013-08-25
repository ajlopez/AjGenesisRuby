<h1><%= @title %></h1>

<div class="btn-group">
<a class="btn btn-info" href="/${entity.name}">${entity.setdescriptor}</a>
</div>

<form method='post' action='/${entity.name}/new'>

<div>
<table class='table-striped table-bordered'>
<tbody>
<#
    entity.properties.each do | property |
        next if property.name == 'id'
#>
<td>${property.descriptor}</td>
<td><input type='text' name='${property.name}'></td>
<#
    end
#>
</tbody>
</table>
</div>
<div class="btn-group">
<input class='btn btn-primary' type='submit' value='Accept'>
</div>
</form>
