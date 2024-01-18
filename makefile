start-kafka:
	docker run -d -p 9092:9092 confluentinc/cp-kafka:7.3.2

start-compose:
	docker-compose up -d

start-serviceone:
	kafka-ip="localhost"
	go run cmd/serviceone/main.go -kafka-bootstrap-servers $(kafka-ip):9092

start-servicetwo:
	kafka-ip="localhost"
	go run cmd/servicetwo/main.go -kafka-bootstrap-servers $(kafka-ip):9092

start: start-compose
	make start-servicesone
	make start-servicestwo

stop:
	docker-compose down -v
