defmodule MdkaEx.MixProject do
  use Mix.Project

  @version "0.1.0"
  def(project) do
    [
      app: :mdka_ex,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description()
    ]
  end

  defp description() do
    "mdka is a html to markdown converter using mdka-rs crate"
  end

  defp package() do
    [
      # These are the default files included in the package
      files: [
        "lib",
        "mix.exs",
        "native/mdka_native/.cargo",
        "native/mdka_native/src",
        "native/mdka_native/Cargo*",
        "checksum-*.exs",
        "README*"
      ],
      licenses: ["Apache-2.0"],
      links: %{
        "github" => "https://github.com/dkuku/mdka_ex"
      }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: []
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.33.0", runtime: false, optional: true},
      {:rustler_precompiled, "~> 0.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.33", only: :dev, runtime: false}
    ]
  end
end
