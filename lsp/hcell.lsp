(defun set_var ()
  (setq osnap_old (getvar "osmode"))
  (setq orthomode_old (getvar "orthomode"))
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (list osnap_old orthomode_old)
)
(defun get_dt_vl (item dt)
  (cdr (assoc item dt))
)
(defun c:hcell ()
  (set_var)
  (prompt "\n 请选中您手工做好的单粒 ")
  (setq s (ssget))
  (vl-load-com)
  (setq s_name (ssname s 0))
  (setq s_obj (vlax-ename->vla-object s_name))
  (vla-getboundingbox s_obj 'l_pt 'r_pt)
  (setq l_pt (vlax-safearray->list l_pt))
  (setq r_pt (vlax-safearray->list r_pt))
  (vlax-release-object s_obj)
  (setq	mid_pt (list (/ (+ (car l_pt) (car r_pt)) 2)
		     (/ (+ (cadr l_pt) (cadr r_pt)) 2)
	       )
  )
  (prompt "\n 请选中程序做好的全部单粒 ")
  (setq ss (ssget))
  (setq num (sslength ss))
  (setq count 0)
  (vl-load-com)
  (while (< count num)
    (setq pl_name (ssname ss count))
    (setq a nil)
    (setq ent_obj (vlax-ename->vla-object pl_name))
    (vla-getboundingbox ent_obj 'ld 'rd)
    (setq ld (vlax-safearray->list ld))
    (setq rd (vlax-safearray->list rd))
    (command "zoom" ld rd)
    (setq md (list (/ (+ (car ld) (car rd)) 2)
		   (/ (+ (cadr ld) (cadr rd)) 2)
	     )
    )
    (setq kf (/ (- (car rd) (car ld)) (- (car r_pt) (car l_pt))))
    (setq ke (/ (- (cadr rd) (cadr ld)) (- (cadr r_pt) (cadr l_pt))))
    (command "copy" s "" mid_pt "0,0")
    (setq o_name (entlast))
    (setq pl_dt (entget o_name))
    (setq dt nil)
    (while pl_dt
      (if (/= (caar pl_dt) 10)
	(setq dt (append dt (list (car pl_dt))))
	(progn
	  (setq scl_x (* (cadar pl_dt) kf))
	  (setq scl_y (* (caddar pl_dt) ke))
	  (setq
	    dt (append dt (list (cons 10 (list scl_x scl_y 0))))
	  )
	)
      )
      (setq pl_dt (cdr pl_dt))
    )
    (setq dt (subst (cons 8 "0") (assoc 8 dt) dt )) 
    (entmod dt)
    (setq a (entlast))
    (command "move" a "" "0,0" md)
    (setq count (1+ count))
  )
  (vlax-release-object ent_obj)
  (command "layer" "n" "tmp" "m" "tmp" "co" "red" "" "")
  (command "change" ss "" "p" "la" "tmp" "" "")
  (command "erase" s "")
)
(prompt "\n 将手工做的单粒闭合!请运行hcell!")