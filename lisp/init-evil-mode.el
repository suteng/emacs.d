
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

;; (use-package evil-search-highlight-persist
;;   :ensure t
;;   :init
;;   :config
;;   (global-evil-search-highlight-persist t)
;;   )

(use-package evil-nerd-commenter
  :ensure t
  :init
  :config
  (evil-leader/set-key
    "cc" 'evilnc-comment-or-uncomment-lines
    "cp" 'evilnc-comment-or-uncomment-paragraphs
    "cr" 'comment-or-uncomment-region
    )
  )

(provide 'init-evil-mode)
