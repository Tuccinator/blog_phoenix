defmodule BlogPhoenix.PostController do
	use BlogPhoenix.Web, :controller

	alias BlogPhoenix.Post

	def new(conn, _params) do
		changeset = Post.changeset(%Post{})
		render conn, "new.html", changeset: changeset
	end

	def new_post(conn, %{"post" => post_params}) do
		changeset = Post.changeset(%Post{}, post_params)

		case Repo.insert(changeset) do
			{:ok, post} ->
				conn
				|> put_flash(:info, 'Successfully created a post.')
				|> redirect(to: post_path(conn, :show, post.id))

			{:error, changeset} ->
				render conn, "new.html", changeset: changeset
		end
	end

	def show(conn, %{"id" => id}) do
		post = Repo.get!(Post, id)

		render(conn, "show.html", post: post)
	end
end