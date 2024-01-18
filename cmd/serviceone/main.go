package main

import (
	"fmt"

	"github.com/confluentinc/confluent-kafka-go/kafka"
)

func main() {
	// Create a new Kafka producer
	config := kafka.ConfigMap{
		"bootstrap.servers": "localhost:9092",
	}
	p, err := kafka.NewProducer(&config)
	if err != nil {
		panic(err)
	}

	message := &kafka.Message{
		Value: []byte("Hello, from Microservice One!"),
	}

	// Produce the message to the 'my-topic' topic
	err = p.Produce(message, nil)
	if err != nil {
		fmt.Println("Failed to produce message to 'my-topic':", err)
		panic(err)
	}

	fmt.Println("Message produced to 'my-topic'")
}
