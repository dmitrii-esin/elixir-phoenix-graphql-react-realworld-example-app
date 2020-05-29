defmodule RealWorldWeb.Router do
  use RealWorldWeb, :router

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

  scope "/", RealWorldWeb do
    pipe_through :browser

    get "/", PageController, :index
    # TODO: Our react app will only be served on /route. 
    # Since Phoenix got a /not-found-route, it tried to match the route based on the router.ex file. 
    # If we have created a page not found component on react and we want that to be served instead of phoenix not found route, 
    # we must tell phoenix that whenever it doesn’t find a the appropriate route, 
    # we must redirect it on the routes on the client side.
    # https://medium.com/@ken11zer01/create-react-app-and-elixir-phoenix-227678660257
    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", RealWorldWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: RealWorldWeb.Telemetry
    end
  end
end
