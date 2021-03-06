(defun c:s-i(/ a b ss1 ss2 p c )
    (while (setq a(tblnext"layer"))
	   (command "layer""thaw"(setq b (cdr(assoc 2 a)))"unlock"b"")
     )
       (setq ss1 (ssget"x"(list(cons 70 1))))
       (command "region" ss1"")
       (setq ss2 (ssget"x"(list(cons 70 1)(cons 0 "lwpolyline"))))
       (command "u""")
       (command "layer""new""S-Iproblem""")
       (setq n_ss2(sslength ss2)p 0)
    (while (and (< p n_ss2)(>= p 0))
	      (setq c(entget(ssname ss2 p)))
	      (setq c(subst (cons 8 "S-Iproblem")(assoc 8 c) c))
	      (entmod c)
	      (setq p (1+ p))
     )
  )