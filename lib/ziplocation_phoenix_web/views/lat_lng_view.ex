defmodule ZiplocationPhoenixWeb.LatLngView do
  use ZiplocationPhoenixWeb, :view
  alias ZiplocationPhoenixWeb.LatLngView

  def render("index.json", %{latlngs: latlngs}) do
    %{data: render_many(latlngs, LatLngView, "lat_lng.json")}
  end

  def render("show.json", %{lat_lng: lat_lng}) do
    %{data: render_one(lat_lng, LatLngView, "lat_lng.json")}
  end

  def render("lat_lng.json", %{lat_lng: lat_lng}) do
    %{zip: lat_lng.zip,
      lat: lat_lng.lat,
      lng: lat_lng.lng}
  end
end
