# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :biggico_phoenix_simple,
  ecto_repos: [BiggicoPhoenixSimple.Repo]

# Configures the endpoint
config :biggico_phoenix_simple, BiggicoPhoenixSimpleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hRUvFdFOJA1aOp8kwZE00cyVnCMSsevUevBel1IE3FNJ7K/9oYPfZQBR7pQSX0BE",
  render_errors: [view: BiggicoPhoenixSimpleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BiggicoPhoenixSimple.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
