RACK_ENV  = ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'
RACK_ROOT = File.expand_path(File.dirname(__FILE__) + '/..')

unless $LOAD_PATH.include? "."
  $LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))
end

$stdout.sync = true

require 'bundler'
Bundler.require :default

require 'app'

require 'rack-timeout'
use Rack::Timeout, service_timeout: 15

run PapertrailInsightsWebhook::App.new
