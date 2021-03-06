

(defun c:autonum3 (/    nx   ny	 x    y	   ww	a    a_data    old
		  no   xx   yy	 obj  len oth  sta   ri	  le   ls
		  rs   lef  rig	 b_data	   new	m1   m2  md
		 )
  (setq oldosmode (getvar "osmode"))
  (setvar "osmode" 0)
  (setq oldorthomode (getvar "orthomode"))
  (setvar "orthomode" 0)
  (setq nx (getint "\n 请输入x方向排版的个数:"))
  (setq ny (getint "\n 请输入y方向排版的个数:"))
  (setq m1 (getpoint "\n 指定第一个角点:"))
  (setq m2 (getpoint "\n 指定第二个角点:" m1))
  (setq x (- (car m2) (car m1)))
  (setq y (- (cadr m2) (cadr m1)))
  (setq	ww
	 (getreal
	   "\n 请选择递增方式，前面的字符随X轴递增请输入1，随Y轴递增请输入0:"
	 )
  )
  (setq a (entsel "\n 选择你要排版的文字:"))
  (setq a_data (entget (car a)))
  (setq old (list (assoc 10 a_data) (assoc 1 a_data)))
  (setq	no (list (assoc 0 a_data)
		 (assoc 5 a_data)
		 (assoc 67 a_data)
		 (assoc 410 a_data)
		 (assoc 40 a_data)
		 (assoc 50 a_data)
		 (assoc 41 a_data)
		 (assoc 51 a_data)
		 (assoc 7 a_data)
		 (assoc 71 a_data)
		 (assoc 72 a_data)
		 (assoc 11 a_data)
		 (assoc 210 a_data)
		 (assoc 73 a_data)
	   )
  )
  (setq xx (cadr (car old)))
  (setq yy (caddr (car old)))
  (setq obj (cdr (cadr old)))
  (setq len (strlen obj))
  (setq oth (substr obj 1 (- len 3)))
  (setq sta (substr obj (- len 2)))
  (setq ri (substr sta 3 1))
  (setq md (substr sta 2 1))
  (setq le (substr sta 1 1))
  (setq ls (atoi le))
  (setq rs (atoi ri))
  (command "-layer" "n" "f" "")
  (command "-layer" "c" "5" "f" "")
  (if (= ww 0)
    (progn
      (repeat ny
	(setq rs (+ rs 0))
	(repeat	nx
	  (setq lef (itoa ls))
	  (setq rig (itoa rs))
	  (setq	new (list (cons 10 (list xx yy 0.0))
			  (cons 1 (strcat oth lef md rig))
			  (cons 8 "f")
		    )
	  )
	  (setq b_data (append no new))
	  (entmake b_data)

	  (setq rs (+ rs 1))
	  (setq xx (+ xx x))
	)
	(setq rs (atoi ri))
	(setq xx (cadr (car old)))
	(setq ls (+ ls 1))
	(setq yy (+ yy y))
      )
    )
  )
  (if (= ww 1)
    (progn
      (repeat nx
	(setq rs (+ rs 0))
	(repeat	ny
	  (setq lef (itoa ls))
	  (setq rig (itoa rs))
	  (setq	new (list (cons 10 (list xx yy 0.0))
			  (cons 1 (strcat oth lef md rig))
			  (cons 8 "f")
		    )
	  )
	  (setq b_data (append no new))
	  (entmake b_data)

	  (setq rs (+ rs 1))
	  (setq yy (+ yy y))

	)
	(setq rs (atoi ri))
	(setq yy (caddr (car old)))
	(setq ls (+ ls 1))
	(setq xx (+ xx x))
      )
    )
  )
  (entdel (car a))
  (setvar "osmode" oldosmode)
  (setvar "orthomode" oldorthomode)
  (prin1)
)

