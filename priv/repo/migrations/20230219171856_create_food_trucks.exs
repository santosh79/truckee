defmodule Truckee.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :name, :string
      add :address, :string
      add :type_of_vehicle, :string
      add :food_items, :string
      add :schedule, :string
      add :zip_codes, :string

      timestamps()
    end
  end
end
