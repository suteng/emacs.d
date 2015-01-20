(require-package 'company)

(add-hook 'after-init-hook 'global-company-mode)

;; for dark background color
;(require 'color)
;(let ((bg (face-attribute 'default :background)))
  ;(custom-set-faces
   ;`(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   ;`(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   ;`(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   ;`(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   ;`(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

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

;; (global-set-key [tab] 'tab-indent-or-complete)

(setq company-idle-delay nil)
(setq company-minimum-prefix-length 1)
(setq company-show-numbers nil)
(setq company-tooltip-limit 20)

(setq company-dabbrev-downcase nil)
(setq company-dabbrev-ignore-case nil)
(setq company-tooltip-align-annotations t)
(setq company-require-match 'never)

(provide 'init-company-mode)
