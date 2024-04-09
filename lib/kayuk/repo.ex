defmodule Kayuk.Repo do
  use Ecto.Repo,
    otp_app: :kayuk,
    adapter: Ecto.Adapters.Postgres
end
