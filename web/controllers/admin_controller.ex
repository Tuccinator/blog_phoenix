defmodule BlogPhoenix.AdminController do
	use BlogPhoenix.Web, :controller

	def index(conn, _params) do
		render conn, "index.html"
	end
end