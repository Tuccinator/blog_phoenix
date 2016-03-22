defmodule BlogPhoenix.UserController do
	use BlogPhoenix.Web, :controller

	alias BlogPhoenix.User

	def login(conn, _params) do
		changeset = User.changeset(%User{})
		render conn, "login.html", changeset: changeset
	end

	def login_post(conn, %{"user" => user_params}) do
		changeset = User.changeset(%User{}, user_params)
		try do
			Repo.get!(User, user_params)
		rescue
			Ecto.NoResultsError ->
				render conn, "login.html", changeset: changeset
		end

		conn
		|> put_flash(:info, "You have logged in.")
		|> redirect(to: page_path(conn, :index))
	end

	def signup(conn, _params) do
		changeset = User.changeset(%User{})	
		render conn, "signup.html", changeset: changeset
	end

	def signup_post(conn, %{"user" => user_params}) do
		changeset = User.changeset(%User{}, user_params)

		case Repo.insert(changeset) do
			{:ok, _user} ->
				conn
				|> put_flash(:info, "You have successfully signed up.")
				|> redirect(to: page_path(conn, :index))

			{:error, changeset} ->
				render conn, "signup.html", changeset: changeset
		end
	end
end