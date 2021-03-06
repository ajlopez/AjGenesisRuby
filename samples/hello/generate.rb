filedir = File.expand_path(File.dirname(__FILE__))
libdir = File.join(filedir, '..', '..', 'lib')
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require('ajgenesis')

def filename(name)
  return File.expand_path(name, File.dirname(__FILE__))
end

project = AjGenesis::DynamicObject.make_from_file(filename('project.json'))

model = { :project => project }

AjGenesis::transform_file(filename('program.tpl'), filename('program.rb'), model)



