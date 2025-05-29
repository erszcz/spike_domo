# SpikeDomo

```
$ time mix compile --force
Compiling 5 files (.ex)
Domo is compiling type ensurer for 1 module (.ex)
Generated spike_domo app

real	0m0.479s
user	0m0.483s
sys	0m0.873s
```

```elixir
iex> SpikeDomo.Impl.do_stuff(3)
"3"
iex> SpikeDomo.Impl.do_stuff(:z)  # no checking of specs on behaviour impls
"z"
iex> Person.new(%{})
{:error,
 [
   phone: "Invalid value nil for field :phone of %SpikeDomo.Person{}. Expected the value matching the <<_::_*8>> type.",
   name: "Invalid value nil for field :name of %SpikeDomo.Person{}. Expected the value matching the <<_::_*8>> type.",
   age: "Invalid value nil for field :age of %SpikeDomo.Person{}. Expected the value matching the non_neg_integer() type."
 ]}
iex> Person.new!(%{})
** (ArgumentError) the following keys must also be given when building struct SpikeDomo.Person: [:phone, :age, :name]
    (spike_domo 0.1.0) SpikeDomo.Person.__struct__/1
    (elixir 1.18.3) lib/kernel.ex:2456: Kernel.struct!/2
    (spike_domo 0.1.0) lib/spike_domo/person.ex:2: SpikeDomo.Person.new!/1
    iex:2: (file)
iex> p1 = Person.new(%{name: "Join", age: 20, phone: "123-456-789"})
{:ok,
 %SpikeDomo.Person{phone: "123-456-789", happy?: true, age: 20, name: "Join"}}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `spike_domo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:spike_domo, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/spike_domo>.

