require "spec_helper"
require "capistrano/slackbot/slack_notifier"

describe SlackNotifier do
  before(:each) do
    stub_request(:post, /webhook.example.com/)
  end

  describe "#notify" do
    it "posts to slack's webhook with right params" do
      SlackNotifier.new(
        webhook_url: "https://webhook.example.com/",
        options: { custom_option: "hello there" }
      ).notify("Oh Hai!")

      expect(WebMock).to have_requested(:post, "https://webhook.example.com/")
        .with( body: { text: "Oh Hai!", custom_option: "hello there" }.to_json )
    end

    it "raises ArgumentError if webhook_url is not set" do
      expect {
        SlackNotifier.new
      }.to raise_error(ArgumentError)
    end
  end
end
