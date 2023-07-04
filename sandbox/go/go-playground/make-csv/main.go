package main

import (
	"encoding/csv"
	"github.com/go-chi/chi/v5"
	"log"
	"net/http"
	"os"
)

func main() {
	r := chi.NewRouter()
	r.Get("/download", downloadCSVAPI)
	http.ListenAndServe(":3000", r)
}

// CSV ファイルをダウンロードできるAPI
func downloadCSVAPI(w http.ResponseWriter, r *http.Request) {
	data := [][]string{
		{"Name", "Age"},
		{"太郎", "12"},
		{"花子", "21"},
	}
	file, err := os.CreateTemp("", "test.csv")
	if err != nil {
		log.Fatal(err)
	}
	defer os.Remove(file.Name())

	writer := csv.NewWriter(file)
	for _, record := range data {
		if err := writer.Write(record); err != nil {
			log.Fatal(err)
		}
	}
	writer.Flush()

	w.Header().Set("Content-Type", "text/csv")
	w.Header().Set("Content-Disposition", "attachment; filename=test.csv")

	http.ServeFile(w, r, file.Name())
}
