amqp.gen:
	go run protocol/protogen.go && go fmt amqp/*_generated.go

deps:
	dep ensure && cd admin-frontend && yarn install

build.all: deps
	go build -o bin/garagemq main.go && cd admin-frontend && yarn build

build:
	go build -o bin/garagemq main.go

run: build
	bin/garagemq

vet:
	go vet github.com/valinurovam/garagemq...

test:
	ulimit -n 2048 && go test -cover github.com/valinurovam/garagemq...