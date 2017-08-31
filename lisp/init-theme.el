(use-package color-theme
  :config
  (use-package color-theme-solarized
    :ensure t
    :init
    :config
    (set-terminal-parameter nil 'background-mode 'dark)
    (if (daemonp)
	(add-hook 'after-make-frame-functions
		  (lambda (frame)
		    (set-terminal-parameter nil 'background-mode 'dark)
		    (load-theme 'solarized t)))
      (load-theme 'solarized t))
    )
  )


(provide 'init-theme)
