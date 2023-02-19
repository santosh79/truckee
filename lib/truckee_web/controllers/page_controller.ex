defmodule TruckeeWeb.PageController do
  use TruckeeWeb, :controller

  def index(conn, _params) do
    Phoenix.LiveView.Controller.live_render(conn, TruckeeWeb.TruckeeLive, session: %{
      "trucks" => Truckee.get_random_trucks()
    })
  end
end
