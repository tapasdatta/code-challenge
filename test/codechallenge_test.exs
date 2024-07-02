defmodule CodechallengeTest do
  use ExUnit.Case
  doctest Codechallenge

  test "greets the world" do
    assert Codechallenge.hello() == :world
  end
end
