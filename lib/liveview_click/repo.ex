defmodule LiveviewClick.Repo do
  use Ecto.Repo,
    otp_app: :liveview_click,
    adapter: Ecto.Adapters.Postgres
end
