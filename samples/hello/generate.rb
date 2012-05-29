filedir = File.expand_path(File.dirname(__FILE__))
libdir = File.join(filedir, '..', '..', 'lib')
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require('ajgenesis')

def filename(name)
  return File.expand_path(name, File.dirname(__FILE__))
end

project = AjGenesis::DynamicObject.make_from_file(filename('project.yml'))

model = { :project => project }

AjGenesis::transform_file(filename('program.tpl', 'program.rb', model))



