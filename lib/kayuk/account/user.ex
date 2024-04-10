defmodule Kayuk.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :name, :string
    field :password, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :password, :email])
    |> validate_required([:name, :password, :email])
    |> validate_length(:name, 50)
    |> validate_length(:email, 255)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
