FROM golang:1.11-alpine

# Set maintainer label: maintainer=[YOUR-EMAIL]
MAINTAINER mgirkinger95@gmail.com

# Set working directory: `/src`
WORKDIR /src

# Copy local file `main.go` to the working directory
COPY main.go .

# List items in the working directory (ls)
RUN ls

# Build the GO app as myapp binary and move it to /usr/
RUN apk update
RUN apk add git
RUN apk add build-base
RUN go build -o myapp main.go

RUN mv myapp /usr/

#Expose port 8888
EXPOSE 8888

# Run the service myapp when a container of this image is launched
CMD ["/usr/myapp"]