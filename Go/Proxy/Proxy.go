package main

import (
    "log"
    "net/http"
    "net/http/httputil"
    "net/url"
)

func main() {
    log.Printf("Starting...")
    http.HandleFunc("/", someFunc)
    log.Fatal(http.ListenAndServe(":6060", nil))
}

func someFunc(w http.ResponseWriter, r *http.Request) {

    // change the request host to match the target
    r.Host = "you.host.here:port"
    u, _ := url.Parse("http://you.host.here:port/some/path/")
    proxy := httputil.NewSingleHostReverseProxy(u)
    // You can optionally capture/wrap the transport if that's necessary (for
    // instance, if the transport has been replaced by middleware). Example:
    // proxy.Transport = &myTransport{proxy.Transport}
    proxy.Transport = &myTransport{}

    proxy.ServeHTTP(w, r)
}

type myTransport struct {
    // Uncomment this if you want to capture the transport
    // CapturedTransport http.RoundTripper
}

func (t *myTransport) RoundTrip(request *http.Request) (*http.Response, error) {
    response, err := http.DefaultTransport.RoundTrip(request)
    // or, if you captured the transport
    // response, err := t.CapturedTransport.RoundTrip(request)

    // The httputil package provides a DumpResponse() func that will copy the
    // contents of the body into a []byte and return it. It also wraps it in an
    // ioutil.NopCloser and sets up the response to be passed on to the client.
    body, err := httputil.DumpResponse(response, true)
    if err != nil {
        // copying the response body did not work
        return nil, err
    }

    // You may want to check the Content-Type header to decide how to deal with
    // the body. In this case, we're assuming it's text.
    log.Print(string(body))

    return response, err
}