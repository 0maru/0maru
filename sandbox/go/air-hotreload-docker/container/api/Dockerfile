FROM golang:1.19-bullseye as dev
ENV TZ=Asia/Tokyo
WORKDIR /app
RUN go install github.com/cosmtrek/air@v1.29.0
COPY . .
CMD ["air", "-c", ".air.toml"]