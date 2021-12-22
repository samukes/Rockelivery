defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.User
  alias Rockelivery.Error
  alias Rockelivery.Users.Create

  describe "call/1" do
    test "when all params are valid, returns valid user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, age: 27, email: "mail@mail.com"}} = response
    end

    test "when invalid params, returns error" do
      params = build(:user_params, %{password: "123", age: 15})

      response = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
