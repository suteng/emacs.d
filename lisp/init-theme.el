(use-package color-theme
  :config
  (use-package color-theme-solarized
    :ensure t
    :init
    :config
    (if (daemonp)
	(add-hook 'after-make-frame-functions
		  (lambda (frame)
		    (select-frame frame)
		    (if (display-graphic-p frame)
			((set-frame-parameter nil 'background-mode 'dark)
			 (load-theme 'solarized t))
		      ((set-terminal-parameter nil 'background-mode 'dark)
		       (load-theme 'solarized t)))))
      (set-frame-parameter nil 'background-mode 'dark)
      (load-theme 'solarized t)
      )

    ;; (set-frame-parameter nil 'background-mode 'light)
    ;; (set-terminal-parameter nil 'background-mode 'dark)
    ;; (if (daemonp)
    ;; 	(add-hook 'after-make-frame-functions
    ;; 		  (lambda (frame)
    ;; 		    (set-terminal-parameter nil 'background-mode 'dark)
    ;; 		    (load-theme 'solarized t)))
    ;;   (load-theme 'solarized t))
    )
  )

(provide 'init-theme)
