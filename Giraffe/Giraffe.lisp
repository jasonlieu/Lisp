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
(DEFUN Giraffe(x y path) 
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
            )))))
            (PRINT (LIST "path:" path)))
)
;    (IF (AND (<= 0 (- x 1))          ;check 1
;             (<= 0 (- y 2))
;             (NOT (MEMBER (LIST x y) (LIST path) :test #'equal)))
;        (Giraffe (- x 1) (- y 2) (APPEND (LIST (LIST x y)) path))
;        (PRINT "nah on 1")
;    )
;    (IF (AND (>= 6 (+ x 1))          ;check 2
;             (<= 0 (- y 2)))
;        (PRINT "move 2")
;        (PRINT "nah on 2")
;    )
(Giraffe 0 0 (LIST ""))      ;function call. Start at (0,0) with empty path
