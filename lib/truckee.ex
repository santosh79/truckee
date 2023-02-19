defmodule Truckee do
  @moduledoc """
  Truckee keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  import Ecto.Query, warn: false
  alias Truckee.Repo
  alias Truckee.FoodTruck

  def get_random_trucks() do
    from(FoodTruck)
    |> limit(10)
    |> order_by(fragment("RANDOM()"))
    |> Repo.all
  end

  def count() do
    from(FoodTruck)
    |> select([:id])
    |> Repo.all
    |> Enum.count
  end
end
