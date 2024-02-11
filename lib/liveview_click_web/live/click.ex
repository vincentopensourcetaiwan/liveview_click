defmodule LiveviewClickWeb.Click do
  use LiveviewClickWeb, :live_view

  def render(assigns) do
    ~H"""
    <.button phx-click="click"><%= @counter %></.button>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, counter: 0)
    {:ok, socket}
  end

  def handle_event("click", _value, socket) do
    socket = assign(socket, counter: socket.assigns.counter + 1)
    {:noreply, socket}
  end
end
