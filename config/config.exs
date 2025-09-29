# config/config.exs
import Config

# Console logger format (optional)
config :logger, :console,
  format: "[$level] $message\n"

# Pull in environment-specific config (dev.exs, prod.exs, test.exs)
import_config "#{config_env()}.exs"
