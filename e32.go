package main

import "fmt"
import "sort"

func getDigits(x int) []int {
    d := []int{}
    for x > 0 {
        d = append(d, x % 10)
        x /= 10
    }
    return d
}

func pandigitalProduct(x int, y int) (bool, int) {
    prod   := x * y

    digits := []int{}
    digits  = append(digits, getDigits(x)...)
    digits  = append(digits, getDigits(y)...)
    digits  = append(digits, getDigits(prod)...)
    sort.Ints(digits)
    if len(digits) == 9 {
        for i, value := range digits {
            if value != i + 1 {
                return false, 0
            }
        }
        return true, prod
    }
    return false, 0
}
func contains(lst []int, x int) bool {
    for _, value := range lst {
        if value == x {
            return true
        }
    }
    return false
}
func main() {
    validProds := []int{}
    for i := 0; i < 10000; i += 1 {
        for j := i; j < 10000; j += 1 {
            isPandigital, product := pandigitalProduct(i, j)
            if isPandigital && !contains(validProds, product) {
                validProds = append(validProds, product)
            }
            if j * i > 100000 {
                break
            }
        }
    }
    sum := 0
    for _, num := range validProds {
        sum += num
    }
    fmt.Println(sum)
}