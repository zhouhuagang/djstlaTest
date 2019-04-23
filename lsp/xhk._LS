					;�˳����Զ������»Կ��¡��ɻ���͹�棬writen by cheng xifeng <2006-04-15>

(defun chkline(layername / ss_line layername)     ;���Ҫ������ͼ����û��δ�պϵĵ���
  (setq ss_line(ssget"x"(list(cons 0 "line")(cons 8 layername))))
  (if ss_line
    (progn
    (alert (strcat "***"(strcase layername)"***" "��(Ҫ������ͼ��)��δ�պϵĵ��ߣ����Ƚ����߱պ�!"))
    (exit)
    )
   )
 )
(defun auto_array (/	       s_array_txt s_array_txt_len
		   txt_table   txt_con	   txt_sub_len txt_ro
		   p_key       ss_ent	   ss_length   ss_dt
		   cx	       cy	   cnt	       y_num
		   x_num       x_step	   y_step
		  )			;���������Զ��Ű沢�����Զ����ֲ��������
  (vl-load-com)
					;(setq s_array_txt (ssget "x"(list(cons 0 "text"))))

  (setq s_array_txt (ssget "x" (list (cons 0 "DIMENSION"))))
					;�Զ�ѡ��"DIMENSION"��ȡ�Ű�����
  (while (not s_array_txt)		;���û���ҵ�"DIMENSION"�����û�ѡȡ�Ű����֣�ֱ��ѡ��Ϊֹ
    (progn
      (prompt "\n*****��ѡ���Ű�����:")
      (setq s_array_txt (ssget))
    )
  )
  (setq s_array_txt_len (sslength s_array_txt))

  (setq m 0)
  (while (< m s_array_txt_len)
    (progn
      (setq txt_table (entget (ssname s_array_txt m)))
      (setq txt_con (cdr (assoc 1 txt_table)))
      (setq txt_sub_len (strlen txt_con))
      (setq aa (vl-string-search ")" txt_con))
      (if aa
	(progn
	  (setq txt_ro (cdr (assoc 50 txt_table)))
	  (setq p_key (substr txt_con 1 1))
	  (if (or(equal (strcase p_key) "P")
		 (equal (strcase p_key) "@")
	      )
	    (progn
	    (setq txt_con (substr txt_con 2))
	    (setq txt_con (vl-string-trim " " txt_con))
	    )
	  )
	  (if (= txt_ro 0)
	    (progn
	      (setq e_num (vl-string-search "=" txt_con))
	      (setq s_num (vl-string-search "X" txt_con))
	      (if (not s_num)
		(setq s_num (vl-string-search "x" txt_con))
	      )
	      (setq x_num (+ (atoi (substr txt_con (+ s_num 2))) 1))
	      (setq x_step (substr txt_con 1 s_num)
	      )
	    )
	    (progn
	      (setq e_num (vl-string-search "=" txt_con))
	      (setq s_num (vl-string-search "X" txt_con))
	      (if (not s_num)
		(setq s_num (vl-string-search "x" txt_con))
	      )
	      (setq y_num (+ (atoi (substr txt_con (+ s_num 2))) 1))
	      (setq y_step (substr txt_con 1 s_num)
	      )
	    )
	  )
	)
      )
    )
    (setq m (+ m 1))
  )
  (command "layer" "lock" "apr" "")
  (command "erase" "all" "")
  (command "layer" "unlock" "apr" "")
  (command "zoom" "e")
  (command "purge" "a" "" "n" "")
  (setq ss_ent nil)
  (command "zoom" "E")
  (while (not ss_ent)
    (progn
      (prompt "\n*****��ѡ��Ҫ�Ű�ĵ���:")
      (setq ss_ent (ssget))
    )
  )
  (setq ss_length (sslength ss_ent))
  (setq cx 0)
  (setq cy 0)
  (setq cnt 0)

  (setq ss_dt (entget (ssname ss_ent 0)))

  (while ss_dt
    (if	(= (caar ss_dt) 10)
      (progn
	(setq cx (+ (cadar ss_dt) cx))
	(setq cy (+ (caddar ss_dt) cy))
	(setq cnt (+ cnt 1))
      )
    )
    (setq ss_dt (cdr ss_dt))
  )
  (setq cnt_x (/ cx cnt))
  (setq cnt_y (/ cy cnt))




  (if (and (> cnt_x 0)			;�����ڵ������ޣ�X_STEP��Ϊ��
	   (< cnt_y 0)
      )
    (setq x_step (rtos (- 0 (atof x_step))))

  )
  (if (and (> cnt_x 0)			;�����ڵڶ����ޣ�X_STEP��Ϊ����Y_STEP��Ϊ��
	   (> cnt_y 0)
      )
    (progn
      (setq x_step (rtos (- 0 (atof x_step))))
      (setq y_step (rtos (- 0 (atof y_step))))
    )

  )
  (if (and (< cnt_x 0)			;�����ڵ�һ���ޣ�Y_STEP��Ϊ��
	   (> cnt_y 0)
      )
    (setq y_step (rtos (- 0 (atof y_step))))
  )
  (command "array" ss_ent "" "" y_num x_num y_step x_step "")
)
					;--------------------------------------------------------------------------------
