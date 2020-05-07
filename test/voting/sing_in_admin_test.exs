defmodule Voting.SingInAdminTest do
  use Voting.DataCase, async: true

  import Voting.Factory

  alias Voting.{Admin, SingInAdmin}

  describe "run/2" do
    setup do
      insert(:admin)
      :ok
    end

    test "returns ok when email and password matche" do
      assert {:ok, %Admin{}} = SingInAdmin.run("email@example.com", "123123")
    end

    test "returns errors when there is no admin with this email" do
      assert {:error, :email_or_password_invalid} = SingInAdmin.run("foo@example.com", "123123")
    end

    test "returs error when the password is invalid" do
      assert {:error, :email_or_password_invalid} = SingInAdmin.run("email@example.com", "abc123")
    end
  end
end
