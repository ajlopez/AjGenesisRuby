filedir = File.expand_path(File.dirname(__FILE__))
libdir = File.join(filedir, '..', '..', 'lib')
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require('ajgenesis')
require('FileUtils')

if not Dir.exists?("build")
  Dir.mkdir("build")
end

FileUtils.cp_r("source/public", "build")

def filename(name)
  return File.expand_path(name, File.dirname(__FILE__))
end

model = AjGenesis::DynamicObject.make_from_file(filename('model.json'))

puts(model.title)

AjGenesis::transform_file(filename('templates/app.rb.tpl'), filename('build/app.rb'), model)



