# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :real_world,
  ecto_repos: [RealWorld.Repo]

# Configures the endpoint
config :real_world, RealWorldWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QtWF3zdlX9n5U8rW8Z98f0lLEuIa5hs/3gOuMdXQ3rWWLL++blAs+30p6jPm2UG1",
  render_errors: [view: RealWorldWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RealWorld.PubSub,
  live_view: [signing_salt: "3mPrIWu5"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
