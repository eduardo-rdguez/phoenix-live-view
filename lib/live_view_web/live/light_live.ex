defmodule LiveViewWeb.LightLive do
  use LiveViewWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :brightness, 10)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Front Porch Light</h1>
    <div id="light">
      <div class="meter">
        <span style="width: <%= @brightness %>%">
          <%= @brightness %>%
        </span>
      </div>

      <button>
        <img src="images/light-off.svg" alt="light-on">
      </button>

      <button>
        <img src="images/down.svg" alt="light-on">
      </button>

      <button>
        <img src="images/up.svg" alt="light-on">
      </button>

      <button>
        <img src="images/light-on.svg" alt="light-on">
      </button>

    </div>
    """
  end
end
