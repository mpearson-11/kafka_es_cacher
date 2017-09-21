defmodule Store do
  def set(storage_key, key, value) do
    storage_key
    |> Stash.set(key, value)
  end
  def set(key, value) do
    Stash.set(:store, key, value)
  end
  def get(storage_key, key) do
    storage_key
    |> Stash.get(key)
  end
  def get(key) do
    Stash.get(:store, key)
  end
  def delete(storage_key, key) do
    storage_key
    |> Stash.delete(key)
  end
  def delete(key) do
    Stash.delete(:store, key)
  end
  def custom(option, storage_key, key, value) do
    case option do
      :get -> get(storage_key, key)
      :set -> set(storage_key, key, value)
      :delete -> delete(storage_key, key)
    end
  end
end