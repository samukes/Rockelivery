defmodule RockeliveryWeb.UserControllerTest do
  use RockeliveryWeb.ConnCase, async: true

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
end
