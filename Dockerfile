FROM golang:1.17 AS image_go
WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...
RUN go build main.go

FROM scratch AS image_base
COPY --from=image_go /go/src/app .
CMD ["./main"]