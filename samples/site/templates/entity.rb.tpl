
class ${entity.descriptor}
<#
    entity.properties.each do | property |
#>
    attr_accesor :${property.name}
<#
    end
#>
end

