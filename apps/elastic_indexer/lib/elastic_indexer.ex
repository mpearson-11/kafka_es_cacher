defmodule ElasticIndexer do
  import Application

  def start(_type, _args) do
    import Supervisor.Spec
    children = [
      worker(ElasticIndexer.Retrieve, [])
    ]
    opts = [strategy: :one_for_one, supervisor: ElasticIndexer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
