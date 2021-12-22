defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 27,
      address: "Rua dos guararapes",
      cep: "00000001",
      cpf: "00000000001",
      email: "mail@mail.com",
      password: "123456",
      name: "Samuel"
    }
  end

  def user_factory do
    %User{
      age: 27,
      address: "Rua dos guararapes",
      cep: "00000001",
      cpf: "00000000001",
      email: "mail@mail.com",
      password: "123456",
      name: "Samuel",
      id: "068fee54-3ef7-41d1-b322-2eb7e7d85d4c"
    }
  end
end
