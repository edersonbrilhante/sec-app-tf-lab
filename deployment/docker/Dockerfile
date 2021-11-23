FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "10001" \
    "usersecapp"


WORKDIR $GOPATH/src/github.com/edersonbrilhante/sec-app-tf

COPY . .

RUN go mod verify && \
    go mod download && \
    GOOS=linux CGO_ENABLED=0 GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/sec-app-tf

FROM scratch

LABEL maintainer="contato@edersonbrilhante.com.br"

COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

COPY --from=builder /go/bin/sec-app-tf /sec-app-tf

USER usersecapp:usersecapp

ENTRYPOINT ["/sec-app-tf"]