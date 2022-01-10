; Breadth-first Search

(setq *print-case* :downcase)

(defparameter *currentstate* '()) ; Holds the current valid state of the system 
(defvar *nextstate* '()) ; Holds the next possible state. Could be safe or unsafe
(defvar *startstate* '(e e e e)) ; Starting state
(defvar *goalstate* '(w w w w)) ; Goal State
(defvar *path* '()) ; Path taken by the program
(defvar *counter* 0) ; Counter used for iterating through the list
(defvar *inthepath* nil) ; Boolean for if the state is in the path list
(defvar *listequal*) ; Boolean for whether or not the lists are equal

#||
	1	famer moving alone
	2	famer moving with the goat
	3	famer moving with the wolf
	4	famer moving with the cabbage
||#
(defparameter *validmoves* ; All the valid moves possible
	'(1 2 3 4)
)

(defun statecheck (state) ; Checks if the given state is safe or not
	(if (or (and (eq (nth 1 state) (nth 2 state)) (not (eq (nth 0 state) (nth 1 state)))) (and (eq (nth 1 state) (nth 3 state)) (not (eq (nth 0 state) (nth 1 state))))
		)
		(return-from statecheck(- 1 1))
		(return-from statecheck(- 2 1))
	)
)

(defun compare (list1 list2) ; Compare two lists, returns 1 if the list are equal otherwise returns 0
	(setq *counter* 0)
	(setq *listequal* nil)
	(loop for x in list1 do
		(if (eq (nth *counter* list1) (nth *counter* list2))
			(progn
				(setq *listequal* 1)
				(setq *counter* (+ *counter* 1))
			)
			(progn
				(setq *listequal* 0)
				(return x)
			)
		)
	)
	(if (eq *listequal* 1)
		(return-from compare(- 2 1))
		(return-from compare(- 1 1))
	)
)

(defun inpath (item) ; Check if the state is already in the path list or not
	(loop for x in *path* do
		(setq *counter* 0)
		(setq *inthepath* nil)
		(loop for y in x do
			(if (eq (nth *counter* item) y)
				(progn
					(setq *counter* (+ *counter* 1))
					(setq *inthepath* 1)
				)
				(progn
					(setq *inthepath* 0)
					(return y)
				)
			)
		)
		(if (eq *inthepath* 1)
			(return x)
		)
	)
	(if (eq *inthepath* 1)
		(return-from inpath(- 2 1))
		(return-from inpath(- 1 1))
	)
)

(defun copytonext (a) ; Copys the given list into *nextstate*
	(setq *nextstate* nil)
	(loop for x in a do
		(push x *nextstate*)
	)
	(setq *nextstate* (reverse *nextstate*))
)

(defun copytocurrent (a) ; Copys the given list into *currentstate*
	(setq *currentstate* nil)
	(loop for x in a do
		(push x *currentstate*)
	)
	(setq *currentstate* (reverse *currentstate*))
)

(defun changestate (move) ; Based on the given valid move, changes the *nextstate*
	(copytonext *currentstate*)
	(if (eq move 1)
		(if (eq (nth 0 *nextstate*) 'w)
			(setf (nth 0 *nextstate*) 'e)
			(setf (nth 0 *nextstate*) 'w)
		)
	)
	(if (eq move 2)
		(progn 
		(if (eq (nth 0 *nextstate*) 'w)
			(setf (nth 0 *nextstate*) 'e)
			(setf (nth 0 *nextstate*) 'w)
		)
		(if (eq (nth 1 *nextstate*) 'w)
			(setf (nth 1 *nextstate*) 'e)
			(setf (nth 1 *nextstate*) 'w)
		)
		)
	)
	(if (eq move 3)
		(progn 
		(if (eq (nth 0 *nextstate*) 'w)
			(setf (nth 0 *nextstate*) 'e)
			(setf (nth 0 *nextstate*) 'w)
		)
		(if (eq (nth 2 *nextstate*) 'w)
			(setf (nth 2 *nextstate*) 'e)
			(setf (nth 2 *nextstate*) 'w)
		)
		)
	)
	(if (eq move 4)
		(progn 
		(if (eq (nth 0 *nextstate*) 'w)
			(setf (nth 0 *nextstate*) 'e)
			(setf (nth 0 *nextstate*) 'w)
		)
		(if (eq (nth 3 *nextstate*) 'w)
			(setf (nth 3 *nextstate*) 'e)
			(setf (nth 3 *nextstate*) 'w)
		)
		)
	)
)

(defvar x 1)
(copytocurrent *startstate*)
(push *currentstate* *path*)

(loop	; Main loop
	(loop for y in (reverse *validmoves*) do
		(changestate y)
		(if (and (eq (statecheck *nextstate*) 1) (eq (inpath *nextstate*) 0))
			(progn
				(copytocurrent *nextstate*)
				(push *currentstate* *path*)
			)
		)
		(if (eq (compare *currentstate* *goalstate*) 1)
			(return y)
		)
	)
	(if (eq (compare *currentstate* *goalstate*) 1)
		(return x)
	)
)

(loop for y in (reverse *path*) do	; Printing the path
	(format t "~a ~%" y)
)

