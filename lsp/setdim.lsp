;write for init the dim var
;writed by Jurry deng
;last modified date 2003/03/27
;precision is 0.0000
;text high 4.15
;dim color is red(1)
(defun c:setdim	()
  (setvar "DIMALT" 0)
  (setvar "DIMASZ" 1)
  (command "units" "2" "4" "1" "4" "0" "n")
  (setvar "DIMATFIT" 3)
  (setvar "DIMAZIN" 0)
  (setvar "DIMBLK" "")
  (setvar "DIMBLK1" "")
  (setvar "DIMBLK2" "")
  (setvar "DIMCEN" 0.000000)
  (setvar "DIMCLRD" 1)
  (setvar "DIMCLRE" 1)
  (setvar "DIMCLRT" 1)
  (setvar "DIMDEC" 4)			;dimension preision
  (setvar "DIMDLE" 0.0000)
  (setvar "DIMDLI" 0.0000)
  (setvar "DIMDSEP" ".")
  (setvar "DIMEXE" 0.000000)
  (setvar "DIMEXO" 0.000000)
  (setvar "DIMFIT" 3)
  (setvar "DIMFRAC" 0)
  (setvar "DIMGAP" 0.000000)
  (setvar "DIMJUST" 0)
  (setvar "DIMLDRBLK" "")
  (setvar "DIMLFAC" 1.0000)
  (setvar "DIMLUNIT" 2)
  (setvar "DIMLWD" -2)
  (setvar "DIMLWE" -2)
  (setvar "DIMPOST" "")
  (setvar "DIMRND" 0.000000)
  (setvar "DIMSAH" 0)
  (setvar "DIMSCALE" 1.0)
  (setvar "DIMSD1" 0)
  (setvar "DIMSD2" 0)
  (setvar "DIMSE1" 0)
  (setvar "DIMSE2" 0)
  (setvar "DIMSHO" 1)
  (setvar "DIMSOXD" 0)
  (setvar "DIMTAD" 0)
  (setvar "DIMTDEC" 2)
  (setvar "DIMTFAC" 1.0000)
  (setvar "DIMTIH" 0)
  (setvar "DIMTIX" 0)
  (setvar "DIMTM" 0.000000)
  (setvar "DIMTMOVE" 0)
  (setvar "DIMTOFL" 0)
  (setvar "DIMTOH" 0)
  (setvar "DIMTOL" 0)
  (setvar "DIMTOLJ" 1)
  (setvar "DIMTP" 0.000000)
  (setvar "DIMTSZ" 0.000000)
  (setvar "DIMTVP" 0.0000)
  (setvar "DIMTXT" 4.1500)
  (setvar "DIMTZIN" 0)
  (setvar "DIMUNIT" 2)
  (setvar "DIMUPT" 0)
  (setvar "DIMZIN" 0)
)
(prompt "\n input SETDIM to run")