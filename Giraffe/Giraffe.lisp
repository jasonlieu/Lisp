;Jason Lieu
;jasonlieu@csu.fullerton.edu
;This program simulates a Giraffe's tour of a chess board
;All squares must be visted
;No square is visited more than once
;Path, in reverse order, is printed upon completion
;Giraffe movement:
;   12      5
;11     1       6
;   4   G   2
;10     3       7
;   9       8
;To edit check order: cut and paste to desired IF statement
;              (AND (<= 0 (- y 1))                                      
;                   (NOT (MEMBER (LIST x (- y 1)) path :test #'equal)))
;                   (Giraffe x (- y 1) (APPEND (LIST (LIST x y)) path))
(DEFUN Giraffe(x y path) 
;    (IF (NOT  (AND (EQUAL 49 (LIST-LENGTH path))        ;check moves if path >49   
;              (OR  (AND (= x 0) (= y 1))                   ;
;                   (AND (= x 1) (= y 0))
;                   (AND (= x 1) (= y 2))
;                   (AND (= x 2) (= y 2))
;             )))                          ;x y cannot legally move to 0,0  (moves 2,3,7,8 from 0,0)
    (IF (NOT (EQUAL 49 (LIST-LENGTH path)))                             
        (PROGN (IF (AND (<= 0 (- y 1))                                      ;check 1
                (NOT (MEMBER (LIST x (- y 1)) path :test #'equal)))         ;check if not already in path
            (Giraffe x (- y 1) (APPEND (LIST (LIST x y)) path))             ;next move
            (IF (AND (>= 6 (+ x 1))                                         ;check 2
                (NOT (MEMBER (LIST (+ x 1) y) path :test #'equal)))
            (Giraffe (+ x 1) y (APPEND (LIST (LIST x y)) path))
            (IF (AND (>= 6 (+ y 1))                                         ;check 3
                    (NOT (MEMBER (LIST x (+ y 1)) path :test #'equal)))
                (Giraffe x (+ y 1) (APPEND (LIST (LIST x y)) path))
            (IF (AND (<= 0 (- x 1))                                         ;check 4
                    (NOT (MEMBER (LIST (- x 1) y) path :test #'equal)))
                (Giraffe (- x 1) y (APPEND (LIST (LIST x y)) path))
            (IF (AND (>= 6 (+ x 1))                                         
                    (<= 0 (- y 2))
                    (NOT (MEMBER (LIST (+ x 1) (- y 2)) path :test #'equal)))   ;check 5 
                (Giraffe (+ x 1) (- y 2) (APPEND (LIST (LIST x y)) path))
            (IF (AND (>= 6 (+ x 2))                                         
                    (<= 0 (- y 1))
                    (NOT (MEMBER (LIST (+ x 2) (- y 1)) path :test #'equal)))   ;check 6 
                (Giraffe (+ x 2) (- y 1) (APPEND (LIST (LIST x y)) path))
            (IF (AND (>= 6 (+ x 2))                                         
                    (>= 6 (+ y 1))
                    (NOT (MEMBER (LIST (+ x 2) (+ y 1)) path :test #'equal)))   ;check 7 
                (Giraffe (+ x 2) (+ y 1) (APPEND (LIST (LIST x y)) path))
            (IF (AND (>= 6 (+ x 1))                                         
                    (>= 6 (+ y 2))
                    (NOT (MEMBER (LIST (+ x 1) (+ y 2)) path :test #'equal)))   ;check 8 
                (Giraffe (+ x 1) (+ y 2) (APPEND (LIST (LIST x y)) path))
            (IF (AND (<= 0 (- x 1))                                         
                    (>= 6 (+ y 2))
                    (NOT (MEMBER (LIST (- x 1) (+ y 2)) path :test #'equal)))   ;check 9 
                (Giraffe (- x 1) (+ y 2) (APPEND (LIST (LIST x y)) path))
            (IF (AND (<= 0 (- x 2))                                         
                    (>= 6 (+ y 1))
                    (NOT (MEMBER (LIST (- x 2) (+ y 1)) path :test #'equal)))   ;check 10 
                (Giraffe (- x 2) (+ y 1) (APPEND (LIST (LIST x y)) path))
            (IF (AND (<= 0 (- x 2))                                         
                    (<= 0 (- y 1))
                    (NOT (MEMBER (LIST (- x 2) (- y 1)) path :test #'equal)))   ;check 11 
                (Giraffe (- x 2) (- y 1) (APPEND (LIST (LIST x y)) path))
            (IF (AND (<= 0 (- x 1))                                         
                    (<= 0 (- y 2))
                    (NOT (MEMBER (LIST (- x 1) (- y 2)) path :test #'equal)))   ;check 12 
                (Giraffe (- x 1) (- y 2) (APPEND (LIST (LIST x y)) path))
            )))))))))))))    ;bunch of nested IF's
            (PRINT (LIST "path:" path)))
)

(Giraffe 0 0 (LIST ""))      ;function call. Start at (0,0) with empty path