(defun scale
       (ke kf pt1 pt2 / ss_lwpl dt ss_cnt i_loop pl_dt scl_x scl_y)
					;�öԽ�������ѡȡʵ���������
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (command "zoom" "E")
  (setq ss_lwpl (ssget "W" pt1 pt2 (list (cons 0 "lwpolyline"))))
					;(setq ss_lwpl (ssget "W" pt1 pt2 ))
  (if ss_lwpl
    (progn
      (setq ss_cnt (sslength ss_lwpl))
      (setq i_loop 0)
      (while (< i_loop ss_cnt)
	(setq pl_dt (entget (ssname ss_lwpl i_loop)))
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
	(entmod dt)
	(setq i_loop (1+ i_loop))
      )
    )
  )
  (command "zoom" "E")

)
					;-------------------------------------------------------------------------------

(defun ofst (layer_name	       cf1	ce1	 /	  ss_lwpl        ;��������
					
	     ss_cnt   i_loop   pl_dt	cx	 xy	  cnt
	     dt	      pl_dt    ofst_x	ofst_y
	    )
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (command "zoom" "E")
  (setq	ss_lwpl
	 (ssget "x" (list (cons 0 "lwpolyline") (cons 8 layer_name)))
  )
  (if ss_lwpl
    (progn
      (setq ss_cnt (sslength ss_lwpl))
      (setq i_loop 0)
      (while (< i_loop ss_cnt)
	(setq pl_dt (entget (ssname ss_lwpl i_loop)))
	(setq cx 0)
	(setq cy 0)
	(setq cnt 0)
	(setq dt pl_dt)
	(while pl_dt
	  (if (= (caar pl_dt) 10)
	    (progn
	      (setq cx (+ (cadar pl_dt) cx))
	      (setq cy (+ (caddar pl_dt) cy))
	      (setq cnt (1+ cnt))
	    )
	  )
	  (setq pl_dt (cdr pl_dt))
	)
	(setq cx (/ cx cnt))
	(setq cy (/ cy cnt))
	(setq pl_dt dt)
	(setq dt nil)
	(while pl_dt
	  (if (/= (caar pl_dt) 10)
	    (setq dt (append dt (list (car pl_dt))))
	    (progn
	      (setq ofst_x (cadar pl_dt))
	      (setq ofst_y (caddar pl_dt))
	      (if (> ofst_x cx)
		(setq ofst_x (- ofst_x cf1))
		(setq ofst_x (+ ofst_x cf1))
	      )
	      (if (> ofst_y cy)
		(setq ofst_y (- ofst_y ce1))
		(setq ofst_y (+ ofst_y ce1))
	      )
	      (setq dt
		     (append dt (list (cons 10 (list ofst_x ofst_y 0))))
	      )
	    )
	  )
	  (setq pl_dt (cdr pl_dt))
	)
	(entmod dt)
	(setq i_loop (1+ i_loop))
      )
    )
  )
)
					;--------------------------------------------------------------------------------------
