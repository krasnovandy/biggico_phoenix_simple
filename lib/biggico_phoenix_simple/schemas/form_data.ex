defmodule BiggicoPhoenixSimple.Schemas.FormData do
  @moduledoc """
  # Модель формы

  Содежит Данные из формы
  """

  use BiggicoPhoenixSimple.Schema

  alias BiggicoPhoenixSimple.Schemas.FormData

  @required_fields ~w(data)a
  @optional_fields ~w(id inserted_at updated_at)a


  schema "form_datas" do
    field :data, :map

    timestamps()
  end

  def build(params \\ %{}) do
    changeset(%FormData{}, params)
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields ++ @optional_fields)
  end
end
