unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), 'motion-foursquare/*.rb')).each do |file|
    app.files.unshift(file)
  end

  app.pods do
    pod "AFNetworking", "2.5.4"
  end
end
