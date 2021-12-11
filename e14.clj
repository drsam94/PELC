
(defn collatz-count [n c]
    (if (= 1 n) (+ c 1)
        (if (= 0 (mod n 2)) (collatz-count (/ n 2) (+ c 1))
            (collatz-count (+ (* 3 n) 1) (+ c 1)))))

(defn mmax [x y] (if (< (first x) (first y)) y x))

(println (second (reduce mmax (map #(list (collatz-count % 0) %) (range 1 1000000)))))   
