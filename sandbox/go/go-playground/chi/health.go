package main

import (
	"net/http"
)

func HealthApi(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("health ok"))
}
