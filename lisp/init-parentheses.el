;; ---------------------------
;; paredit
;; ---------------------------
(use-package paredit
  :defer 1
  :ensure t
  :init
  (progn
    (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
    
    ;; paredit with electric return
    (defvar electrify-return-match
      "[\]}\)\"]"
      "If this regexp matches the text after the cursor, do an \"electric\"
        return.")
    (defun electrify-return-if-match (arg)
      "If the text after the cursor matches `electrify-return-match' then
        open and indent an empty line between the cursor and the text.  Move the
        cursor to the new line."
      (interactive "P")
      (let ((case-fold-search nil))
        (if (looking-at electrify-return-match)
            (save-excursion (newline-and-indent)))
        (newline arg)
        (indent-according-to-mode)))
    ;; Using local-set-key in a mode-hook is a better idea.
    (global-set-key (kbd "RET") 'electrify-return-if-match)))



;; ---------------------------
;; complements to paredit
;; ---------------------------
;; Show matching arenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)
(require 'paren)
;; (set-face-background 'show-paren-match (face-background 'default))


;; ---------------------------
;; smartparens
;; ---------------------------
(use-package smartparens
  :defer
  :ensure t
  :config
  (progn
    (add-hook 'js-mode-hook #'smartparens-mode)
    (add-hook 'typescript-mode-hook #'smartparens)
    (add-hook 'c-mode-hook #'smartparens-mode)
    (add-hook 'c++-mode-hook #'smartparens-mode)
    (add-hook 'web-mode-hook #'smartparens-mode)
    (add-hook 'shell-script-mode 'smartparens-mode)))


(provide 'init-parentheses)
