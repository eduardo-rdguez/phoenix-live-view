defmodule LiveViewWeb.LightLive do
  use LiveViewWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :brightness, 10)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Light Me Up!</h1>
    <div id="light">
      <div class="meter">
        <span style="width: <%= @brightness %>%">
          <%= @brightness %>%
        </span>
      </div>

      <button phx-click="random">
        <img src="images/random.svg" alt="random">
      </button>

      <button phx-click="off">
        <img src="images/light-off.svg" alt="light-off">
      </button>

      <button phx-click="down">
        <img src="images/down.svg" alt="down">
      </button>

      <button phx-click="up">
        <img src="images/up.svg" alt="up">
      </button>

      <button phx-click="on">
        <img src="images/light-on.svg" alt="light-on">
      </button>

    </div>
    """
  end

  def handle_event("random", _, socket) do
    socket = assign(socket, :brightness, Enum.random(1..100))
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    socket = update(socket, :brightness, &(&1 - 10))
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    socket = update(socket, :brightness, &(&1 + 10))
    {:noreply, socket}
  end

  def handle_event("on", _, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end
end
