namespace :slack do
  desc "Send deployment notification to Slack"
  task :finished do
    run_locally do
      SlackNotifier.new(
        webhook_url: fetch(:slack_webhook_url),
        options: fetch(:slack_options, {})
      ).notify(revision_log_message)
    end
  end
end

namespace :deploy do
  after :finishing, "slack:finished"
end
