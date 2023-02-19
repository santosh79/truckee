# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Truckee.Repo.insert!(%Truckee.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

if Mix.env() in [:dev, :test] do
  Truckee.Repo.delete_all(Truckee.FoodTruck)
  file_path = Path.join(["priv", "truck_seed_data.csv"])
  NimbleCSV.define(Truckee.Parser, separator: ",", escape: "\"")
  file_path
  |> Path.absname
  |> File.stream!
  |> Truckee.Parser.parse_stream()
  |> Stream.map(fn [_locationid, name, type_of_vehicle ,_cnn, _LocationDescription, address, _blocklot, _block, _lot, _permit, _Status, food_items, _X, _Y, _Latitude, _Longitude, schedule, _dayshours, _NOISent, _Approved, _Received, _PriorPermit, _ExpirationDate, _Location, _Fire, _Police, _Supervisor, zip_codes, _Neighborhoods] ->
    %Truckee.FoodTruck{name: :binary.copy(name),
                            type_of_vehicle: :binary.copy(type_of_vehicle),
                            address: :binary.copy(address),
                            food_items: food_items |> String.split("") |> Enum.take(256) |>
                              Enum.join("") |> :binary.copy,
                            schedule: :binary.copy(schedule),
                            zip_codes: :binary.copy(zip_codes)
                           }
                           |> Truckee.Repo.insert!
  end)
  |> Stream.run()
end
