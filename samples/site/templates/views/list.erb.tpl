<h1><%= @title %></h1>

<div class="btn-group">
<a class="btn btn-primary" href="/${entity.name}/new">New ${entity.descriptor}</a>
</div>

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
<%
    @${entity.name}_list.each do | ${entity.name} |
%>
<tr>
<#
    entity.properties.each do | property |
#>
<td><%= ${entity.name}.${property.name} %></td>
<#
    end
#>
</tr>
<%
    end
%>
</tbody>
</table>
</div>
