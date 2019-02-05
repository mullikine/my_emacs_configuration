(require 'cl)
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; Use my init file in org-mode to set other packages
;;(org-babel-load-file (expand-file-name "~/.emacs.d/myinit_for_windows.org"))
(cond
 ((string-equal system-type "windows-nt")
  (progn
    (org-babel-load-file (expand-file-name "~/.emacs.d/myinit_for_windows.org"))))
 ((string-equal system-type "darwin")
  (progn
    (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))))
 ((string-equal system-type "gnu/linux")
  (progn
    (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (indent-guide exec-path-from-shell use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
