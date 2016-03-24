defmodule BlogPhoenix.Post do
  use BlogPhoenix.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    field :deleted_at, Ecto.DateTime
    belongs_to :user, BlogPhoenix.User

    timestamps
  end

  @required_fields ~w(title body)
  @optional_fields ~w(deleted_at)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:title, min: 5)
    |> validate_length(:title, max: 255)
    |> validate_length(:body, min: 10)
  end
end
