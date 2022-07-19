package main

import (
	"crypto/sha256"
	"fmt"

	// Force a CGO build
	_ "crypto/tls"
)

const message = "Hello World"

func main() {
	hash := sha256.New()
	hash.Write([]byte(message))

	fmt.Println(message, hash.Sum(nil))
}
