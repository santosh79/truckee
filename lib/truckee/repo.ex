defmodule Truckee.Repo do
  use Ecto.Repo,
    otp_app: :truckee,
    adapter: Ecto.Adapters.Postgres
end
