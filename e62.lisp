
(defun digits (x)
  (if (< x 10) (cons x '()) (cons (mod x 10) (digits (floor (/ x 10))))))

(defun cubes (size)
  (defun help (elem acc)
    (if (< (log (expt elem 3) 10) (- size 1)) acc (help (- elem 1) (cons (expt elem 3) acc))))
  (help (floor (expt 10 (/ size 3))) '()))

(defun lsum (lst)
  (defun help (l tot)
    (if (equal l '()) tot (help (cdr l) (+ tot (car l)))))
  (help lst 0))

(defun ans (lst)
  (if (equal lst '()) 0
    (let ((digs (sort (digits (car lst)) #'>)))
    (let ((a (lsum (map 'list #'(lambda (x) (if (equal digs (sort (digits x) #'>)) 1 0)) (cdr lst)))))
        (if (= a 4) (car lst) (ans (cdr lst)))))))

(defun e62 (size)
  (let ((a (ans (cubes size)))) (if (= a 0) (e62 (+ size 1)) a)))

(e62 5)
