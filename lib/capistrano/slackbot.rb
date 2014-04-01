require "capistrano/slackbot/version"
require "capistrano/slackbot/slack_notifier"

load File.expand_path('../tasks/slack.rake', __FILE__)
