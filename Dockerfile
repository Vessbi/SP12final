FROM golang:1.23.4
#задаем рабочий каталог 
WORKDIR /usr/src/app
#копируем все файлы и каталоги из текущего каталога
COPY . .
#добавляем отсутсвующие и удаляем неиспользуемые модули в go.mod
RUN go mod tidy
#собираем приложения
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /SP12Final
CMD ["/SP12Final"] 