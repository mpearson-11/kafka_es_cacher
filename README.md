# TaskMgr

This Project is Intended To Create The Ability to Do the Following:

a) Snapshot a set of data for a selected time period, every hour by using a Kafka Consumer.
 - Kafka Consumer (GenServer) running for N time every hour
 - Data is collected using a Store (ETS cache)

b) Using a put Request push Kakfka Consumer Data every hour to Elastic Search (from ETS), failure is ok.
 - Use a http request mechanism (put) to index documents with kafka snapshot into elastic search.
 - Create Dashboard to show Elastic Search data.

 What do we need?

 a) store (dumb module) => store to ets (stash)
 b) get, post and put http request mechanism (dumb module) => make http requests (httpotion)
 c) kafka consumer (GenServer) periodic collection of kafka data => ets. (caffe)
 d) elastic search indexer (GenServer) periodic pushed from ets => elastic search (|b)


 ## Setup Instructions:
 - install elixir `brew install elixir`
 - run `mix deps.get` in root (should compile entire umbrella application)

 1) Install confluent-3.3.0
 2) go to profile `export CONFLUENT_HOME=/Users/[user]...`
 3) set path export PATH=$PATH:$CONFLUENT_HOME/bin
 4) run `confluent start`
 5) set topic in `apps/kafka_tasker/config/` `topics: ["<<topic>>"]`, ie topics: ["web-click-messages"]
 6) create the topic `kafka-topics --create --zookeeper localhost:2181 --topic <<topic>> --partitions 1 --replication-factor 1`
 7) start the producer `kafka-console-producer --broker-list localhost:9092 --topic <<topic>>`
 8) Start typing and you should see in the :observer that the messages are being saved.

 ## Run Application
  - run `mix deps.get` in root.
  - run `iex -S mix` to run in interactive mode.


