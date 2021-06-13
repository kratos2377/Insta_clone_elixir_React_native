defmodule ServerWeb.Resolvers.Posts do
  alias Server.Posts

  def photos(_, _, _) do
    {:ok, Posts.list_photos()}
  end
end
