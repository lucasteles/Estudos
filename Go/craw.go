package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

var Contents chan string

func main() {

	Contents = make(chan string)

	http.HandleFunc("/craw", func(w http.ResponseWriter, r *http.Request) {
		r.ParseForm()
		value := r.FormValue("url")
		if (len(value)>0){
			go PutContent(value)
			fmt.Fprintf(w,"ok")
		} else {
			fmt.Fprintf(w,"err")
		}
	})

	http.HandleFunc("/get", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, GetContent())
	})

	http.ListenAndServe(":8080", nil)
}

func GetContent() string {
	var ret string

	select {
	case ret = <-Contents:
	default:
		ret = "EOF"
	}

	return ret

}

func PutContent(url string) {

	res, err := http.Get(url)
	if err != nil {
		log.Fatal(err)
	}

	body, err := ioutil.ReadAll(res.Body)
	res.Body.Close()
	if err != nil {
		log.Fatal(err)
	}

	if res.StatusCode != http.StatusNotFound {
		Contents <- string(body)
	}

}
