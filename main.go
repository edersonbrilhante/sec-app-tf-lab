package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/", App)
    http.ListenAndServe(":8000", nil)
}

func App(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello World")
}
