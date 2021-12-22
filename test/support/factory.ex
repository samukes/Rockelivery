defmodule Rockelivery.Factory do
  use ExMachina

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
end
