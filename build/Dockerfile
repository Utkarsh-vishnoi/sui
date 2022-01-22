FROM golang:alpine as builder
LABEL maintainer="Will Fantom <willfantom@gmail.com>"
RUN apk add --no-cache curl step-cli
COPY ./go.mod /app/go.mod
WORKDIR /app
RUN go mod download
COPY . /app/
WORKDIR /app
RUN go mod tidy
RUN CGO_ENABLED=0 go build -o sui .
COPY ./templates /app/templates
COPY ./assets /app/assets
WORKDIR /app
COPY ./build/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "./sui" ]
