defmodule LiveviewClickWeb.Click do
  use LiveviewClickWeb, :live_view

  def render(assigns) do
    ~H"""
    <.button>Send!</.button>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
