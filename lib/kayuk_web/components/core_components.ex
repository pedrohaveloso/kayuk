defmodule KayukWeb.CoreComponents do
  use Phoenix.Component

  attr :name, :string, required: true
  attr :class, :string, default: nil

  def icon(%{name: "hero-" <> _} = assigns) do
    ~H"""
    <span class={[@name, @class]} />
    """
  end

  def aside_menu(assigns) do
    assigns =
      assign(assigns,
        menu: %{
          home: %{name: "Home", icon: "hero-home-solid", href: "/"},
          notifications: %{name: "Notifications", icon: "hero-bell-solid", href: "/"},
          you: %{name: "You", icon: "hero-user-circle-solid", href: "/"},
          chats: %{name: "Chats", icon: "hero-chat-bubble-oval-left-ellipsis-solid", href: "/"},
          boards: %{name: "Boards", icon: "hero-clipboard-document-list-solid", href: "/"},
          settings: %{name: "Settings", icon: "hero-adjustments-horizontal-solid", href: "/"}
        }
      )

    ~H"""
    <aside class="w-full h-min sm:h-full sm:w-min fixed bottom-0 sm:start-0 p-2">
      <nav class="flex h-full transition-all duration-100 justify-center bg-slate-100 rounded-xl">
        <ul class="flex sm:flex-col w-full h-full gap-2 p-2">
          <.aside_menu_option option={@menu.home} class="hidden sm:flex" />

          <li class="h-full w-full hidden sm:flex"></li>

          <.aside_menu_option option={@menu.you} />
          <.aside_menu_option option={@menu.notifications} />
          <.aside_menu_option option={@menu.chats} />
          <.aside_menu_option option={@menu.boards} />

          <li class="h-full w-full"></li>

          <.aside_menu_option option={@menu.settings} />
        </ul>
      </nav>
    </aside>
    """
  end

  attr :option, :map
  attr :rest, :global

  def aside_menu_option(assigns) do
    ~H"""
    <li class={
      "min-h-12 min-w-12 bg-slate-200 hover:bg-slate-300 transition-all duration-500 rounded-lg flex items-center justify-center "
      <> if @rest[:class] != nil, do: @rest[:class], else: ""
    }>
      <a title={@option.name} href={@option.href} class="flex w-full items-center justify-center">
        <.icon class="h-8 w-8 text-slate-700" name={@option.icon} />
      </a>
    </li>
    """
  end
end
