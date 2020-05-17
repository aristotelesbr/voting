defmodule VotingWeb.Admin.ElectionControllerTest do
  use VotingWeb.ConnCase, async: true

  import VotingWeb.AdminAuth

  describe "create/2" do
    setup %{conn: conn} do
      conn = authenticate(conn)
      %{conn: conn}
    end

    test "returs 201 when election is created successfully", %{conn: conn} do
      params = %{
        "name" => "any name",
        "cover" => "any_url",
        "notice" => "any notice",
        "starts_at" => "2020-02-01T11:00:00Z",
        "ends_at" => "2020-03-01T11:00:00Z"
      }

      conn = post conn, "/api/v1/elections", params
      assert %{"status" => "ok", "data" => _} = json_response(conn, 201)
    end

    test "returs 422 when params is are invalid", %{conn: conn} do
      params = %{
        "name" => "",
        "cover" => "any_url",
        "notice" => "any notice",
        "starts_at" => "2020-02-01T11:00:00Z",
        "ends_at" => "2020-03-01T11:00:00Z"
      }

      conn = post conn, "/api/v1/elections", params
      assert %{"status" => "unprocessable entity"} = json_response(conn, 422)
    end
  end
end
