defmodule Dashboard.PageController do
  use Dashboard.Web, :controller

  def get_kafka_stashed_keys(keys) do
    {status, data} = Enum.map_reduce(keys, %{}, fn(key, acc) ->
      {:ok, Map.put(acc, key, Stash.get(:kafka, key))}
    end)
    data
  end

  def index(conn, _params) do
    data = :kafka_keys 
    |> Stash.get("keys")
    |> get_kafka_stashed_keys
    json conn, data
  end
end
