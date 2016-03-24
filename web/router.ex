defmodule BlogPhoenix.Router do
  use BlogPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BlogPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/user/login", UserController, :login
    post "/user/login", UserController, :login_post

    get "/user/signup", UserController, :signup
    post "/user/signup", UserController, :signup_post

    get "/user/logout", UserController, :logout

    get "/post/new", PostController, :new
    post "/post/new", PostController, :new_post

    get "/post/show/:id", PostController, :show
  end

  scope "/admin", BlogPhoenix do
    pipe_through :browser

    get "/", AdminController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", BlogPhoenix do
  #   pipe_through :api
  # end
end
