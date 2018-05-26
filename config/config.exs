# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ziplocation_phoenix,
  ecto_repos: [ZiplocationPhoenix.Repo]

# Configures the endpoint
config :ziplocation_phoenix, ZiplocationPhoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wl2UEZ34H3TlBcqCwrvYAMFg5Ho4w8zT77JImTYfuxic1MghFGC5h0zTnMGe51Wf",
  render_errors: [view: ZiplocationPhoenixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ZiplocationPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
