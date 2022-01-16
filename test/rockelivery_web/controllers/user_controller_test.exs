defmodule RockeliveryWeb.UserControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Mox
  import Rockelivery.Factory

  alias Rockelivery.ViaCep.ClientMock
  alias RockeliveryWeb.Auth.Guardian

  describe "create/2" do
    test "when all params valid, creates user", %{conn: conn} do
      params = %{
        "age" => 27,
        "address" => "Rua dos guararapes",
        "cep" => "00000001",
        "cpf" => "00000000001",
        "email" => "mail@mail.com",
        "password" => "123456",
        "name" => "Samuel"
      }

      expect(ClientMock, :get_cep_info, fn _cep ->
        {:ok, build(:cep_info)}
      end)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created",
               "user" => %{
                 "address" => "Rua dos guararapes",
                 "age" => 27,
                 "cpf" => "00000000001",
                 "email" => "mail@mail.com",
                 "id" => _id
               }
             } = response
    end

    test "there is error, returns error", %{conn: conn} do
      params = %{
        "password" => "123456",
        "name" => "Samuel"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    setup %{conn: conn} do
      user = insert(:user)
      {:ok, token, _claims} = Guardian.encode_and_sign(user)
      conn = put_req_header(conn, "authorization", "Bearer #{token}")

      {:ok, conn: conn, user: user}
    end

    test "when there's user with id, deletes user",
         %{conn: conn} do
      id = "068fee54-3ef7-41d1-b322-2eb7e7d85d4c"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
