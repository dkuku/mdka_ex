defmodule MdkaEx do
  @moduledoc """
  Documentation for `MdkaEx`.
  """
  def from_html(html) do
    MdkaEx.Native.from_html(html)
  end
end

defmodule MdkaEx.Native do
  version = Mix.Project.config()[:version]

  unsupported = [
    "aarch64-unknown-linux-musl",
    "x86_64-unknown-linux-musl",
    "x86_64-unknown-freebsd"
  ]

  use RustlerPrecompiled,
    otp_app: :mdka_ex,
    crate: :mdka_native,
    version: version,
    base_url: "https://github.com/dkuku/mdka_ex/releases/download/v#{version}",
    force_build: System.get_env("MDKAEX_TEST") in ["1", "true"],
    targets: Enum.uniq(RustlerPrecompiled.Config.default_targets() -- unsupported)

  def from_html(_arg1), do: :erlang.nif_error(:nif_not_loaded)
end
