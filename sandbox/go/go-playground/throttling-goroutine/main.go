package main

import (
	"fmt"
	"log"
	"sync"
	"time"
)

func main() {
	before := time.Now()

	limit := make(chan struct{}, 20)
	var wg sync.WaitGroup
	for i := 1; i <= 100; i++ {
		wg.Add(1)

		i := i
		go func() {
			limit <- struct{}{}
			defer wg.Done()
			u := fmt.Sprintf("https://firebasestorage.googleapis.com/v0/b/maru-playground.appspot.com/o/address.csv?alt=media&token=d5311722-7a38-4864-89db-50775db90a0b")
			downloadCSV(u, i)
			<-limit
		}()
	}

	wg.Wait()
	fmt.Printf("%v\n", time.Since(before))
}

func downloadCSV(u string, i int) {
	log.Println(i)
	log.Println(u)
}
