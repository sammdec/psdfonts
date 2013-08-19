require 'rubygems'
require 'bundler'
Bundler.require

require 'sprockets'
require 'uglifier'

if settings.production?
	Sprockets::Sass.options[:style] = :compressed
end


map '/assets' do
  sprockets = Sprockets::Environment.new
  sprockets.append_path 'assets/css'
  sprockets.append_path 'assets/img'
  sprockets.append_path 'assets/js'
  run sprockets
end

require 'psd'

require './helpers'

require './psdfonts'
run Psdfonts