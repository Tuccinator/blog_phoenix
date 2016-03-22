defmodule BlogPhoenix.User do
  use BlogPhoenix.Web, :model

  schema "users" do
    field :username, :string
    field :password, :string

    timestamps
  end

  @required_fields ~w(username password)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:username, min: 5)
    |> validate_length(:username, max: 32)
    |> unique_constraint(:username)
  end
end
