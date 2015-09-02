# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "bundler/gem_tasks"
require "bundler/setup"
Bundler.require

$:.unshift("./lib/")
require './lib/motion-foursquare'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motion-foursquare'

  app.env['fixtures_path'] = File.expand_path('../spec/fixtures', __FILE__)

  app.pods do
    pod 'AFNetworkActivityLogger'
  end
end

