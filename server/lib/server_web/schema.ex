defmodule ServerWeb.Schema do
  use Absinthe.Schema
 alias ServerWeb.Resolvers

 import_types __MODULE__.PostsTypes

 query do
  field :photos, list_of(:photo) do
    resolve &Resolvers.Posts.photos/3
  end

end
end
