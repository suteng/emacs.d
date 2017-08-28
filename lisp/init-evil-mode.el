
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
   "w" 'save-buffer
   "q" 'quit-window
   "k" 'kill-buffer)
  )


(use-package evil-matchit
  :ensure t
  :init
  :config
  (global-evil-matchit-mode 1)
  )

(use-package evil-smartparens
  :ensure t
  :init
  :config
  (add-hook 'cc-mode-hook #'evil-smartparens-mode)
  )
(provide 'init-evil-mode)
