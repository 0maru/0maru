FROM golang:1.19-bullseye as dev
ENV TZ=Asia/Tokyo
WORKDIR /app
COPY . .
CMD ["go", "run", "cmd/server/main.go"]