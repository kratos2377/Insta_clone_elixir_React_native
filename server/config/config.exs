# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :server,
  ecto_repos: [Server.Repo]

# Configures the endpoint
config :server, ServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "db9iQf18kvvtAQomG62X+0cZC3k2hiyct8bLOgSQCFgOS+lqqezXgk1UxAMzF9KH",
  render_errors: [view: ServerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Server.PubSub,
  live_view: [signing_salt: "MtOisdb8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

#Configure Guardian
config :server, ServerWeb.Auth.Guardian,
  issuer: "server",
  verify_issuerr: true,
  secret_key: "g0yJfaU/aifzY94QLQkD/Wizn1mSiAYPQ2M1cGxoGUYVcgGaz5XrgEqNtvWX1+vA"
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
