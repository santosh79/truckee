defmodule TruckeeWeb.TruckeeLiveTest do
  use ExUnit.Case

  describe "Socket state" do
    setup do
      :ok = Ecto.Adapters.SQL.Sandbox.checkout(Truckee.Repo)
      %{socket: %Phoenix.LiveView.Socket{}}
    end

    test "get_random_trucks", %{socket: socket} do
      socket = socket
      |> TruckeeWeb.TruckeeLive.assign_trucks

      assert Enum.count(socket.assigns.trucks) == 10
    end
  end
end
