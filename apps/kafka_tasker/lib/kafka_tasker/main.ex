defmodule KafkaTasker.Main do
  use KafkaConsumer.Consumer
  
  def handle_async(%KafkaConsumer.Message{topic: topic, value: message}) do
    random_id = Enum.random(1..1_000_000_000_000_000) |> Integer.to_string
    IO.puts("Received a Kafka Message from message: #{message} with id: #{random_id}")
    Store.custom(:set, :kafka, random_id, message)
    :ok
  end
end