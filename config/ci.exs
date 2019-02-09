use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :blog_app, BlogAppWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :blog_app, BlogApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("POSTGRES_ENV_USER"),
  password: System.get_env("POSTGRES_ENV_USER"),
  database: "postgres#{System.get_env("TEST_ENV_NUMBER")}",
  hostname: System.get_env("POSTGRES_PORT_5432_TCP_ADDR"),
  port: System.get_env("POSTGRES_PORT_5432_TCP_PORT"),
  pool: Ecto.Adapters.SQL.Sandbox
