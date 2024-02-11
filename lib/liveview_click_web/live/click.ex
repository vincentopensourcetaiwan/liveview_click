defmodule LiveviewClickWeb.Click do
  use LiveviewClickWeb, :live_view

  def render(assigns) do
    ~H"""
    <.button><%= @counter %></.button>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, counter: 0)
    {:ok, socket}
  end
end
