require 'yajl'
require 'active_support'
require 'faraday'

module PapertrailInsightsWebhook
  class App < Sinatra::Base
    get '/' do
      "200\n"
    end

    post '/submit' do
      @insights = NewRelicInsights.new ENV['NEWRELIC_ACCOUNT_ID'], ENV['INSIGHTS_API_KEY']

      payload = HashWithIndifferentAccess.new(Yajl::Parser.parse(params[:payload]))
      payload[:events].each do |event|
        @insights.send_event('PapertrailAlerts', event)
      end

      204
    end
  end
end
