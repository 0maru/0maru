package main

import (
	"bytes"
	"encoding/csv"
	"io"
	"log"
	"net/http"
	"sync"
)

func main() {
	log.Println("start")
	urls := []string{
		"https://firebasestorage.googleapis.com/v0/b/maru-playground.appspot.com/o/test.csv?alt=media&token=199caae8-ea8e-4a5a-8241-e991f60447b2",
		"https://firebasestorage.googleapis.com/v0/b/maru-playground.appspot.com/o/address.csv?alt=media&token=d5311722-7a38-4864-89db-50775db90a0b",
	}
	ch := make(chan []byte)

	var wg sync.WaitGroup
	wg.Add(len(urls))
	go downloadCSV(&wg, urls, ch)

	for b := range ch {
		r := csv.NewReader(bytes.NewReader(b))
		for {
			records, err := r.Read()
			// 最後の行まで読み込んだらループを終了させる
			if err == io.EOF {
				break
			}
			for i := range records {
				print(records[i], ",")
			}
			println("")
		}
	}
	wg.Wait()
	log.Println("complete")
}

// CSV をダウンロードする
func downloadCSV(wg *sync.WaitGroup, urls []string, ch chan []byte) {
	defer wg.Done()
	defer close(ch)
	for _, u := range urls {
		log.Println("fetch: ", u)
		resp, err := http.Get(u)
		if err != nil {
			log.Println("cannot download csv: ", err)
			continue
		}
		b, err := io.ReadAll(resp.Body)
		if err != nil {
			resp.Body.Close()
			log.Println("cannot read content: ", err)
			continue
		}
		resp.Body.Close()
		ch <- b
	}
}
