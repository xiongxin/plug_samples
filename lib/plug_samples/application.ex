defmodule PlugSamples.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: PlugSamples.Worker.start_link(arg)
      # {PlugSamples.Worker, arg},
      Plug.Cowboy.child_spec(scheme: :http, plug: PlugSamples.MyRouter, options: [port: 4001])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PlugSamples.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
