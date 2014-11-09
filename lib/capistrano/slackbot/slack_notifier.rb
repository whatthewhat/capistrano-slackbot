require "json"
require "faraday"

class SlackNotifier
  def initialize(args = {})
    @team = args.fetch(:team) { raise ArgumentError, "slack team not set!" }
    @token = args.fetch(:token) { raise ArgumentError, "slack token not set!" }
    @options = args.fetch(:options) { {} }
  end

  def notify(text)
    payload = { text: text }.merge(@options)

    connection.post url, payload.to_json
  end

  private
  def url
    "https://#{ @team }.slack.com/services/hooks/slackbot?token=#{ @token }"
  end

  def connection
    Faraday.new do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['Content-Encoding'] = 'UTF-8'
      faraday.adapter Faraday.default_adapter
    end
  end
end
