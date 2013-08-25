
require 'repository'

class ${entity.descriptor}
<#
    entity.properties.each do | property |
#>
    attr_accessor :${property.name}
<#
    end
#>
end


