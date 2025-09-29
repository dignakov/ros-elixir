defmodule ROS.MixProject do
  use Mix.Project

  @version "0.2.0"
  @source_url "https://github.com/dignakov/ros-elixir"

  def project do
    [
      app: :ros,
      version: @version,
      elixir: "~> 1.17", # Targeting the latest stable branch is often safer
      elixirc_paths: ["lib"],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "ROS",
      description: "An Actor Model client library for ROS.",
      package: package(),
      source_url: @source_url,
      docs: [
        main: "readme", # A good default for the main docs page
        source_ref: "v#{@version}"
        # Removed the call to the missing extras/0 function
      ]
    ]
  end

  def application do
    [
      # :runtime_tools is often not needed explicitly
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # Runtime dependencies
      {:cowboy, "~> 2.10"},
      {:req, "~> 0.5"},
      {:exmlrpc, "~> 0.4.0"}, # Switched to the more standard exmlrpc library

      # NOTE: The :binary dependency was removed. Use Elixir's native <<>> syntax.

      # Dev/Docs dependencies
      {:ex_doc, "~> 0.31", only: [:dev, :docs], runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["mostly robots"],
      licenses: ["BSD-3-Clause"], # Using SPDX identifier is best practice
      links: %{"GitHub" => @source_url}, # Capitalized "GitHub" key
      files: ~w(lib LICENSE mix.exs README.md .formatter.exs)
    ]
  end

  # No test aliases or coverage tooling; tests effectively disabled for now.
  defp aliases, do: []
end
