(defpackage :advent-of-code
  (:use :cl)
  (:nicknames :aoc)
  (:export #:day-one))

(in-package :advent-of-code)

(defparameter +input+ #p"2025-01-input.txt" "The input file for this challenge")
(defparameter +start+ 50 "The starting position")

(defun parse-line (line)
  "Parse a line"
  ;; replace #\L with - and remove #\R; then parse as integer
  (parse-integer (substitute #\- #\L (remove #\R line)))) 

(defun read-input ()
  "Read the input file"
  (let ((lines (uiop:read-file-lines +input+))
	(value +start+))
    (loop for l in lines
	  do (setf value (mod (+ value (parse-line l)) 100)) ;; parse and add to value mod 100
	  do (format t "~&~s~t~d~%" l value) ;; for debugging
	  count (zerop value) into zeroes ;; count every time value is 0
	  finally (return zeroes))))
		   
	  
      
	  

;; exported functions

(defun day-one ()
  "AOC challenge day 1 2025"
  (unless (probe-file +input+) (error "Input file does not exist"))
  (read-input))



