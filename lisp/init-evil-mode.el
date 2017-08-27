
(use-package evil
  :ensure t
  :init
  :config
  (evil-mode 1)

  )

(use-package evil-leader
  :ensure t
  :init
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
   "e" 'find-file
   "b" 'switch-to-buffer
   "k" 'kill-buffer)
  )
(provide 'init-evil-mode)
