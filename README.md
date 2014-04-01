# Capistrano::Slackbot

Slack intergation for Capistrano 3.

## Installation

Add this line to your application's Gemfile:
```yaml
gem 'capistrano-slackbot', github: 'whatthewhat/capistrano-slackbot'
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

set :slack_team, "your-team"
set :slack_token, ENV["SLACK_TOKEN"] # from your "Incoming Webhook" integration
set :slack_options, { channel: "#general", icon_emoji: ":shipit:" } # arbitrary additional options passed to slack
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/capistrano-slackbot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
