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
    menu = %{
      home: %{name: "Home", icon: "hero-home-solid", href: "/home"},
      notifications: %{name: "Notifications", icon: "hero-bell-solid", href: "/"},
      you: %{name: "You", icon: "hero-user-circle-solid", href: "/"},
      chats: %{name: "Chats", icon: "hero-chat-bubble-oval-left-ellipsis-solid", href: "/"},
      boards: %{name: "Boards", icon: "hero-clipboard-document-list-solid", href: "/"},
      settings: %{name: "Settings", icon: "hero-adjustments-horizontal-solid", href: "/"}
    }

    assigns = assign(assigns, menu: menu)

    ~H"""
    <aside
      x-data="{ extend: false }"
      x-bind:class="extend ? 'w-60' : 'w-20'"
      class="h-screen sticky top-0 bottom-0 start-0 p-2 transition-all duration-500"
    >
      <nav class={[
        "flex h-full justify-center bg-gray-100 rounded-3xl",
        "p-2 overflow-scroll no-scrollbar"
      ]}>
        <ol class="flex flex-col gap-2 items-center justify-center w-full h-full rounded-3xl">
          <li class="w-full">
            <button
              @click="extend = !extend"
              title="Menu"
              class={[
                "min-h-12 min-w-12 w-min hover:bg-gray-200 transition-all",
                "duration-500 rounded-full flex items-center justify-center"
              ]}
              type="button"
            >
              <.icon class="h-8 w-8 text-gray-700" name="hero-bars-3" />
            </button>
          </li>

          <li class="grid place-items-center justify-center h-full">
            <ul class="flex flex-col gap-2">
              <.aside_menu_option option={@menu.home} />
              <.aside_menu_option option={@menu.notifications} />
              <.aside_menu_option option={@menu.chats} />
              <.aside_menu_option option={@menu.boards} />
            </ul>
          </li>

          <.aside_menu_option option={@menu.settings} />
        </ol>
      </nav>
    </aside>
    """
  end

  attr :option, :map

  def aside_menu_option(assigns) do
    ~H"""
    <li>
      <a
        x-bind:class="extend ? 'w-52 ps-2' : 'w-12'"
        title={@option.name}
        href={@option.href}
        class={[
          "min-h-12 min-w-12 bg-gray-200 hover:bg-gray-300 transition-all",
          "duration-500 rounded-full flex items-center"
        ]}
      >
        <div class="text-center p-2">
          <.icon class="h-8 w-8 text-gray-700" name={@option.icon} />
        </div>

        <div>
          <p x-show="extend" x-transition:enter.duration.1000ms x-transition:leave.duration.100ms>
            <%= @option.name %>
          </p>
        </div>
      </a>
    </li>
    """
  end

  def input(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
    assigns
    |> input()
  end

  def input(%{type: "text"} = assigns) do
    ~H"""
    <input type="text" name={@field.name} id={@field.id} value={@field.value} class="..." />
    """
  end

  def error(assigns) do
    ~H"""
    <p class="mt-3 flex gap-3 text-sm leading-6 text-rose-600 phx-no-feedback:hidden">
      <.icon name="hero-exclamation-circle-mini" class="mt-0.5 h-5 w-5 flex-none" />
      <%= render_slot(@inner_block) %>
    </p>
    """
  end
end
