package main

import (
	"context"
	"fmt"
	"log"
	"sync"
	"time"
)

func main() {
	var wg sync.WaitGroup
	wg.Add(1)
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	go download(ctx, &wg)
	wg.Wait()
}

func download(ctx context.Context, wg *sync.WaitGroup) {
	defer wg.Done()

	for {
		select {
		case <-ctx.Done():
			log.Println("タイムアウトした")
			return
		default:
		}
		fmt.Println("goroutine progress....")
		time.Sleep(1 * time.Second)
	}
}
