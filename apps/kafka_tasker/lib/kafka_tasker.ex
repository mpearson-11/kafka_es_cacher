defmodule KafkaTasker do
  import Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(KafkaConsumer.Supervisor, []),
    ]

    opts = [strategy: :one_for_one, supervisor: KafkaTasker.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
