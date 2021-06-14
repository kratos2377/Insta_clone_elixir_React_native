defmodule ServerWeb.Schema do
  use Absinthe.Schema
 alias ServerWeb.Resolvers

 import_types __MODULE__.PostsTypes

 query do
  field :photos, list_of(:photo) do
    resolve &Resolvers.Posts.photos/3
  end

  @desc "Get a single photo from his id"
  field :photo , :photo do
    arg :id , non_null(:id)
    resolve &Resolvers.Posts.photo/3
  end

end
end
