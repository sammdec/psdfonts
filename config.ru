require 'rubygems'
require 'bundler'
Bundler.require

require 'sprockets'
map '/assets' do
  sprockets = Sprockets::Environment.new
  sprockets.append_path 'assets/css'
  sprockets.append_path 'assets/img'
  run sprockets
end

require 'psd'
require 'json'

require './helpers'

require './psdfonts'
run Psdfonts