defmodule MdkaEx do
  @moduledoc """
  Documentation for `MdkaEx`.
  """
  def from_html(html) do
    MdkaEx.Native.from_html(html)
  end
end

defmodule MdkaEx.Native do
  use Rustler,
    otp_app: :mdka_ex,
    crate: :mdka_native

  def from_html(_arg1), do: :erlang.nif_error(:nif_not_loaded)
end
