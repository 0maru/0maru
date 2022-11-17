package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello, world!??"))
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Printf("launch server onssss 0.0.0.0:8080 🚀 at ./main.go")
	http.ListenAndServe(":8080", nil)
}
