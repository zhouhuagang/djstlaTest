(defun c:chg_reg()
  (defun gdv (item dt)
  (cdr (assoc item dt))
)
(setq ent_set (ssget "x"
			 (list (cons 0 "lwpolyline")
			       (cons 41 0)
			       (cons -4 ">=")
			       (cons 70 128)
			 )
		  )
 )
 (if ent_set
   (progn
   (while (> (sslength ent_set) 0)
     (setq ent_name (ssname ent_set 0))
     (setq pl_dt (entget ent_name))
     (setq ent_set (ssdel ent_name ent_set))
     (setq reg_val (gdv 70 pl_dt))
     (setq reg_val (- reg_val 128))
     (setq pl_dt (subst (cons 70 reg_val)  (assoc 70 pl_dt)pl_dt))
     (entmod pl_dt)
     )
   (prompt "\nSome lwpolyline be changed the genaration to disable!")
   )
   )
  )
     