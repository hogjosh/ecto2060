use Mix.Config

config :ecto2060, Ecto2060.Repo,
  adapter: Ecto.Adapters.MySQL,
  hostname: "localhost",
  username: "root",
  password: "",
  database: "",
  pool_size: 10
