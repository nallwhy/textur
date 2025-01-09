[
  import_deps: [:ecto, :ecto_sql, :phoenix, :ash],
  subdirectories: ["priv/*/migrations"],
  plugins: [Phoenix.LiveView.HTMLFormatter, Spark.Formatter],
  inputs: ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}", "priv/*/seeds.exs"]
]
