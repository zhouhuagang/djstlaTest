;此程序将一个DWG图形转成可用LSP语言绘出的LSP程序
;装入并运行to_command.

 (defun dxf (code elist)
        (cdr (assoc code elist))
  )

 (defun c:to_command ( / pl_ss ent_name total count tmp_detail f_name)
           
        (setq f_name (getstring nil "Input the file name you want to creat: "))
        (setq f_name (strcat "D:\\" f_name ".lsp"))

        (setq layer_string (getstring nil "Input the layer to be handled: "))
        (setq layer_string (strcase layer_string))

        (setq pl_ss (ssget "X" (list (cons 0 "POLYLINE") (cons 8 layer_string))))
        (if pl_ss
           (progn
              (setq f_name (open f_name "w"))
              (princ (strcat (chr 10) " (defun draw_edge () ") f_name)
              (setq total (sslength pl_ss))
              (setq count 0)
              (while (< count total)
                     (setq ent_name (ssname pl_ss count))
                     (if ent_name
                        (progn
                           (setq tmp_detail (entget ent_name))
                           (if (/= tmp_detail nil ) 
                              (pl_to_command ent_name f_name)
                            )
                         )
                      )
                     (setq count (1+ count))
               )
              (princ (strcat (chr 10) "  )") f_name)
              (close f_name)
            )
         )
  )

 (defun pl_to_command (pl f_name / ed en p1 p2 a detail tmp_a first_p tmp_string)

        (setq ed (entget pl))
        (setq en (entnext (dxf -1 ed)))
        (setq detail (entget en))
        (setq p1 (dxf 10 detail)) ;First point
        (princ (strcat (chr 10) "        (command ") f_name)
        (princ (chr 34) f_name)
        (princ "pline" f_name)
        (princ (chr 34) f_name)
        (princ " (list " f_name)
        (princ (car p1) f_name)
        (princ " " f_name)
        (princ (cadr p1) f_name)
        (princ ") " f_name)
        (princ (chr 34) f_name)
        (princ "w" f_name)
        (princ (chr 34) f_name)
        (princ " 0 0 " f_name)

        (setq en (entnext en))
        (while (and en
                    (setq ed (entget en))
                    (/= "SEQEND" (DXF 0 ed))
                )
               (setq p1 (dxf 10 ed))
               (princ (strcat (chr 10) "                         (list ") f_name)
               (princ (car p1) f_name)
               (princ " " f_name)
               (princ (cadr p1) f_name)
               (princ ") " f_name)
               (setq en (entnext en))
         )
        (if (= 1 (dxf 70 (entget pl)))
           (princ (strcat (chr 10) "                         " (chr 34) "c" (chr 34)) f_name)
           (progn
              (princ (strcat (chr 10) "                        ") f_name)
              (princ (chr 34) f_name)
              (princ (chr 34) f_name)
            )
         )
        (princ (strcat (chr 10) "         )") f_name)
 )
