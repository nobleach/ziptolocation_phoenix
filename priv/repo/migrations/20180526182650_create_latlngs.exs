defmodule ZiplocationPhoenix.Repo.Migrations.CreateLatlngs do
  use Ecto.Migration

  def change do
    create table(:latlngs) do
      add :zip, :string
      add :lat, :float
      add :lng, :float

      timestamps()
    end

  end
end
