defmodule Server.Posts.Photo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :caption, :string
    field :image_url, :string

    has_many :likes, Server.Reaction.LikePhoto
    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> cast(attrs, [:image_url, :caption])
    |> validate_required([:image_url, :caption])
  end
end
