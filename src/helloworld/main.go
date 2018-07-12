package main

import (
	"fmt"
	"net/http"
	"strings"
)

type hit struct {
	count int32
}

var h = hit{0}

func (h *hit) inc() int32 {
	h.count = h.count + 1
	return h.count
}

func sayHello(w http.ResponseWriter, r *http.Request) {
	message := r.URL.Path
	message = strings.TrimPrefix(message, "/")
	message = fmt.Sprintf("%d. Hello %q !\n", h.inc(), r.RemoteAddr)
	w.Write([]byte(message))
}

func main() {
	fmt.Printf("%s", "starting a local http server on 8080\nWaiting for requests...")
	http.HandleFunc("/", sayHello)
	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}
