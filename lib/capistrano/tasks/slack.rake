namespace :slack do
  task :finished do
    SlackNotifier.new(
      team: fetch(:slack_team),
      token: fetch(:slack_token),
      options: fetch(:slack_options, {})
    ).notify(revision_log_message)
  end
end

namespace :deploy do
  after :finishing, "slack:finished"
end
