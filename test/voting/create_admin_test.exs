defmodule Voting.CreateAdminTest do
  use Voting.DataCase, async: true

  alias Voting.{CreateAdmin, Admin}

  describe "run/1" do
    test "returns a struct when the params are valid" do
      params = %{name: "ari", email: "ari@mail.com", password: "123123"}

      assert {:ok, %Admin{} = admin} = CreateAdmin.run(params)
      assert admin.name == "ari"
      assert admin.email == "ari@mail.com"
      assert admin.password_hash != "123123"
    end

    test "returns error when name is missing" do
      params = %{name: "", email: "ari@mail.com", password: "123123"}

      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when email is missing" do
      params = %{name: "ari", email: "", password: "123123"}

      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{email: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when password is missing" do
      params = %{name: "ari", email: "ari@mail.com", password: ""}

      assert {:error, %Ecto.Changeset{} = changeset} = CreateAdmin.run(params)
      %{password: ["can't be blank"]} = errors_on(changeset)
    end
  end
end
