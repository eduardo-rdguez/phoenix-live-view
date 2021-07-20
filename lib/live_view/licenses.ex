defmodule LiveView.Licenses do
  def calculate(seats) do
    case seats do
      seats when seats <= 5 -> seats * 20.0
      _ -> 100 + (seats - 5) * 15.0
    end
  end
end
