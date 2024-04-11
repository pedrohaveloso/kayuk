defmodule KayukWeb.PageController do
  use KayukWeb, :controller

  def home(conn, _params) do
    menu = [
      %{name: "Home", icon: "hero-home-solid", href: "/"},
      %{name: "Notifications", icon: "hero-bell-solid", href: "/"},
      %{name: "You", icon: "hero-user-circle-solid", href: "/"},
      %{name: "Chats", icon: "hero-chat-bubble-oval-left-ellipsis-solid", href: "/"},
      %{name: "Boards", icon: "hero-clipboard-document-list-solid", href: "/"},
      %{name: "Settings", icon: "hero-adjustments-horizontal-solid", href: "/"}
    ]

    render(conn, :home, menu: menu)
  end
end
