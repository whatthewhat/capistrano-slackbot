# Capistrano::Slackbot [![Build Status](https://travis-ci.org/whatthewhat/capistrano-slackbot.svg?branch=master)](https://travis-ci.org/whatthewhat/capistrano-slackbot) [![Gem Version](https://badge.fury.io/rb/capistrano-slackbot.svg)](http://badge.fury.io/rb/capistrano-slackbot)

Slack intergation for Capistrano 3.

![capistrano-slackbot](https://googledrive.com/host/0B03_MIH-1qgoX3A4OWh5djFWUmc/capistrano-slackbot.png)

## Installation

Add this line to your application's Gemfile:
```yaml
gem "capistrano-slackbot"
```

And then execute:
```bash
$ bundle
```

## Usage

Add capistrano/slackbot to your Capfile:
```ruby
# Capfile

require "capistrano/slackbot"
```

Then add some configuation options to your deploy.rb:
```ruby
# deploy.rb

set :slack_webhook_url, ENV["SLACK_WEBHOOK"] # from your "Incoming Webhook" integration
set :slack_options, { channel: "#general", icon_emoji: ":shipit:" } # arbitrary additional options passed to slack
```

And deploy away!

## Contributing

1. Fork it ( https://github.com/[my-github-username]/capistrano-slackbot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
