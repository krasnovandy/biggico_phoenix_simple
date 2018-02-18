defmodule BiggicoPhoenixSimple.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      use Timex.Ecto.Timestamps
      import Ecto.Changeset
      import Ecto.Query
      import Ecto, only: [assoc: 2, assoc_loaded?: 1, build_assoc: 2]

      alias Ecto.{Changeset, Query, Multi}

      defp put_if_new_assoc(changeset, assoc_name, assoc) do
        if get_field(changeset, :"#{assoc_name}_id") do
          changeset
        else
          changeset
          |> put_assoc(assoc_name, assoc)
        end
      end
    end
  end
end