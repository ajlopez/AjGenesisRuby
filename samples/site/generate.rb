filedir = File.expand_path(File.dirname(__FILE__))
libdir = File.join(filedir, '..', '..', 'lib')
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require('ajgenesis')
require('FileUtils')

if not Dir.exists?("build")
  Dir.mkdir("build")
end

FileUtils.cp_r("source/public", "build")
FileUtils.cp_r("source/views", "build")

def filename(name)
  return File.expand_path(name, File.dirname(__FILE__))
end

model = AjGenesis::DynamicObject.make_from_file(filename('model.json'))

AjGenesis::transform_file(filename('templates/app.rb.tpl'), filename('build/app.rb'), model)
AjGenesis::transform_file(filename('templates/views/layout.erb.tpl'), filename('build/views/layout.erb'), model)

model.entities.each do | entity |
  AjGenesis::transform_file(filename('templates/entity.rb.tpl'), filename('build/' + entity.name + '.rb'), { :entity => entity })
  AjGenesis::transform_file(filename('templates/views/list.erb.tpl'), filename('build/views/' + entity.name + 'list.erb'), { :entity => entity })
end



