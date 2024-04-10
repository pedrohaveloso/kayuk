defmodule KayukWeb.PageController do
  use KayukWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
