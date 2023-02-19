defmodule Truckee.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_trucks" do
    field :address, :string
    field :food_items, :string
    field :name, :string
    field :schedule, :string
    field :type_of_vehicle, :string
    field :zip_codes, :string

    timestamps()
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [:name, :address, :type_of_vehicle, :food_items, :schedule, :zip_codes])
    |> validate_required([:name, :address, :type_of_vehicle, :food_items, :schedule, :zip_codes])
  end
end
