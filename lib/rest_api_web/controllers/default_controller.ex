defmodule RestApiWeb.DefaultController do
  use RestApiWeb, :controller

  def index(conn, _params) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Rest Api is Live! - #{Mix.env()}")
  end
end
