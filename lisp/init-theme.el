;; (defun my-customize-for-theme ()
;;   ;; M-x customize-face
;;   ;; show-paren-match to view different options #D4FF00
;;   (set-face-attribute 'show-paren-match nil
;;                       :underline t
;;                       :foreground "HotPink"
;;                       :background nil
;;                       :weight 'ultrabold)

;;   (set-face-attribute 'hl-line nil
;;                       :underline nil
;;                       :foreground 'unspecified
;;                       :background "#3e4446")
;;   (set-face-attribute 'highlight nil :background "#3e4446" :foreground 'unspecified)

;;   ;; specify the selection region
;;   (set-face-attribute 'region nil :background "#666")

;;   (set-cursor-color "#D4FF00") 
;;   (setq-default cursor-type '(bar . 2)))

;; (load-theme 'wombat)
;; (add-hook 'after-init-hook 'my-customize-for-theme)


(use-package doom-themes
  :init
  (setq doom-themes-enable-bold nil    
        doom-themes-enable-italic nil)
  :ensure t
  :config
  (progn
    (load-theme 'doom-vibrant t)
    (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
    ;; (doom-themes-treemacs-config)
    ;; Corrects (and improves) org-mode's native fontification.
    ;; (doom-themes-org-config)
    (set-cursor-color "HotPink") 
    (setq-default cursor-type '(bar . 2))))

;; (use-package all-the-icons
;;   :ensure t
;;   :config
;;   (progn
;;     (all-the-icons-install-fonts :name "hyperion_z@outlook.com")))

(provide 'init-theme)
