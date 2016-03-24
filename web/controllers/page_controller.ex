defmodule BlogPhoenix.PageController do
  use BlogPhoenix.Web, :controller

  def index(conn, _params) do
  	posts = Repo.all(BlogPhoenix.Post)
    render conn, "index.html", posts: posts
  end
end
