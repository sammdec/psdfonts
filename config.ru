require 'rubygems'
require 'bundler'
Bundler.require

require 'psd'
require 'open-uri'
require 'sinatra/assetpack'

require './helpers'

require './psdfonts'
run Psdfonts