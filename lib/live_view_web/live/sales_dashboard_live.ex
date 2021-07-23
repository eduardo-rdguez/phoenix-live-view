defmodule LiveViewWeb.SalesDashboardLive do
  use LiveViewWeb, :live_view

  alias LiveView.Sales

  def mount(_params, _session, socket) do
    socket = assign(
      socket,
      new_orders: Sales.new_orders(),
      sales_amount: Sales.sales_amount(),
      satisfaction: Sales.satisfaction()
    )
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    """
  end
end
