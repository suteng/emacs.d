(require-package 'company)

(add-hook 'after-init-hook 'global-company-mode)

;; it seams company mode and yasnippet confilct is resolved
;; (defun check-expansion ()
;;   (save-excursion
;;     (if (looking-at "\\_>") t
;;       (backward-char 1)
;;       (if (looking-at "\\.") t
;;         (backward-char 1)
;;         (if (looking-at "->") t nil)))))

;; (defun do-yas-expand ()
;;   (let ((yas/fallback-behavior 'return-nil))
;;     (yas/expand)))

;; (defun tab-indent-or-complete ()
;;   (interactive)
;;   (if (minibufferp)
;;       (minibuffer-complete)
;;     (if (or (not yas/minor-mode)
;;             (null (do-yas-expand)))
;;         (if (check-expansion)
;;             (company-complete-common)
;;           (indent-for-tab-command)))))

;;(global-set-key [tab] 'tab-indent-or-complete)
(global-set-key (kbd "M-RET") 'company-complete)

(setq company-selection-wrap-around t)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay 0.2)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

;; (setq company-idle-delay nil)
;; (setq company-minimum-prefix-length 1)
;; (setq company-show-numbers nil)
;; (setq company-tooltip-limit 20)

;; (setq company-dabbrev-downcase nil)
;; (setq company-dabbrev-ignore-case nil)
;; (setq company-tooltip-align-annotations t)
(setq company-require-match 'never)

(custom-set-faces
  '(company-preview
       ((t (:foreground "darkgray" :underline t))))
   '(company-preview-common
        ((t (:inherit company-preview))))
    '(company-tooltip
         ((t (:background "lightgray" :foreground "black"))))
     '(company-tooltip-selection
          ((t (:background "steelblue" :foreground "white"))))
      '(company-tooltip-common
           ((((type x)) (:inherit company-tooltip :weight bold))
                (t (:inherit company-tooltip))))
       '(company-tooltip-common-selection
            ((((type x)) (:inherit company-tooltip-selection :weight bold))
                 (t (:inherit company-tooltip-selection)))))

(provide 'init-company-mode)
