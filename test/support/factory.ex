defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      "age" => 27,
      "address" => "Rua dos guararapes",
      "cep" => "00000001",
      "cpf" => "00000000001",
      "email" => "mail@mail.com",
      "password" => "123456",
      "name" => "Samuel"
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

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
