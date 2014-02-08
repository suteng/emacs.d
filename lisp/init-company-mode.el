(require-package 'company)

(add-hook 'after-init-hook 'global-company-mode)

;;(setq company-clang-arguments '("-I/example1/dir" "-I/example2/dir"))

(setq company-clang-arguments
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
 ~/Downloads/threadpool-0_2_5-src/threadpool-0_2_5-src/threadpool/boost
"
               )))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(global-set-key [tab] 'tab-indent-or-complete)

(provide 'init-company-mode)
