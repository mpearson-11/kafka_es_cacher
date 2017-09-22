defmodule KafkaTasker.Main do
  use KafkaConsumer.Consumer

  def store(keys, random_id) do
    if keys != nil do
      Stash.set(:kafka_keys, "keys", keys ++ [random_id])
    else
      Stash.set(:kafka_keys, "keys", [random_id])
    end
  end

  defp multiply(n) do
    n * n * n
  end

  defp gen_random do
    n = 1_000_000
    |> multiply

    Enum.random(1..n)
    |> Integer.to_string
  end
  
  def handle_async(%KafkaConsumer.Message{topic: topic, value: message}) do
    random_id = gen_random()
    IO.puts("##{random_id}::#{message}")

    Stash.get(:kafka_keys, "keys")
    |> store(random_id)
    
    Stash.set(:kafka, random_id, message)
    :ok
  end
end