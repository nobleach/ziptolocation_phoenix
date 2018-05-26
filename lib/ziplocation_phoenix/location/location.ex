defmodule ZiplocationPhoenix.Location do
  @moduledoc """
  The Location context.
  """

  import Ecto.Query, warn: false
  alias ZiplocationPhoenix.Repo

  alias ZiplocationPhoenix.Location.LatLng

  @doc """
  Returns the list of latlngs.

  ## Examples

      iex> list_latlngs()
      [%LatLng{}, ...]

  """
  def list_latlngs do
    Repo.all(LatLng)
  end

  @doc """
  Gets a single lat_lng.

  Raises `Ecto.NoResultsError` if the Lat lng does not exist.

  ## Examples

      iex> get_lat_lng!(123)
      %LatLng{}

      iex> get_lat_lng!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lat_lng!(id), do: Repo.get!(LatLng, id)

  @doc """
  Creates a lat_lng.

  ## Examples

      iex> create_lat_lng(%{field: value})
      {:ok, %LatLng{}}

      iex> create_lat_lng(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lat_lng(attrs \\ %{}) do
    %LatLng{}
    |> LatLng.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lat_lng.

  ## Examples

      iex> update_lat_lng(lat_lng, %{field: new_value})
      {:ok, %LatLng{}}

      iex> update_lat_lng(lat_lng, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lat_lng(%LatLng{} = lat_lng, attrs) do
    lat_lng
    |> LatLng.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a LatLng.

  ## Examples

      iex> delete_lat_lng(lat_lng)
      {:ok, %LatLng{}}

      iex> delete_lat_lng(lat_lng)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lat_lng(%LatLng{} = lat_lng) do
    Repo.delete(lat_lng)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lat_lng changes.

  ## Examples

      iex> change_lat_lng(lat_lng)
      %Ecto.Changeset{source: %LatLng{}}

  """
  def change_lat_lng(%LatLng{} = lat_lng) do
    LatLng.changeset(lat_lng, %{})
  end
end
