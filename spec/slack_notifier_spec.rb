require "spec_helper"
require "capistrano/slackbot/slack_notifier"

describe SlackNotifier do
  before(:each) do
    stub_request(:post, /slack.com/)
  end

  describe "#notify" do
    subject {
      SlackNotifier.new(
        team: "some-team",
        token: "secret_token",
        options: { custom_option: "hello there" }
      )
    }

    it "posts to slack's webhook with right params" do
      subject.notify("Oh Hai!")

      expect(WebMock).to have_requested(:post,
        "https://some-team.slack.com/services/hooks/slackbot?token=secret_token"
      ).with( body: { text: "Oh Hai!", custom_option: "hello there" }.to_json )
    end
  end
end
