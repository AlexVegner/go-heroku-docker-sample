FROM golang:1.19-alpine AS builder
RUN mkdir /build

COPY . /build/
WORKDIR /build
RUN go build

FROM alpine
RUN adduser -S -D -H -h /app appuser
USER appuser
COPY --from=builder /build/app /app/
WORKDIR /app
CMD ["./app"]