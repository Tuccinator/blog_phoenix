defmodule BlogPhoenix.UserController do
	use BlogPhoenix.Web, :controller

	alias BlogPhoenix.User

	def login(conn, _params) do
		changeset = User.changeset(%User{})
		render conn, "login.html", changeset: changeset
	end

	def login_post(conn, %{"user" => user_params}) do
		changeset = User.changeset(%User{}, user_params)
		
		user = Repo.get_by(User, username: Map.get(user_params, "username"))

		if user == nil do
			conn
			|> put_flash(:error, "You have entered an invalid username.")
			|> render("login.html", changeset: changeset)
		end


		cond do
			user.password == Map.get(user_params, "password") ->
				conn
				|> put_session(:authenticated, true)
				|> put_session(:username, user.username)
				|> put_flash(:info, "You have logged in.")
				|> redirect(to: page_path(conn, :index))

			true ->
				conn
				|> put_flash(:error, "The password you have entered is invalid.")
				|> render("login.html", changeset: changeset) 
		end

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

	def logout(conn, _params) do
		conn
		|> clear_session
		|> redirect(to: page_path(conn, :index))
	end
end