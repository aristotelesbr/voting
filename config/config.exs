# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :voting,
  ecto_repos: [Voting.Repo]

# Configures the endpoint
config :voting, VotingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QKXpJ9qiqukvIKnqRgB1W21bETPPTxq18KpKPEaH50OtBDo7grJTRxLEV/3M4Br/",
  render_errors: [view: VotingWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Voting.PubSub,
  live_view: [signing_salt: "OJK/WvQM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :voting, VotingWeb.Guardian,
  issuer: "voting_web",
  secret_key: "wUPjfsWjxRfazO26OlC7zseqhKSjZV2W9FgPTEQBwaHKUKS1Pjscx2tsOK6n4jKH"

  config :voting, VotingWeb.AuthAccessPipeline,
  module: VotingWeb.Guardian,
  error_handler: VotingWeb.AuthErrorHandler
