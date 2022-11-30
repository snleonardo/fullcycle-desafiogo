FROM golang:alpine as builder
WORKDIR /go/src
RUN ls
COPY main.go .
RUN echo 'Building program...'
RUN go build main.go

FROM alpine:2.6
COPY --from=builder /go/src .
CMD ["./main"]