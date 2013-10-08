package main

import "fmt"
import "math"

func tri(n int) int {
    return (n * (n + 1)) / 2
}

func factorCount(n int) int {
    count := 0
    if int(math.Sqrt(float64(n)))*int(math.Sqrt(float64(n))) == n {
        count += 1
    }
    for i := 1; i < int(math.Sqrt(float64(n))); i++ {
        if n % i == 0 {
            count+=2
        }
    }
    return count
}
func main() {
    for i := 1; i <= 100000; i++ {
        if factorCount(tri(i)) > 500 {
            fmt.Println(tri(i))
            break
        }
        if i % 10000 == 0 {
            fmt.Println(i)
        }
    }
}
