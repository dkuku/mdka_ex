defmodule MdkaExTest do
  use ExUnit.Case
  doctest MdkaEx

  test "greets the world" do
    assert """
           <h1>Title</h1>
           <div>body</div>
           """
           |> MdkaEx.from_html() == """
           # Title

           body

           """
  end
end
