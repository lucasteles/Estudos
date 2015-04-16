package main

import (
	"fmt"
	"math"
)

func Sqrt(x float64) float64 {
	z := x
	novo := z+1
	
	for math.Abs(novo-z) > float64(0.000000000000001) || math.Abs(novo-z) == 0 {
		z = novo
		novo = z - ((z*z)-x)/(2*z)
	}	
	
	return z
}

func main() {
	fmt.Println(Sqrt(2))
	fmt.Println(math.Sqrt(2))
}