(defun draw_edge_new ()			;�±߿�
  (command "pline"
	   (list 190.5 0.5)
	   "w"
	   0
	   0
	   (list 190.5 7.5)
	   (list 189.5 7.5)
	   (list 189.5 0.5)
	   (list 182.5 0.5)
	   (list 182.5 -0.5)
	   (list 189.5 -0.5)
	   (list 189.5 -7.5)
	   (list 190.5 -7.5)
	   (list 190.5 -0.5)
	   (list 197.5 -0.5)
	   (list 197.5 0.5)
	   "c"
  )
  (command "pline"
	   (list 199.5 15.0)
	   "w"
	   0
	   0
	   (list 197.5 15.0)
	   (list 197.5 -399.2)
	   (list 199.5 -399.2)
	   "c"
  )
  (command "pline"
	   (list 199.5 -429.2)
	   "w"
	   0
	   0
	   (list 199.5 -476.0)
	   (list -199.5 -476.0)
	   (list -199.5 -429.2)
	   (list -197.5 -429.2)
	   (list -197.5 -474.0)
	   (list 197.5 -474.0)
	   (list 197.5 -429.2)
	   "c"
  )
  (command "pline"
	   (list -199.5 15.0)
	   "w"
	   0
	   0
	   (list -199.5 -399.2)
	   (list -197.5 -399.2)
	   (list -197.5 15.0)
	   "c"
  )
  (command "pline"
	   (list -199.5 45.0)
	   "w"
	   0
	   0
	   (list -197.5 45.0)
	   (list -197.5 86.0)
	   (list 197.5 86.0)
	   (list 197.5 45.0)
	   (list 199.5 45.0)
	   (list 199.5 88.0)
	   (list -199.5 88.0)
	   "c"
  )
  (command "pline"
	   (list -190.5 0.5)
	   "w"
	   0
	   0
	   (list -190.5 7.5)
	   (list -189.5 7.5)
	   (list -189.5 0.5)
	   (list -182.5 0.5)
	   (list -182.5 -0.5)
	   (list -189.5 -0.5)
	   (list -189.5 -7.5)
	   (list -190.5 -7.5)
	   (list -190.5 -0.5)
	   (list -197.5 -0.5)
	   (list -197.5 0.5)
	   "c"
  )
  (command "pline"
	   (list 189.5 0.5)
	   "w"
	   0
	   0
	   (list 189.5 7.5)
	   (list 190.5 7.5)
	   (list 190.5 0.5)
	   (list 197.5 0.5)
	   (list 197.5 -0.5)
	   (list 190.5 -0.5)
	   (list 190.5 -7.5)
	   (list 189.5 -7.5)
	   (list 189.5 -0.5)
	   (list 182.5 -0.5)
	   (list 182.5 0.5)
	   "c"
  )
  (command "pline"
	   (list 190.5 -384.05)
	   "w"
	   0
	   0
	   (list 190.5 -399.05)
	   (list 189.5 -399.05)
	   (list 189.5 -384.05)
	   "c"
  )
  (command "pline"
	   (list -189.5 -384.05)
	   "w"
	   0
	   0
	   (list -189.5 -399.05)
	   (list -190.5 -399.05)
	   (list -190.5 -384.05)
	   "c"
  )
)
					;-------------------------------------------------------------------------------------
(defun draw_edge_old ()			;�ɱ߿�
  (command "pline"
	   (list -194.2 177.8)
	   "w"
	   0
	   0
	   (list -194.2 178.8)
	   (list -204.2 178.8)
	   (list -204.2 168.8)
	   (list -203.2 168.8)
	   (list -203.2 177.8)
	   "c"
  )
  (command "pline"
	   (list 257.0 98.3602)
	   "w"
	   0
	   0
	   (list 257.0 194.5)
	   (list 255.0 194.5)
	   (list 144.145 194.5)
	   (list 144.145 192.5)
	   (list 255.0 192.5)
	   (list 255.0 98.3602)
	   "c"
  )
  (command "pline"
	   (list -255.0 98.3602)
	   "w"
	   0
	   0
	   (list -255.0 192.5)
	   (list -144.145 192.5)
	   (list -144.145 194.5)
	   (list -257.0 194.5)
	   (list -257.0 98.3602)
	   "c"
  )
  (command "pline"
	   (list 144.145 -194.5)
	   "w"
	   0
	   0
	   (list 144.145 -192.5)
	   (list 255.0 -192.5)
	   (list 255.0 -98.3602)
	   (list 257.0 -98.3602)
	   (list 257.0 -194.5)
	   "c"
  )
  (command "pline"
	   (list -144.145 -192.5)
	   "w"
	   0
	   0
	   (list -144.145 -194.5)
	   (list -257.0 -194.5)
	   (list -257.0 -98.3602)
	   (list -255.0 -98.3602)
	   (list -255.0 -192.5)
	   "c"
  )
)
					;---------------------------------------------------------------------------------
