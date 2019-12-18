;; (require 'cl)
(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(("gnu-qinghua"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa-qinghua" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org-qinghua"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

(setq my-emacs-root-directory "~/.emacs.d/")
(add-to-list 'load-path (expand-file-name "lisp" my-emacs-root-directory))
(require 'init-benchmarking) ;; Measure startup time


(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'init-theme)
(require 'init-common)
(require 'init-swiper-ivy-counsel)
(require 'init-parentheses)
;; Use my init file in org-mode to set other packages
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
