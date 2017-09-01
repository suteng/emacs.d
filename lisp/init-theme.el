(use-package color-theme
  :config
  (use-package color-theme-solarized
    :ensure t
    :init
    :config
    (add-hook 'after-make-frame-functions
	      (lambda (frame)
		(let ((mode (if (display-graphic-p frame) 'light 'dark)))
		  (set-frame-parameter frame 'background-mode mode)
		  (set-terminal-parameter frame 'background-mode mode))
		(load-theme 'solarized t)))

    )
  )

(provide 'init-theme)
