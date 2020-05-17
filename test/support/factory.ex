defmodule Voting.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: Voting.Repo

  def admin_factory do
    %Voting.Admin{
      name: "Jane Smith",
      email: "email@example.com",
      password_hash: Bcrypt.hash_pwd_salt("123123")
    }
  end

  def election_factory do
    %Voting.Election{
      name: "2020",
      cover: "http-to-a-image",
      notice: "http-to-a-pdf",
      starts_at: ~U[2020-02-01 11:00:00Z],
      ends_at: ~U[2020-06-01 20:59:59Z],
      created_by_id: build(:admin)
    }
  end
end
