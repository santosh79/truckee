defmodule TruckeeWeb.TruckeeLive do
  use TruckeeWeb, :live_view

  def mount(_params, _session, socket) do
    {
      :ok,
      assign(socket, trucks: Truckee.get_random_trucks())
    }
  end

  def render(assigns) do
    ~H"""
      <h1>Trucks</h1>
      <button phx-click="get_new_random">
        Update
      </button>
      <div class="trucks" style="margin: 50">
        <%= for truck <- @trucks do %>
          <div class="truck" style="border-style: solid">
            <div class="truck_name">
            <%= truck.name %>
            </div>
            <div class="truck_address">
              <%= truck.address %>
            </div>
            <div class="truck_food_items">
              <%= truck.food_items %>
            </div>
            <div class="truck_schedule">
              <%= truck.schedule %>
            </div>
            <div class="truck_type_of_vehicle">
              <%= truck.type_of_vehicle %>
            </div>
            <div class="truck_zip_codes">
              <%= truck.zip_codes %>
            </div>
          </div>
        <% end %>
      </div>
    """
  end

  def handle_event("get_new_random", _, socket) do
    socket = assign(socket, trucks: Truckee.get_random_trucks())
    {:noreply, socket}
  end
end
