package main

import (
	"fmt"

	"github.com/confluentinc/confluent-kafka-go/kafka"
)

func main() {
	// Create a new Kafka producer config
	config := kafka.ConfigMap{
		"bootstrap.servers": "localhost:9092",
	}

	// Create a producer instance
	p, err := kafka.NewProducer(&config)
	if err != nil {
		panic(err)
	}

	// Produce a message to the 'my-topic' topic
	message := &kafka.Message{
		Value: []byte("Hello, from Microservice One!"),
	}

	err = p.Produce(message, nil)
	if err != nil {
		panic(err)
	}

	fmt.Println("Message produced to 'my-topic'")

	// Close the producer
	p.Close()
}
