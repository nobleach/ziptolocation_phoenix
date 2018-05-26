defmodule ZiplocationPhoenixWeb.LatLngController do
  use ZiplocationPhoenixWeb, :controller

  alias ZiplocationPhoenix.Location
  alias ZiplocationPhoenix.Location.LatLng

  action_fallback ZiplocationPhoenixWeb.FallbackController

  def index(conn, _params) do
    latlngs = Location.list_latlngs()
    render(conn, "index.json", latlngs: latlngs)
  end

  def show(conn, %{"id" => id}) do
    lat_lng = Location.get_lat_lng!(id)
    render(conn, "show.json", lat_lng: lat_lng)
    # if lat_lng do
    # else
    #   conn·
    #   |> put_status(:not_found)
    #   |> render("show.json", lat_lng: lat_lng)
    # end
  end
end
