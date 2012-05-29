
require 'ajgenesis/dynamic_object.rb'
require 'ajgenesis/string_writer.rb'
require 'ajgenesis/template.rb'

module AjGenesis
  def self.transform_file(sourcename, targetname, model)
    source = IO.read(sourcename)
    template = Template.new(source)
    result = template.render(model)
    IO.write(targetname, result)
  end
end

class NilClass
	def method_missing(*args)
		if args.length == 1
			return self
		else
			super
		end
	end
end

