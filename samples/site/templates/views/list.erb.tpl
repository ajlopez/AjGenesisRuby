<h1><%= @title %></h1>

<div>
<table class='table-striped table-bordered'>
<thead>
<tr>
<#
    entity.properties.each do | property |
#>
<th>${property.descriptor}</th>
<#
    end
#>
</tr>
</thead>
<tbody>
</tbody>
</table>
</div>
