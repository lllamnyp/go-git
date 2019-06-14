# FROM golang:1.12.5 as builder
# 
# WORKDIR $GOPATH/src/hello-http/
# 
# COPY main.go .
# 
# RUN go get -d -v ./...
# 
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /go/bin/hello-http .
# 
######## Start a new stage from scratch #######
#FROM alpine:latest  
FROM scratch

#RUN apk --no-cache add ca-certificates

#WORKDIR /root/

# Copy the Pre-built binary file from the previous stage
# COPY --from=builder /go/bin/hello-http .
COPY go-git .

COPY *.html /static/

COPY *.jpg /static/

EXPOSE 8080

CMD ["./go-git"]
