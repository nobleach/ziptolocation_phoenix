defmodule ZiplocationPhoenixWeb.LatLngControllerTest do
  use ZiplocationPhoenixWeb.ConnCase

  alias ZiplocationPhoenix.Location
  alias ZiplocationPhoenix.Location.LatLng

  @create_attrs %{lat: 120.5, lng: 120.5, zip: "some zip"}
  @update_attrs %{lat: 456.7, lng: 456.7, zip: "some updated zip"}
  @invalid_attrs %{lat: nil, lng: nil, zip: nil}

  def fixture(:lat_lng) do
    {:ok, lat_lng} = Location.create_lat_lng(@create_attrs)
    lat_lng
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all latlngs", %{conn: conn} do
      conn = get conn, lat_lng_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create lat_lng" do
    test "renders lat_lng when data is valid", %{conn: conn} do
      conn = post conn, lat_lng_path(conn, :create), lat_lng: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, lat_lng_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "lat" => 120.5,
        "lng" => 120.5,
        "zip" => "some zip"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, lat_lng_path(conn, :create), lat_lng: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update lat_lng" do
    setup [:create_lat_lng]

    test "renders lat_lng when data is valid", %{conn: conn, lat_lng: %LatLng{id: id} = lat_lng} do
      conn = put conn, lat_lng_path(conn, :update, lat_lng), lat_lng: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, lat_lng_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "lat" => 456.7,
        "lng" => 456.7,
        "zip" => "some updated zip"}
    end

    test "renders errors when data is invalid", %{conn: conn, lat_lng: lat_lng} do
      conn = put conn, lat_lng_path(conn, :update, lat_lng), lat_lng: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete lat_lng" do
    setup [:create_lat_lng]

    test "deletes chosen lat_lng", %{conn: conn, lat_lng: lat_lng} do
      conn = delete conn, lat_lng_path(conn, :delete, lat_lng)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, lat_lng_path(conn, :show, lat_lng)
      end
    end
  end

  defp create_lat_lng(_) do
    lat_lng = fixture(:lat_lng)
    {:ok, lat_lng: lat_lng}
  end
end
