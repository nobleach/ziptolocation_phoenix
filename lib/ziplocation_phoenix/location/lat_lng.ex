defmodule ZiplocationPhoenix.Location.LatLng do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:zip, :string, autogenerate: false}
  @derive {Phoenix.Param, key: :zip}
  schema "latlng" do
    field :lat, :float
    field :lng, :float
  end

  @doc false
  def changeset(lat_lng, attrs) do
    lat_lng
    |> cast(attrs, [:zip, :lat, :lng])
    |> validate_required([:zip, :lat, :lng])
  end
end
