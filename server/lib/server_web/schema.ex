defmodule ServerWeb.Schema do
  use Absinthe.Schema
 alias ServerWeb.Resolvers
 alias ServerWeb.Schema.Middleware

 import_types __MODULE__.PostsTypes
 import_types __MODULE__.AccountsTypes

 query do
  field :photos, list_of(:photo) do
    middleware Middleware.Authorize
    resolve &Resolvers.Posts.photos/3
  end

  @desc "Get a single photo from his id"
  field :photo , :photo do
    arg :id , non_null(:id)
    resolve &Resolvers.Posts.photo/3
  end



end

mutation do
  @desc "Login as a user"
  field :login, :user_session do
    arg :token, :string
    arg :provider, type: :provider
    resolve &Resolvers.Accounts.login/3
  end

  @desc "Like or Unlike a photo"
  field :like_photo, :boolean do
    arg :photo_id, non_null(:id)
    middleware Middleware.Authorize
    resolve &Resolvers.Reactions.like_photo/3
  end
end
end
