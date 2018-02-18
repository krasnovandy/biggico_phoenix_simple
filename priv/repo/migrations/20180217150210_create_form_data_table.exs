defmodule BiggicoPhoenixSimple.Repo.Migrations.CreateFormDataTable do
  use Ecto.Migration

  def change do
    create table(:form_datas) do
      add :data, :map

      timestamps()
    end
  end
end