(defun txt (/ textname ipoot textnum textatt text_style)
					;��������TXT����
  (setvar "cmdecho" 0)
  (setvar "orthomode" 0)
  (setvar "snapmode" 0)
  (setq textname (ssget "x" (list (cons 0 "text"))))
  (setq ipoot 0)
  (setq textnum (sslength textname))
  (while
    (if	(< ipoot textnum)
      (progn
	(setq textatt (entget (ssname textname ipoot)))
	(setq text_style (cdr (assoc 7 textatt)))
	(command "-style" text_style "txt.shx" "" "" "" "" "" "n")
	(setq ipoot (1+ ipoot))
      )
    )
  )
  (setvar "cmdecho" 1)
)

(defun logo()                                 ;��LOGO
(prompt "\n*****��ѡ���LOGO�Ŀ�:")
  (setq ss_ent nil)
  (setq ss_ent (ssget))
  (command "zoom" "E")
  (while (not ss_ent)			;û��ѡ��ʵ��ʱ��������ʾ����ѡ��ֱ��ѡ��Ϊֹ
    (progn
      (prompt "\n*****��û��ѡ��һ����������ѡ��!!")
      (setq ss_ent (ssget))
    )
  )
  (setq ss_length (sslength ss_ent))
  (while (/= ss_length 1)		;ѡ�еĲ���һ��ʵ��ʱ��������ʾ����ѡ��ֱ��ѡ��һ��ʵ��Ϊֹ
    (progn
      (prompt "\n*****��ѡ��Ĳ���һ����������ѡ��!!")
      (setq ss_ent (ssget))
      (setq ss_length (sslength ss_ent))
    )
  ) 
  (progn                                  ;������ѡ��LOGO���߿�����ĵ�CENTERPT
    (setq ss_dt (entget (ssname ss_ent 0)))
    (setq cx 0)
    (setq cy 0)
    (setq cnt 0)
    (while ss_dt
      (if (= (caar ss_dt) 10)
	(progn
	  (setq cx (+ (cadar ss_dt) cx))
	  (setq cy (+ (caddar ss_dt) cy))
	  (setq cnt (+ cnt 1))
	)
      )
      (setq ss_dt (cdr ss_dt))
    )
    (setq cnt_x (/ cx cnt))
    (setq cnt_y (/ cy cnt))
    (setq centerpt (list cnt_x cnt_y 0))

  )
  (setq get_dt (getvar "CDATE"))
  (setq qylogo (strcat " QINGYI " (itoa (fix get_dt))))
  (setq centerpt_x (car centerpt))
  (setq centerpt_y (cadr centerpt))
  (if (> centerpt_x (- 100))                ;���ݼ����LOGO���߿����ĵ�X�����λ������������LOGO�ķ���(�¡��ɻ���һ��)
    (setq txt_dt (list (cons 0 "TEXT")
		       (cons 1 qylogo)
		       (cons 10 centerpt)
		       (cons 41 0.45)
		       (cons 11 centerpt)
		       (cons 40 15)
		       (cons 72 4)
		       (cons 7 "standard")
		 )
    )
    (setq txt_dt (list (cons 0 "TEXT")
		       (cons 1 qylogo)
		       (cons 10 centerpt)
		       (cons 41 0.45)
		       (cons 50 4.71239)
		       (cons 11 centerpt)
		       (cons 40 15)
		       (cons 72 4)
		       (cons 71 2)
		       (cons 7 "standard")
		 )
    )
  )
  (entmake txt_dt)
)

