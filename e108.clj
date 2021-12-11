(defn gcd [a b]
  (if (zero? b) a (gcd b (mod a b))))

(defn ways [n]
  (count
    (filter #(= 1
      (/ (- % n) (gcd (- % n) (* % n))))
      (range (inc n) (inc (* 2 n))))))


(defn isPrime [x]
  (not (some #(zero? (mod x %)) (range 2 (inc (int (Math/sqrt x)))))))

(defn ans [ps i j min_val]
  (if (zero? (count ps)) min_val
   (if (= 4 i) (ans (rest ps) 0 0 min_val)
    (if (= 4 j) (ans ps (inc i) 0 min_val)
      (let [N (* (reduce * ps) (int (Math/pow 2 i)) (int (Math/pow 3 j)))
            mval (if (and (< N min_val) (> (ways N) 1000)) N min_val)]
           (ans ps i (inc j) mval))))))

(print (ans (reverse (filter isPrime (range 2 30))) 0 0 1000000))
