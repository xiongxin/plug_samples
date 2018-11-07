defmodule PlugSamplesTest do
  use ExUnit.Case
  doctest PlugSamples

  test "greets the world" do
    assert PlugSamples.hello() == :world
  end
end
