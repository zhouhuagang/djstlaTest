(defun c:dci(/ a b c d e n ss ssb f m poin osnap_o ortho_o)
        (setq osnap_o(getvar"osmode") ortho_o (getvar "orthomode"))
        (setvar "osmode" 0)
        (setvar "orthomode" 0)
        (command "convert" "all""")   
        (command "audit" "y""")
        (setq poin(ssget"x"(list(cons 0 "point"))))
        (command "erase" poin "")
        (setq n 0 b 0 a 0 c 0 d 0 ss 0 ssb 0 e 0 f 0 m 0)
        (setq e (getvar"limmin"))
             (if (/= (cadr e) 1)
                 (setq f (list (car e) 1))(setq f (list (car e) 2)))
        (setq a(ssget"x"(list(cons -4 "<and")
			           (cons 210 '(0.0 0.0 -1))
			     (cons -4 "<or")
			           (cons 0 "lwpolyline")(cons 0 "text")
			     (cons -4 "or>")
			     (cons -4 "and>"))))
             (if (/= a nil)
                 (progn
	              (command "mirror" a "" e f"y""")
                      (setq c(cons 210 '(0.0 0.0 1.0)))
                      (setq d(sslength a))
                 )
	     )
       (command "zoom" "extents")
             (while (and (>= n 0) (<= n (- d 1))(/= a nil))	       
	         (setq ss (ssname a n))
	         (setq ssb(entget ss))
	         (setq b(assoc 210 ssb))	      
	         (setq ssb(subst c b ssb))
	         (entmod ssb)	       
	         (setq n (+ 1 n))	       
	     )
       (setvar "osmode" osnap_o)
       (setvar "orthomode" ortho_o)
       (command "zoom" "extents")
       (dcip)
       (setq a nil)
   )   
;(alert "It is only for the text of Malasia and sometimes the mask of DCI!
        ;and if you want to mend the unclosed entities,Input command \"DCIPP\"!")
(defun dcip(/ plss const new len ssn old n ssnn startpoint listlen listno startpointdata
	        endpointdata endpoint dist)       
       (setq plss (ssget"x"(list(cons 70 0)(cons 0 "lwpolyline"))))
       (setq const  0.0005001)
       (setq new (cons 70 1))
           (if(/= plss nil)
                 (setq   len  (sslength plss) n 0)
           )
       (while (and (< n len)(>= n 0)(/= plss nil))
	        (setq ssn(ssname plss n))
	        (setq ssnn(entget ssn))
	        (setq startpointdata (cdr(assoc 10 ssnn)))
	        (setq startpoint(list(car startpointdata)(cadr startpointdata)))
	        (setq endpointdata (cdr (assoc 10 (reverse ssnn))))
	        (setq endpoint (list(car endpointdata )(cadr endpointdata)))
	        (setq dist (distance startpoint endpoint))
	               (if (<= dist const)
			 (progn
	                   (setq old (assoc 70 ssnn))
	                   (setq ssnn (subst new old ssnn))
	                   (entmod ssnn)
	                 )
	               )
	        (setq n (+ 1 n))
       )
       (setq plss nil)
       
  )
  (princ"此程序功能一、修改多义线及文字延展性;\n")
  (princ"          二、删点；           \n") 
  (princ"          三、闭合多义线;      \n")
                  