(defun c:xhk (/		new_old	  get_basept	      flag                ;������
	      basept_x	basept_y  ke	    kf	      ce1
	      cf1	ss_length ss_cell   ss_dt     cx
	      cy	cnt	  cnt_x	    cnt_y     qylogo
	      get_dt	centerpt_x
	     )
  (if (not(tblsearch "layer" "apr"))       ;�ж��Ƿ���APR�㣬���û����ʾ�û������˳�����
    (progn
    	(alert "�뽫��Ч��(HC��PI)��ΪAPR��!!")
    	(exit)
    )
  )
  (chkline "apr")
  (initget 1 "N  NEW O OLD")		;�����û�������
  (setq new_old (getkword "\n*****�������»����Ǿɻ�: New/<Old>"))
  (initget 0)
  (if (or (equal (strcase new_old) "N")
	  (equal (strcase new_old) "NEW")
      )
    (progn
      (setvar "osmode" 2)
      (setq get_basept (getpoint "\n*****��ѡ��ITO�ϱߵ����ĵ�:"))

      (setvar "osmode" 0)
      (command "zoom" "E")
      (command "move" "all" "" get_basept "0,0")
      (setq flag 1)

    )
    (progn
      (setvar "osmode" 1)
      (setq get_basept
	     (getpoint "\n*****���ȡ���½ǡ�L��״ͼ�ε������½�:"
	     )
      )
      (command "zoom" "E")

      (setvar "osmode" 0)
      (setq basept_x (car get_basept))
      (setq basept_y (cadr get_basept))
      (setq basept_x (+ basept_x 204.2))
      (setq basept_y (+ basept_y 178.8))
      (setq get_basept (list basept_x basept_y)) ;���ĸ�L״ͼ�����ľ���
      (command "move" "all" "" get_basept "0,0")
      (setq flag 2)

    )

  )
  (auto_array)
  (setvar "mirrtext" 1)
  (if (= flag 1)			;����ʱ�Ը���ϵ��������Ӧ����
    (progn
      (command "mirror" "all" "" "0,0" "0,9" "y")
      (setq ke 0.97888)
      (setq kf 1)
      (setq pt1 (list -185 -300 0))
      (setq pt2 (list 185 0 0))
      (scale ke kf pt1 pt2)
      (draw_edge_new)
    )
  )
  (if (= flag 2)			;����ʱ�Ը���ϵ��������Ӧ����
    (progn
      (command "mirror" "all" "" "0,0" "9,0" "y")
      (setq kf 0.9755)
      (setq ke 1)
      (setq pt1 (list -203.2 -177.8 0))
      (setq pt2 (list 203.2 177.8 0))
      (setq cf1 -0.05)
      (setq ce1 -0.05)
      (scale ke kf pt1 pt2)
      (setq ss_cell nil)
      (while (not ss_cell)
	(progn
	  (prompt "\n*****��ѡ��Ҫ�����ĵ���:")
	  (setq ss_cell (ssget))
	)
      )
      (command "zoom" "E")
      (command "layer" "n" "ofst" "")
      (command "change" ss_cell "" "p" "la" "ofst" "")
      (ofst "ofst" cf1 ce1)
      (draw_edge_old)
    )
  )
  (txt)
  (logo)
  (command "change" "all" "" "p" "la" "0" "")
  (command "layer" "lock" "0" "")
  (command "layer" "m" "0" "")
  (command "erase" "all" "")
  (command "layer" "unlock" "0" "")
  (command "zoom" "e")
  (command "purge" "la" "" "N")
  (command "-units" "2" "5" "" "" "" "")
  (if (= flag 1)
    (alert (strcat

	     "\n��ȷ��ϵ���ǣ�"

	     "\n-----  KE= "
	     (rtos ke)
	     " ---  KF = "
	     (rtos kf)".00000"
	     "-----"
	     "\n-----  CE=0.00000 "

	     "---  CF = 0.00000 -----"


	     "\n-----------------�˰�Ϊ�»�-----------------"
	     "\n---��ȷ��͹��ߴ絥�߿��Ƿ�ɾ��-----"
	     
	   )
    )
  )

  (if (= flag 2)
    (alert (strcat

	     "\n��ȷ��ϵ���ǣ�"

	     "\n---  KE= "
	     (rtos kf)
	     " ---  KF = "
	     (rtos ke)
	     "------"
	     "\n---  CE= "
	     (rtos (* 2 ce1))
	     "---"

	     " CF= "
	     (rtos (* 2 cf1))
	     "------"


	     "\n----------------�˰�Ϊ�ɻ�-----------------"
	   )
    )
  )
)

(prompt
  "\n--------------------����XHK���г���--------------------"
)
(prompt
  "\n---------���г���ǰ�Ƚ�APR��ͼ�αպ�(��������)---------"
)
(prompt
  "\n-----------���û��APR�㣬�뽫��Ч���ΪAPR-----------"
)


