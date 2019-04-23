(defun set_var ()
  (setq osnap_old (getvar "osmode"))
  (setq orthomode_old (getvar "orthomode"))
  (setvar "osmode" 0)
  (setvar "orthomode" 0)
  (list osnap_old orthomode_old)
)
(defun reset_var (var_list)
  (setvar "osmode" (car var_list))
  (setvar "orthomode" (cadr var_list))
)
 (defun c:logo () 
      (setq in_point1 (getpoint "\n 请点取插入点:"))
      (setq high (getdist in_point1 "\n 请指示文字高度:"))
      (setq x (car in_point1))
      (setq y (cadr in_point1))
      (setq in_point2 (list (- x) (- y))) 
      (command "ucs" "o" in_point1 )
      (command "layer" "n" "tmp" "m" "tmp" "")
      (setq var_list (set_var))
   (command "pline" (list 6.18678 0.744236) "w" 0 0 
                         (list 6.44246 0.745486) 
                         (list 6.44375 0.721111) 
                         (list 6.37438 0.715903) 
                         (list 6.33711 0.711945) 
                         (list 6.1598 0.591322) 
                         (list 6.42448 0.336951) 
                         (list 6.44761 0.331951) 
                         (list 6.51698 0.331951) 
                         (list 6.52084 0.307576) 
                         (list 6.15468 0.303618) 
                         (list 6.15209 0.333201) 
                         (list 6.21634 0.334451) 
                         (list 6.02232 0.518198) 
                         (list 6.02105 0.51299) 
                         (list 6.0172 0.507781) 
                         (list 6.02105 0.336951) 
                         (list 6.02876 0.329243) 
                         (list 6.10199 0.329243) 
                         (list 6.10455 0.310076) 
                         (list 6.09814 0.304868) 
                         (list 5.76022 0.302368) 
                         (list 5.75766 0.311326) 
                         (list 5.75766 0.326743) 
                         (list 5.76922 0.329243) 
                         (list 5.8386 0.333201) 
                         (list 5.83474 0.710695) 
                         (list 5.77564 0.711945) 
                         (list 5.75766 0.713403) 
                         (list 5.7551 0.736528) 
                         (list 5.77179 0.740278) 
                         (list 6.09943 0.742778) 
                         (list 6.09943 0.719653) 
                         (list 6.09428 0.713403) 
                         (list 6.02232 0.711945) 
                         (list 6.0172 0.700487) 
                         (list 6.0172 0.545072) 
                         (list 6.02362 0.539864) 
                         (list 6.26774 0.705695) 
                         (list 6.26259 0.717153) 
                         (list 6.19963 0.714653) 
                         (list 6.18293 0.718403) 
                         (list 6.18293 0.739028) 
                         "c"
         )
        (command "pline" (list 5.30154 0.428199) "w" 0 0 
                         (list 5.29384 0.415491) 
                         (list 5.29513 0.303618) 
                         (list 5.30798 0.29591) 
                         (list 5.34652 0.29591) 
                         (list 5.36194 0.306326) 
                         (list 5.38506 0.317784) 
                         (list 5.40306 0.308826) 
                         (list 5.44287 0.298618) 
                         (list 5.49042 0.29091) 
                         (list 5.54696 0.289452) 
                         (list 5.60477 0.29091) 
                         (list 5.64846 0.299868) 
                         (list 5.70241 0.324243) 
                         (list 5.74354 0.357575) 
                         (list 5.76022 0.374242) 
                         (list 5.77052 0.402575) 
                         (list 5.77693 0.437158) 
                         (list 5.77564 0.475699) 
                         (list 5.75895 0.507781) 
                         (list 5.74866 0.527156) 
                         (list 5.72812 0.541323) 
                         (list 5.69985 0.556739) 
                         (list 5.66258 0.569447) 
                         (list 5.62275 0.581114) 
                         (list 5.58421 0.590072) 
                         (list 5.5521 0.595072) 
                         (list 5.51739 0.60153) 
                         (list 5.48915 0.607988) 
                         (list 5.45317 0.613196) 
                         (list 5.42875 0.622155) 
                         (list 5.40306 0.627363) 
                         (list 5.3915 0.633613) 
                         (list 5.3825 0.645279) 
                         (list 5.3825 0.658196) 
                         (list 5.38377 0.668404) 
                         (list 5.38892 0.68132) 
                         (list 5.40433 0.692778) 
                         (list 5.4249 0.702987) 
                         (list 5.4416 0.708195) 
                         (list 5.45829 0.710695) 
                         (list 5.47758 0.717153) 
                         (list 5.50842 0.717153) 
                         (list 5.53925 0.717153) 
                         (list 5.5765 0.711945) 
                         (list 5.60733 0.699237) 
                         (list 5.63304 0.690278) 
                         (list 5.65487 0.661946) 
                         (list 5.67158 0.637571) 
                         (list 5.68314 0.622155) 
                         (list 5.6947 0.616946) 
                         (list 5.72168 0.616946) 
                         (list 5.72427 0.624655) 
                         (list 5.72427 0.735069) 
                         (list 5.71397 0.740278) 
                         (list 5.68058 0.737778) 
                         (list 5.67029 0.726111) 
                         (list 5.65873 0.722361) 
                         (list 5.64975 0.722361) 
                         (list 5.63689 0.722361) 
                         (list 5.62018 0.73007) 
                         (list 5.57908 0.741528) 
                         (list 5.53796 0.745486) 
                         (list 5.50198 0.746736) 
                         (list 5.46729 0.745486) 
                         (list 5.43004 0.739028) 
                         (list 5.39406 0.723611) 
                         (list 5.36323 0.710695) 
                         (list 5.34652 0.694028) 
                         (list 5.32469 0.673612) 
                         (list 5.30927 0.649029) 
                         (list 5.29769 0.613196) 
                         (list 5.30154 0.582364) 
                         (list 5.30927 0.549031) 
                         (list 5.32725 0.529656) 
                         (list 5.34523 0.518198) 
                         (list 5.37992 0.501532) 
                         (list 5.42875 0.484657) 
                         (list 5.46987 0.474449) 
                         (list 5.50327 0.470699) 
                         (list 5.53154 0.46924) 
                         (list 5.56623 0.46424) 
                         (list 5.60221 0.457782) 
                         (list 5.64075 0.447574) 
                         (list 5.66387 0.433408) 
                         (list 5.68058 0.415491) 
                         (list 5.68956 0.398616) 
                         (list 5.68829 0.372992) 
                         (list 5.67029 0.347367) 
                         (list 5.64846 0.336951) 
                         (list 5.62404 0.324243) 
                         (list 5.60091 0.319034) 
                         (list 5.5765 0.317784) 
                         (list 5.54696 0.314035) 
                         (list 5.51354 0.315284) 
                         (list 5.48529 0.320284) 
                         (list 5.44031 0.329243) 
                         (list 5.41463 0.346117) 
                         (list 5.39021 0.362784) 
                         (list 5.36836 0.384658) 
                         (list 5.35038 0.409033) 
                         (list 5.34267 0.422991) 
                         "c"
         )
        (command "pline" (list 4.4802 0.29591) "w" 0 0 
                         (list 4.69091 0.29716) 
                         (list 5.01726 0.562989) 
                         (list 4.94015 0.338409) 
                         (list 4.9119 0.299868) 
                         (list 5.10719 0.29591) 
                         (list 5.24723 0.749236) 
                         (list 5.04938 0.746736) 
                         (list 4.50589 0.312576) 
                         (list 4.4802 0.302368) 
                         "c"
         )
        (command "pline" (list 1.12519 0.718403) "w" 0 0 
                         (list 1.14703 0.722361) 
                         (list 1.45667 0.723611) 
                         (list 1.47081 0.714653) 
                         (list 1.46952 0.695278) 
                         (list 1.46438 0.692778) 
                         (list 1.37959 0.692778) 
                         (list 1.37959 0.420491) 
                         (list 1.38215 0.403825) 
                         (list 1.386 0.375492) 
                         (list 1.39371 0.360075) 
                         (list 1.40142 0.335701) 
                         (list 1.42327 0.317784) 
                         (list 1.45411 0.308826) 
                         (list 1.47852 0.307576) 
                         (list 1.51963 0.304868) 
                         (list 1.55175 0.307576) 
                         (list 1.58644 0.311326) 
                         (list 1.61214 0.317784) 
                         (list 1.64039 0.327993) 
                         (list 1.66225 0.349867) 
                         (list 1.6751 0.37695) 
                         (list 1.67766 0.389658) 
                         (list 1.67896 0.424449) 
                         (list 1.67766 0.496323) 
                         (list 1.67766 0.674862) 
                         (list 1.6751 0.68632) 
                         (list 1.66737 0.691528) 
                         (list 1.66352 0.694028) 
                         (list 1.60829 0.691528) 
                         (list 1.59414 0.697987) 
                         (list 1.59414 0.721111) 
                         (list 1.60444 0.722361) 
                         (list 1.77145 0.724861) 
                         (list 1.77531 0.713403) 
                         (list 1.77531 0.699237) 
                         (list 1.75604 0.692778) 
                         (list 1.73677 0.690278) 
                         (list 1.73033 0.679862) 
                         (list 1.72777 0.669654) 
                         (list 1.72648 0.656737) 
                         (list 1.73033 0.396117) 
                         (list 1.72648 0.371742) 
                         (list 1.71877 0.356326) 
                         (list 1.70721 0.336951) 
                         (list 1.69437 0.321743) 
                         (list 1.67637 0.311326) 
                         (list 1.64169 0.29716) 
                         (list 1.61214 0.286952) 
                         (list 1.58387 0.280493) 
                         (list 1.57231 0.277993) 
                         (list 1.40786 0.274035) 
                         (list 1.39244 0.276743) 
                         (list 1.35517 0.281743) 
                         (list 1.32177 0.288202) 
                         (list 1.28065 0.299868) 
                         (list 1.26009 0.311326) 
                         (list 1.24467 0.316534) 
                         (list 1.23311 0.327993) 
                         (list 1.2254 0.342159) 
                         (list 1.21642 0.358825) 
                         (list 1.20998 0.3832) 
                         (list 1.20613 0.419241) 
                         (list 1.20613 0.459032) 
                         (list 1.20613 0.679862) 
                         (list 1.20228 0.691528) 
                         (list 1.19586 0.692778) 
                         (list 1.12519 0.691528) 
                         (list 1.12263 0.701737) 
                         "c"
         )
        (command "pline" (list -0.0109544 0.224453) "w" 0 0 
                         (list 1.06876 0.693403) 
                         (list 1.07526 0.68382) 
                         (list 1.06876 0.677154) 
                         (list 0.778137 0.553822) 
                         (list 0.776512 0.540906) 
                         (list 0.40956 0.391533) 
                         (list 0.403081 0.375492) 
                         (list 0.00689946 0.20987) 
                         "c"
         )
        (command "pline" (list 0.0523779 0.169245) "w" 0 0 
                         (list 0.0328782 0.185495) 
                         (list 0.0296491 0.188828) 
                         (list 1.0574 0.630279) 
                         (list 1.07038 0.630279) 
                         (list 1.07526 0.620488) 
                         (list 0.820345 0.513406) 
                         (list 0.781387 0.500282) 
                         (list 0.781387 0.485698) 
                         (list 0.407956 0.334868) 
                         (list 0.407956 0.321743) 
                         "c"
         )
        (command "pline" (list 0.0848357 0.152995) "w" 0 0 
                         (list 1.04278 0.56528) 
                         (list 1.05415 0.566947) 
                         (list 1.06065 0.561947) 
                         (list 0.781387 0.440282) 
                         (list 0.783012 0.430491) 
                         (list 0.41606 0.27966) 
                         (list 0.417685 0.265077) 
                         (list 0.146543 0.14987) 
                         (list 0.153043 0.143412) 
                         (list 0.117314 0.138412) 
                         (list 0.10271 0.140079) 
                         "c"
         )
        (command "pline" (list 0.138418 0.120704) "w" 0 0 
                         (list 1.0363 0.501948) 
                         (list 1.04115 0.500282) 
                         (list 1.04603 0.49549) 
                         (list 1.04278 0.487365) 
                         (list 0.791116 0.383408) 
                         (list 0.787866 0.37695) 
                         (list 0.417685 0.221328) 
                         (list 0.41931 0.211536) 
                         (list 0.304041 0.157995) 
                         (list 0.278062 0.152995) 
                         (list 0.273187 0.148204) 
                         (list 0.287791 0.144871) 
                         (list 0.281312 0.138412) 
                         (list 0.260187 0.140079) 
                         (list 0.256958 0.140079) 
                         (list 0.200126 0.112579) 
                         (list 0.164397 0.104455) 
                         (list 0.141668 0.119038) 
                         "c"
         )
        (command "pline" (list 0.21148 0.0913297) "w" 0 0 
                         (list 1.00707 0.427366) 
                         (list 1.01032 0.420908) 
                         (list 1.01355 0.41445) 
                         (list 0.786241 0.321743) 
                         (list 0.783012 0.315284) 
                         (list 0.537828 0.211536) 
                         (list 0.41606 0.16112) 
                         (list 0.414435 0.154662) 
                         (list 0.414435 0.146537) 
                         (list 0.41931 0.140079) 
                         (list 0.386831 0.136746) 
                         (list 0.263437 0.0784133) 
                         (list 0.240708 0.0736217) 
                         (list 0.230979 0.0767466) 
                         "c"
         )
        (command "pline" (list 0.286166 0.0654968) "w" 0 0 
                         (list 0.940489 0.344659) 
                         (list 0.945364 0.349451) 
                         (list 0.961593 0.352576) 
                         (list 0.959988 0.342992) 
                         (list 0.955113 0.333201) 
                         (list 0.797616 0.268202) 
                         (list 0.792741 0.250494) 
                         (list 0.544328 0.148204) 
                         (list 0.539453 0.146537) 
                         (list 0.552453 0.140079) 
                         (list 0.513475 0.140079) 
                         (list 0.440413 0.110913) 
                         (list 0.427434 0.109246) 
                         (list 0.422559 0.097788) 
                         (list 0.420934 0.0865382) 
                         (list 0.352748 0.057372) 
                         (list 0.321894 0.057372) 
                         "c"
         )
        (command "pline" (list 0.411185 0.0557053) "w" 0 0 
                         (list 0.425809 0.0669551) 
                         (list 0.883677 0.261744) 
                         (list 0.888531 0.255285) 
                         (list 0.882052 0.247161) 
                         (list 0.826845 0.224453) 
                         (list 0.797616 0.211536) 
                         (list 0.795991 0.198411) 
                         (list 0.685576 0.154662) 
                         (list 0.674222 0.156329) 
                         (list 0.675847 0.148204) 
                         (list 0.688826 0.143412) 
                         (list 0.653118 0.140079) 
                         (list 0.450163 0.0540387) 
                         "c"
         )
        (command "pline" (list 0.328394 0.4132) "w" 0 0 
                         (list 1.42271 0.875692) 
                         (list 1.40486 0.891942) 
                         (list 1.387 0.900067) 
                         (list 0.982717 0.724861) 
                         (list 0.994071 0.716736) 
                         (list 0.630389 0.560906) 
                         (list 0.61089 0.546322) 
                         (list 0.320269 0.419658) 
                         "c"
         )
        (command "pline" (list 0.323519 0.473199) "w" 0 0 
                         (list 0.344623 0.47174) 
                         (list 1.36913 0.917983) 
                         (list 1.3529 0.929233) 
                         (list 1.32692 0.9309) 
                         (list 0.984342 0.78486) 
                         (list 0.992446 0.771944) 
                         (list 0.61739 0.619446) 
                         (list 0.609286 0.609655) 
                         (list 0.589786 0.598197) 
                         (list 0.325144 0.48299) 
                         "c"
         )
        (command "pline" (list 0.339748 0.536531) "w" 0 0 
                         (list 1.3188 0.953608) 
                         (list 1.30419 0.968191) 
                         (list 1.27984 0.969857) 
                         (list 1.26684 0.966732) 
                         (list 1.0022 0.848193) 
                         (list 0.989196 0.840068) 
                         (list 0.982717 0.825485) 
                         (list 0.61739 0.674445) 
                         (list 0.612515 0.664862) 
                         (list 0.333248 0.546322) 
                         "c"
         )
        (command "pline" (list 0.354373 0.606322) "w" 0 0 
                         (list 0.375477 0.606322) 
                         (list 0.399831 0.61278) 
                         (list 1.26036 0.990899) 
                         (list 1.23438 0.999024) 
                         (list 1.21003 0.999024) 
                         (list 0.979467 0.900067) 
                         (list 0.979467 0.88715) 
                         (list 0.609286 0.732986) 
                         (list 0.602786 0.724861) 
                         (list 0.583307 0.713403) 
                         (list 0.349498 0.611321) 
                         "c"
         )
        (command "pline" (list 0.386831 0.679445) "w" 0 0 
                         (list 0.414435 0.685904) 
                         (list 1.1954 1.01861) 
                         (list 1.16942 1.02673) 
                         (list 1.13857 1.02986) 
                         (list 1.13046 1.0284) 
                         (list 0.984342 0.963399) 
                         (list 0.974592 0.940691) 
                         (list 0.607661 0.789652) 
                         (list 0.570307 0.766944) 
                         (list 0.391706 0.690695) 
                         (list 0.383581 0.68257) 
                         "c"
         )
        (command "pline" (list 0.438788 0.760486) "w" 0 0 
                         (list 0.451788 0.758819) 
                         (list 1.10774 1.03798) 
                         (list 1.07851 1.04611) 
                         (list 1.04115 1.04444) 
                         (list 0.971342 1.01215) 
                         (list 0.976217 1.00548) 
                         (list 0.609286 0.852984) 
                         (list 0.607661 0.840068) 
                         (list 0.438788 0.766944) 
                         "c"
         )
        (command "pline" (list 0.523225 0.857984) "w" 0 0 
                         (list 0.529724 0.852984) 
                         (list 0.552453 0.861109) 
                         (list 1.00057 1.04944) 
                         (list 0.979467 1.05423) 
                         (list 0.956738 1.05423) 
                         (list 0.596286 0.9034) 
                         (list 0.594661 0.891942) 
                         (list 0.519975 0.861109) 
                         "c"
         )
        (command "pline" (list 4.06238 0.321743) "w" 0 0 
                         (list 4.05211 0.319034) 
                         (list 4.05338 0.298618) 
                         (list 4.06623 0.29591) 
                         (list 4.39258 0.29591) 
                         (list 4.40156 0.301118) 
                         (list 4.40156 0.321743) 
                         (list 4.38487 0.324243) 
                         (list 4.31162 0.324243) 
                         (list 4.30777 0.704237) 
                         (list 4.38358 0.702987) 
                         (list 4.39643 0.710695) 
                         (list 4.3977 0.727361) 
                         (list 4.39258 0.732569) 
                         (list 4.38102 0.735069) 
                         (list 4.11633 0.733819) 
                         (list 3.99942 0.496323) 
                         (list 3.99427 0.492365) 
                         (list 3.8735 0.732569) 
                         (list 3.58443 0.73132) 
                         (list 3.58186 0.706945) 
                         (list 3.59343 0.701737) 
                         (list 3.67051 0.701737) 
                         (list 3.6718 0.347367) 
                         (list 3.66922 0.335701) 
                         (list 3.6628 0.322993) 
                         (list 3.64353 0.320284) 
                         (list 3.62426 0.316534) 
                         (list 3.62426 0.301118) 
                         (list 3.62682 0.29591) 
                         (list 3.80028 0.29341) 
                         (list 3.80669 0.298618) 
                         (list 3.80669 0.312576) 
                         (list 3.80157 0.320284) 
                         (list 3.72961 0.321743) 
                         (list 3.7219 0.333201) 
                         (list 3.71676 0.346117) 
                         (list 3.7129 0.68257) 
                         (list 3.71676 0.68132) 
                         (list 3.89536 0.307576) 
                         (list 3.90563 0.29591) 
                         (list 3.94546 0.29716) 
                         (list 4.1279 0.676112) 
                         (list 4.13433 0.68632) 
                         (list 4.13946 0.672154) 
                         (list 4.14075 0.327993) 
                         (list 4.13946 0.322993) 
                         (list 4.07138 0.321743) 
                         "c"
         )
        (command "pline" (list 1.8087 0.723611) "w" 0 0 
                         (list 1.81 0.697987) 
                         (list 1.83697 0.696528) 
                         (list 1.85112 0.694028) 
                         (list 1.85239 0.317784) 
                         (list 1.84854 0.312576) 
                         (list 1.77402 0.312576) 
                         (list 1.77145 0.307576) 
                         (list 1.77145 0.29091) 
                         (list 1.77787 0.286952) 
                         (list 1.78687 0.284452) 
                         (list 2.11707 0.285702) 
                         (list 2.12478 0.29091) 
                         (list 2.12605 0.308826) 
                         (list 2.11834 0.316534) 
                         (list 2.0297 0.317784) 
                         (list 2.02841 0.46549) 
                         (list 2.03099 0.479657) 
                         (list 2.03485 0.484657) 
                         (list 2.04768 0.484657) 
                         (list 2.06439 0.486115) 
                         (list 2.07853 0.486115) 
                         (list 2.13376 0.487365) 
                         (list 2.17745 0.488615) 
                         (list 2.22499 0.487365) 
                         (list 2.25326 0.493823) 
                         (list 2.29822 0.501532) 
                         (list 2.33292 0.51424) 
                         (list 2.36761 0.534864) 
                         (list 2.38815 0.555281) 
                         (list 2.4023 0.578405) 
                         (list 2.40359 0.593822) 
                         (list 2.40615 0.615696) 
                         (list 2.39844 0.638821) 
                         (list 2.38944 0.658196) 
                         (list 2.37532 0.676112) 
                         (list 2.34576 0.691528) 
                         (list 2.32007 0.704237) 
                         (list 2.28924 0.710695) 
                         (list 2.25582 0.714653) 
                         (list 2.24005 0.715695) 
                         (list 2.02585 0.695278) 
                         (list 2.08239 0.696528) 
                         (list 2.11449 0.699237) 
                         (list 2.15432 0.696528) 
                         (list 2.18389 0.68632) 
                         (list 2.19801 0.669654) 
                         (list 2.20701 0.649029) 
                         (list 2.21086 0.625905) 
                         (list 2.20957 0.59778) 
                         (list 2.21214 0.574655) 
                         (list 2.20701 0.554031) 
                         (list 2.20701 0.549031) 
                         (list 2.19286 0.524448) 
                         (list 2.17745 0.51674) 
                         (list 2.16718 0.51424) 
                         (list 2.13634 0.51424) 
                         (list 2.0297 0.51424) 
                         (list 2.0297 0.518198) 
                         (list 2.02585 0.695278) 
                         (list 2.24005 0.715695) 
                         (list 2.21599 0.717153) 
                         (list 2.18003 0.722361) 
                         (list 2.13762 0.723611) 
                         (list 2.09266 0.726111) 
                         "c"
         )
        (command "pline" (list 3.59213 0.288202) "w" 0 0 
                         (list 3.59855 0.301118) 
                         (list 3.59343 0.317784) 
                         (list 3.56001 0.322993) 
                         (list 3.55103 0.338409) 
                         (list 3.55103 0.367784) 
                         (list 3.54718 0.390908) 
                         (list 3.54203 0.420491) 
                         (list 3.53432 0.444866) 
                         (list 3.51505 0.46674) 
                         (list 3.49449 0.480907) 
                         (list 3.46109 0.498823) 
                         (list 3.42768 0.506531) 
                         (list 3.41226 0.51174) 
                         (list 3.37757 0.51424) 
                         (list 3.35445 0.518198) 
                         (list 3.3506 0.519448) 
                         (list 3.37116 0.521948) 
                         (list 3.39941 0.524448) 
                         (list 3.43924 0.529656) 
                         (list 3.47266 0.537364) 
                         (list 3.5112 0.550281) 
                         (list 3.54459 0.572155) 
                         (list 3.56001 0.592572) 
                         (list 3.57543 0.631113) 
                         (list 3.56901 0.658196) 
                         (list 3.54974 0.679862) 
                         (list 3.52532 0.695278) 
                         (list 3.52366 0.696112) 
                         (list 3.37578 0.623196) 
                         (list 3.37655 0.578405) 
                         (list 3.37141 0.562989) 
                         (list 3.36626 0.556739) 
                         (list 3.35214 0.543823) 
                         (list 3.33928 0.541323) 
                         (list 3.32516 0.538614) 
                         (list 3.29047 0.537364) 
                         (list 3.20695 0.539864) 
                         (list 3.19924 0.546322) 
                         (list 3.20181 0.696528) 
                         (list 3.20695 0.700487) 
                         (list 3.32258 0.700487) 
                         (list 3.34443 0.697987) 
                         (list 3.35726 0.690278) 
                         (list 3.3637 0.68132) 
                         (list 3.36755 0.669654) 
                         (list 3.37141 0.661946) 
                         (list 3.37526 0.654237) 
                         (list 3.37578 0.623196) 
                         (list 3.52366 0.696112) 
                         (list 3.48678 0.710695) 
                         (list 3.47522 0.714653) 
                         (list 3.41097 0.722361) 
                         (list 3.38143 0.722361) 
                         (list 3.32874 0.727361) 
                         (list 3.23495 0.73007) 
                         (list 2.96 0.727361) 
                         (list 2.94973 0.726111) 
                         (list 2.94844 0.702987) 
                         (list 2.96 0.700487) 
                         (list 3.02425 0.699237) 
                         (list 3.0281 0.317784) 
                         (list 2.96385 0.319034) 
                         (list 2.96514 0.38195) 
                         (list 2.96514 0.398616) 
                         (list 2.97029 0.401325) 
                         (list 2.96771 0.437158) 
                         (list 2.95873 0.439866) 
                         (list 2.93302 0.441116) 
                         (list 2.92019 0.409033) 
                         (list 2.90477 0.3807) 
                         (list 2.87906 0.355076) 
                         (list 2.85979 0.338409) 
                         (list 2.84308 0.331951) 
                         (list 2.81354 0.325493) 
                         (list 2.78398 0.315284) 
                         (list 2.72617 0.315284) 
                         (list 2.62107 0.316534) 
                         (list 2.61465 0.324243) 
                         (list 2.61336 0.502781) 
                         (list 2.64034 0.496323) 
                         (list 2.6699 0.491115) 
                         (list 2.70329 0.484657) 
                         (list 2.73286 0.474449) 
                         (list 2.74313 0.459032) 
                         (list 2.75083 0.443616) 
                         (list 2.75213 0.417991) 
                         (list 2.75854 0.414033) 
                         (list 2.79196 0.412783) 
                         (list 2.79452 0.417991) 
                         (list 2.79323 0.606738) 
                         (list 2.78681 0.609238) 
                         (list 2.75598 0.607988) 
                         (list 2.74956 0.604238) 
                         (list 2.74698 0.587572) 
                         (list 2.74442 0.574655) 
                         (list 2.73927 0.560489) 
                         (list 2.72644 0.552781) 
                         (list 2.71229 0.541323) 
                         (list 2.70588 0.536114) 
                         (list 2.6789 0.533614) 
                         (list 2.6609 0.532156) 
                         (list 2.61465 0.532156) 
                         (list 2.61465 0.700487) 
                         (list 2.67761 0.701737) 
                         (list 2.71229 0.699237) 
                         (list 2.76369 0.699237) 
                         (list 2.78938 0.694028) 
                         (list 2.81252 0.68882) 
                         (list 2.8305 0.68132) 
                         (list 2.84721 0.667154) 
                         (list 2.86648 0.645279) 
                         (list 2.87931 0.632363) 
                         (list 2.89217 0.615696) 
                         (list 2.90373 0.607988) 
                         (list 2.92044 0.605488) 
                         (list 2.93714 0.607988) 
                         (list 2.93714 0.628613) 
                         (list 2.93714 0.727361) 
                         (list 2.37053 0.726111) 
                         (list 2.36797 0.719653) 
                         (list 2.36926 0.704237) 
                         (list 2.37438 0.696528) 
                         (list 2.43863 0.696528) 
                         (list 2.43863 0.319034) 
                         (list 2.36155 0.316534) 
                         (list 2.35897 0.307576) 
                         (list 2.3577 0.29216) 
                         (list 2.36797 0.289452) 
                         (list 3.29174 0.29216) 
                         (list 3.2956 0.29716) 
                         (list 3.29433 0.315284) 
                         (list 3.29047 0.319034) 
                         (list 3.20695 0.320284) 
                         (list 3.2031 0.506531) 
                         (list 3.20695 0.51049) 
                         (list 3.2532 0.507781) 
                         (list 3.27889 0.505281) 
                         (list 3.29818 0.498823) 
                         (list 3.31872 0.488615) 
                         (list 3.33028 0.478407) 
                         (list 3.34185 0.457782) 
                         (list 3.34828 0.446116) 
                         (list 3.35085 0.425699) 
                         (list 3.3547 0.396117) 
                         (list 3.35599 0.371742) 
                         (list 3.36499 0.339659) 
                         (list 3.37912 0.325493) 
                         (list 3.39968 0.308826) 
                         (list 3.42922 0.29591) 
                         (list 3.46391 0.286952) 
                         (list 3.48318 0.283202) 
                         (list 3.59111 0.285702) 
                         "c"
         )
        (setq ins_pnt (trans (list 7.5 0.3) 1 0))		 
        (command "style" "ht" "simhei.ttf" "" "" "" "" "" "")
   	(setq c_date (rtos (getvar "CDATE")))
	(setq c_date (strcat (substr c_date 1 4) "/" (substr c_date 5 2) "/" (substr c_date 7 2)))
   	(setq txt_dt (list (cons 0 "TEXT") (cons 1 c_date) (cons 10 ins_pnt) (cons 72 1) (cons 40 0.4367) (cons 7 "standard")))
	(entmake txt_dt)
        (setq wz (ssget "x" (list (cons 8 "tmp"))))
        (command "scale" wz "" "0,0" high)
        (command "layer" "m" "f" "")
        (command "change" wz "" "P" "la" "f" "")
        (command "ucs" "o" in_point2)
        (command "purge" "all" "" "n")
        (reset_var var_list)
   )
   (prompt "\输入logo运行")