defmodule ZiplocationPhoenix.LocationTest do
  use ZiplocationPhoenix.DataCase

  alias ZiplocationPhoenix.Location

  describe "latlngs" do
    alias ZiplocationPhoenix.Location.LatLng

    @valid_attrs %{lat: 120.5, lng: 120.5, zip: "some zip"}
    @update_attrs %{lat: 456.7, lng: 456.7, zip: "some updated zip"}
    @invalid_attrs %{lat: nil, lng: nil, zip: nil}

    def lat_lng_fixture(attrs \\ %{}) do
      {:ok, lat_lng} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Location.create_lat_lng()

      lat_lng
    end

    test "list_latlngs/0 returns all latlngs" do
      lat_lng = lat_lng_fixture()
      assert Location.list_latlngs() == [lat_lng]
    end

    test "get_lat_lng!/1 returns the lat_lng with given id" do
      lat_lng = lat_lng_fixture()
      assert Location.get_lat_lng!(lat_lng.id) == lat_lng
    end

    test "create_lat_lng/1 with valid data creates a lat_lng" do
      assert {:ok, %LatLng{} = lat_lng} = Location.create_lat_lng(@valid_attrs)
      assert lat_lng.lat == 120.5
      assert lat_lng.lng == 120.5
      assert lat_lng.zip == "some zip"
    end

    test "create_lat_lng/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_lat_lng(@invalid_attrs)
    end

    test "update_lat_lng/2 with valid data updates the lat_lng" do
      lat_lng = lat_lng_fixture()
      assert {:ok, lat_lng} = Location.update_lat_lng(lat_lng, @update_attrs)
      assert %LatLng{} = lat_lng
      assert lat_lng.lat == 456.7
      assert lat_lng.lng == 456.7
      assert lat_lng.zip == "some updated zip"
    end

    test "update_lat_lng/2 with invalid data returns error changeset" do
      lat_lng = lat_lng_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_lat_lng(lat_lng, @invalid_attrs)
      assert lat_lng == Location.get_lat_lng!(lat_lng.id)
    end

    test "delete_lat_lng/1 deletes the lat_lng" do
      lat_lng = lat_lng_fixture()
      assert {:ok, %LatLng{}} = Location.delete_lat_lng(lat_lng)
      assert_raise Ecto.NoResultsError, fn -> Location.get_lat_lng!(lat_lng.id) end
    end

    test "change_lat_lng/1 returns a lat_lng changeset" do
      lat_lng = lat_lng_fixture()
      assert %Ecto.Changeset{} = Location.change_lat_lng(lat_lng)
    end
  end
end
