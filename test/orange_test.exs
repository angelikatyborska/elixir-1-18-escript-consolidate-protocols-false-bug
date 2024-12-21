defmodule OrangeTest do
  use ExUnit.Case
  doctest Orange

  test "greets the world" do
    assert Orange.hello() == :world
  end
end
