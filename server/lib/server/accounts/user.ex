defmodule Server.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :avatar, :string
    field :email, :string
    field :facebook_id, :string
    field :first_name, :string
    field :last_name, :string
    field :username, :string

    has_many :like_photo, Server.Reaction.LikePhoto

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :avatar, :facebook_id, :email, :first_name, :last_name])
    |> validate_required([:username, :avatar, :facebook_id, :email, :first_name, :last_name])
    |> unique_constraint(:username)
    |> unique_constraint(:facebook_id)
    |> unique_constraint(:email)
  end
end
