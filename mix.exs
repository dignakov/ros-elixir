defmodule ROS.MixProject do
  use Mix.Project

  @version "0.2.0"
  @source_url "https://github.com/dignakov/ros-elixir"

  def project do
    [
      app: :ros,
      version: @version,
      elixir: "~> 1.17",
      elixirc_paths: ["lib"],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "ROS",
      description: "An Actor Model client library for ROS.",
      package: package(),
      source_url: @source_url,
      docs: [
        main: "readme",
        source_ref: "v#{@version}",
        extras: ["README.md"] # ensure "readme" exists
      ],
      msg: messages(),
      srv: srvs()
    ]
  end

  def messages do
    [
      # generate all of std_msgs (easy)
      {:pattern, "/"}
      # or just what you need:
      # "std_msgs/String"
    ]
  end

  def srvs do
    [
      {:pattern, "/"}      # all services
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # Runtime
      {:cowboy, "~> 2.14"},
      # If you use Plug, uncomment:
      # {:plug_cowboy, "~> 2.7"},
      {:req, "~> 0.5"},
      {:xmlrpc, "~> 1.4"},
      {:private, "~> 0.1.2"},

      # Dev/Docs
      {:ex_doc, "~> 0.38", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["mostly robots"],
      licenses: ["BSD-3-Clause"],
      links: %{"GitHub" => @source_url},
      files: ~w(lib LICENSE mix.exs README.md .formatter.exs)
    ]
  end

  # No test aliases/coverage: tests disabled for now.
  # defp aliases, do: []
end
