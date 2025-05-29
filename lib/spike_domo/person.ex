defmodule SpikeDomo.Person do
  use Domo
  use TypedStruct

  typedstruct enforce: true do
    field :name, String.t()
    field :age, non_neg_integer()
    field :happy?, boolean(), default: true
    field :phone, String.t()
  end
end
