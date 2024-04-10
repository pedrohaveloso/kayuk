defmodule Kayuk.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Kayuk.Account` context.
  """

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: unique_user_email(),
        name: "some name",
        password: "some password"
      })
      |> Kayuk.Account.create_user()

    user
  end

  @doc """
  Generate a session.
  """
  def session_fixture(attrs \\ %{}) do
    {:ok, session} =
      attrs
      |> Enum.into(%{
        active?: true,
        ip: "some ip"
      })
      |> Kayuk.Account.create_session()

    session
  end
end
