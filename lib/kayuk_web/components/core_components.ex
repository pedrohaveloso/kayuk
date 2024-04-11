defmodule KayukWeb.CoreComponents do
  use Phoenix.Component

  alias Phoenix.LiveView.JS
  import KayukWeb.Gettext

  attr :name, :string, required: true
  attr :class, :string, default: nil

  def icon(%{name: "hero-" <> _} = assigns) do
    ~H"""
    <span class={[@name, @class]} />
    """
  end
end
