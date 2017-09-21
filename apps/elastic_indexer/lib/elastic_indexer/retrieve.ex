defmodule ElasticIndexer.Retrieve do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    {:ok, []}
  end

  def handle_call(:task, _from, state) do
    {:reply, state}
  end

  def handle_cast(:start_task, new_state) do
    {:noreply, new_state}
  end
end