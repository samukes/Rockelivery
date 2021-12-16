defmodule RockeliveryWeb.WellcomeController do
  use RockeliveryWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("Wellcome!")
  end
end
