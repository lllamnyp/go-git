# Базовый образ для сборки
FROM golang:1.12.5

WORKDIR $GOPATH/src/go-git/
# Кладём сырцы в рабочую директорию
COPY main.go .
# Скачиваем зависимости
RUN go get -d -v ./...
# Компилируем
RUN CGO_ENABLED=0 GOOS=linux go build \
    -a -installsuffix cgo -o /go-git .

RUN chmod 755 /go-git

WORKDIR /

# Добавляем статику
COPY *.html /static/
COPY *.jpg /static/

EXPOSE 8080
# Запускаем приложение
CMD ["./go-git"]
