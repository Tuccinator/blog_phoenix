defmodule BlogPhoenix.PostTest do
  use BlogPhoenix.ModelCase

  alias BlogPhoenix.Post

  @valid_attrs %{body: "some content", created_at: "2010-04-17 14:00:00", deleted_at: "2010-04-17 14:00:00", title: "some content", updated_at: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
