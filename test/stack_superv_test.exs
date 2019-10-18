defmodule StackSupervTest do
  use ExUnit.Case
  doctest StackSuperv

  test "greets the world" do
    assert StackSuperv.hello() == :world
  end
end
