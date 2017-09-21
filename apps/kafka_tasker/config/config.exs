# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :brod,
  clients: [
    kafka_client: [
      endpoints: [{'localhost', 9092}],
      auto_start_producers: true
    ]
  ]
config :kafka_consumer,
  consumers: [
    [client: :kafka_client,
     group_id: "messaging",
     topics: ["web-view-messages"],
     callback: KafkaTasker.Main,
     callback_args: []]
  ]