defmodule KayukWeb.Lives.Login do
  use KayukWeb, :live_view

  alias Kayuk.Account

  def mount(_params, _session, socket) do
    user =
      to_form(Account.change_user(%Account.User{}))
      |> IO.inspect()

    {:ok, assign(socket, form: user)}
  end

  def handle_event("validate", %{"user" => params}, socket) do
    form =
      %Account.User{}
      |> Account.change_user(params)  
      |> Map.put(:action, :insert)
      |> to_form()

    {:noreply, assign(socket, form: form)}
  end
end
