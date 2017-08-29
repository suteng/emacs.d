;;----------------------------------------------------------------------------
;; Suppress GUI features
;;----------------------------------------------------------------------------
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;;----------------------------------------------------------------------------
;; Window size and features
;;----------------------------------------------------------------------------
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

(use-package color-theme-solarized
  :ensure t
  :init
  (require 'color-theme)
  :config
  (add-hook 'after-make-frame-functions
  	    (lambda (frame)
  	      (let ((mode (if (display-graphic-p frame) 'light 'dark)))
  		(set-frame-parameter frame 'background-mode mode)
  		(set-terminal-parameter frame 'background-mode mode))
  	      (enable-theme 'solarized)))
  )

(provide 'init-gui-frames)
