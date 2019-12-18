(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

;; set environment path 
(if (string-equal system-type "windows-nt")
    (progn
      (princ "set windows environment"))
  (setq exec-path (append exec-path '("/usr/local/bin"))))

(provide 'init-common)
