defmodule StackSuperv.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {StackSuperv.Stash, [5, "cat", :dog, 9]},
      {StackSuperv.Server, nil}
    ]

    opts = [strategy: :one_for_one, name: StackSuperv.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
