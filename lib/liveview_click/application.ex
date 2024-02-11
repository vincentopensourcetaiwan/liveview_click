defmodule LiveviewClick.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LiveviewClickWeb.Telemetry,
      LiveviewClick.Repo,
      {DNSCluster, query: Application.get_env(:liveview_click, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LiveviewClick.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LiveviewClick.Finch},
      # Start a worker by calling: LiveviewClick.Worker.start_link(arg)
      # {LiveviewClick.Worker, arg},
      # Start to serve requests, typically the last entry
      LiveviewClickWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveviewClick.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveviewClickWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
