(defun c:xgroup( / num str1 str2)
  (setq num (getint"\nPlease input the start number:"))
  (while (< num 1000)
    (setq str1 (itoa num))
    (setq str2(strcat "*a" str1))
    (command "-group" "e" str2 "" "")
    (setq num (+ 1 num))
    )
  )