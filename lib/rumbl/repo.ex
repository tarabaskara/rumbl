defmodule Rumbl.Repo do
  @moduledoc """
  In memory repo
  """

  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "Tara", username: "tara", password: "tara"},
      %Rumbl.User{id: "2", name: "Baskara", username: "baskara", password: "baskara"},
      %Rumbl.User{id: "3", name: "Jenar", username: "jenar", password: "jenar"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
