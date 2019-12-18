;; ----------------------------
;; set minial UI 
;; ----------------------------
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

;; ----------------------------
;; set environment path 
;; ----------------------------
(if (string-equal system-type "windows-nt")
    (progn
      (princ "set windows environment"))
  (setq exec-path (append exec-path '("/usr/local/bin"))))

;; ----------------------------
;; set font 
;; ----------------------------
(cond
 ((string-equal system-type "windows-nt")
  (set-default-font "Consolas 12"))
 ((string-equal system-type "gnu/linux")
  (set-default-font "Ubuntu Mono 12"))
 ((string-equal system-type "darwin")
  (if (member "Source Code Pro" (font-family-list))
      (set-default-font "Source Code Pro 12")
    (set-default-font "Menlo 11"))))

;; ----------------------------
;; mode line 
;; ----------------------------
(use-package powerline
  :ensure t
  :config
  (progn
    (powerline-default-theme)))

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

;; ----------------------------
;; alight commands
;; ----------------------------
(add-hook 'align-load-hook #'(lambda ()
                               (add-to-list 'align-rules-list
                                            '(text-column-whitespace
                                              (regexp  . "\\(^\\|\\S-\\)\\([ \t]+\\)")
                                              (group   . 2)
                                              (modes   . align-text-modes)
                                              (repeat  . t)))))
;; ----------------------------
;; adjust meta key for Mac OS X
;; ----------------------------
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;; -------------------
;; set key-bindings 
;; -------------------
;; use cmd + n and cmd + p to select next and previous lines
(global-set-key (kbd "s-n") (kbd "C-S-n"))
(global-set-key (kbd "s-p") (kbd "C-S-p"))
;; use c-z to undo
(global-set-key (kbd "C-z") #'undo)

;; do code comment 
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)

;; use c-c c-c to execute a lisp function
(global-set-key (kbd "C-c C-c") 'eval-last-sexp)

;; keyboard macro
(global-set-key (kbd "<f2>") #'kmacro-start-macro)
(global-set-key (kbd "<f3>") #'kmacro-end-macro)
(global-set-key (kbd "<f4>") 'call-last-kbd-macro)


;; use f10 to format whole buffer
(global-set-key (kbd "<f10>") (progn
				#'mark-whole-buffer
				#'indent-region))
;; (global-set-key (kbd "<f6>") 'revert-buffer)

;; --------------------
;; set buffer and shell 
;; ---------------------
(use-package exec-path-from-shell
  :defer 2
  :ensure t
  :config
  (progn
    (when (memq window-system '(mac ns x))
      (exec-path-from-shell-initialize))))


;; ------------------
;; set line number
;; ------------------
(use-package nlinum
  :defer t
  :ensure t
  :config
  (progn
    (global-nlinum-mode t)
    ;; Preset `nlinum-format' for minimum width.
    (defun my-nlinum-mode-hook ()
      (when nlinum-mode
        (setq-local nlinum-format
                    (concat "%" (number-to-string
                                 ;; Guesstimate number of buffer lines.
                                 (ceiling (log (max 1 (/ (buffer-size) 80)) 10)))
                            "d"))))
    (add-hook 'nlinum-mode-hook #'my-nlinum-mode-hook)

    ;; [[https://www.emacswiki.org/emacs/LineNumbers][solve bug with emacs daemon mode]]
    (defun initialize-nlinum (&optional frame)
      (require 'nlinum)
      (add-hook 'prog-mode-hook 'nlinum-mode))
    (when (daemonp)
      (add-hook 'window-setup-hook 'initialize-nlinum)
      (defadvice make-frame (around toggle-nlinum-mode compile activate)
        (nlinum-mode -1) ad-do-it (nlinum-mode 1)))))

(add-hook 'after-init-hook 'nlinum-mode)


;; ----------------------------
;; use y-or-n
;; ----------------------------
(fset 'yes-or-no-p 'y-or-n-p)


;; ----------------------------
;; set adaptive-wrap
;; ----------------------------
(use-package adaptive-wrap
  :defer 1
  :ensure t
  :config
  (progn
    ;; (setq-default adaptive-wrap-extra-indent 2)
    (global-visual-line-mode t)
    (add-hook 'visual-line-mode-hook #'adaptive-wrap-prefix-mode)))

;; ----------------------------
;; set scroll screen 
;; ----------------------------
(setq scroll-step 1)
(setq scroll-margin 1)
(setq scroll-conservatively 100000)


(provide 'init-common)
