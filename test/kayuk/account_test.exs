defmodule Kayuk.AccountTest do
  use Kayuk.DataCase

  alias Kayuk.Account

  describe "users" do
    alias Kayuk.Account.User

    import Kayuk.AccountFixtures

    @invalid_attrs %{name: nil, password: nil, email: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name", password: "some password", email: "some email"}

      assert {:ok, %User{} = user} = Account.create_user(valid_attrs)
      assert user.name == "some name"
      assert user.password == "some password"
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name", password: "some updated password", email: "some updated email"}

      assert {:ok, %User{} = user} = Account.update_user(user, update_attrs)
      assert user.name == "some updated name"
      assert user.password == "some updated password"
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end

  describe "sessions" do
    alias Kayuk.Account.Session

    import Kayuk.AccountFixtures

    @invalid_attrs %{ip: nil, active?: nil}

    test "list_sessions/0 returns all sessions" do
      session = session_fixture()
      assert Account.list_sessions() == [session]
    end

    test "get_session!/1 returns the session with given id" do
      session = session_fixture()
      assert Account.get_session!(session.id) == session
    end

    test "create_session/1 with valid data creates a session" do
      valid_attrs = %{ip: "some ip", active?: true}

      assert {:ok, %Session{} = session} = Account.create_session(valid_attrs)
      assert session.ip == "some ip"
      assert session.active? == true
    end

    test "create_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_session(@invalid_attrs)
    end

    test "update_session/2 with valid data updates the session" do
      session = session_fixture()
      update_attrs = %{ip: "some updated ip", active?: false}

      assert {:ok, %Session{} = session} = Account.update_session(session, update_attrs)
      assert session.ip == "some updated ip"
      assert session.active? == false
    end

    test "update_session/2 with invalid data returns error changeset" do
      session = session_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_session(session, @invalid_attrs)
      assert session == Account.get_session!(session.id)
    end

    test "delete_session/1 deletes the session" do
      session = session_fixture()
      assert {:ok, %Session{}} = Account.delete_session(session)
      assert_raise Ecto.NoResultsError, fn -> Account.get_session!(session.id) end
    end

    test "change_session/1 returns a session changeset" do
      session = session_fixture()
      assert %Ecto.Changeset{} = Account.change_session(session)
    end
  end
end
