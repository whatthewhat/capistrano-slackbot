require "json"
require "faraday"

class SlackNotifier
  attr_reader :webhook_url

  def initialize(args = {})
    @webhook_url = args.fetch(:webhook_url) {
      raise ArgumentError, "[capistrano-slackbot] webhook_url not set!"
    }
    @options = args.fetch(:options) { {} }
  end

  def notify(text)
    payload = { text: text }.merge(@options)

    connection.post webhook_url, payload.to_json
  end

  private

  def connection
    Faraday.new do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['Content-Encoding'] = 'UTF-8'
      faraday.adapter Faraday.default_adapter
    end
  end
end
