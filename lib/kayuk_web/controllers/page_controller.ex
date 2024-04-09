defmodule KayukWeb.PageController do
  use KayukWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false, count: "{ count: 0 }")
  end
end
