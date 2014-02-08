(require-package 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; Exclude very large buffers from dabbrev
(defun sanityinc/dabbrev-friend-buffer (other-buffer)
  (< (buffer-size other-buffer) (* 1 1024 1024)))

(setq dabbrev-friend-buffer-function 'sanityinc/dabbrev-friend-buffer)


(provide 'init-auto-complete)
