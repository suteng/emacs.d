(use-package exec-path-from-shell
 :ensure t
 :config
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
 )



(provide 'init-exec-path)
