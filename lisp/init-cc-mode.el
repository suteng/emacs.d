(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode)) ;CUDA

(use-package find-file
  :defer t
  :init (setq-default ff-always-in-other-window t))

(use-package cc-mode
  :bind (:map c-mode-base-map
              ("C-c t" . ff-find-other-file)))

(use-package google-c-style
  :defer t
  :init
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
  :config
  )

(use-package clang-format
  :defer t
  :init
  :after cc-mode
  :config
  (global-set-key [C-M-tab] 'clang-format-region)
  )

(use-package rtags
  :defer t
  :init
  :after
  :config
  (setq rtags-autostart-diagnostics t)
  (rtags-enable-standard-keybindings)
  (evil-leader/set-key
   "rj" 'rtags-find-symbol-at-point
   "rf" 'rtags-find-references-at-point
   "rv" 'rtags-find-virtuals-at-point
   "ri" 'rtags-symbol-info
   "rn" 'rtags-next-match
   "rN" 'rtags-previous-match
   "rb" 'rtags-location-stack-back)
  )

(use-package company-rtags
  :defer t
  :init
  (eval-after-load 'company
    '(add-to-list
      'company-backends 'company-rtags))
  :config
  )

(use-package irony
  :commands irony-install-server

  ;; standard irony configuration
  :bind (:map irony-mode-map
              ("C-c C-b" . irony-cdb-menu)
              ("C-c =" . irony-get-type))
  :after cc-mode
  :preface
  (defun sarcasm-irony-cdb-not-found (command &rest args)
    (when (eq command 'get-compile-options)
      (message "Irony: compile options not found!")
      nil))
  (defvar irony-server-w32-pipe-buffer-size)
  :init
  (setq-default irony-cdb-compilation-databases '(irony-cdb-clang-complete
                                                  irony-cdb-libclang
                                                  sarcasm-irony-cdb-not-found))
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  ;; Windows performance tweaks
  ;;
  (when (boundp 'w32-pipe-read-delay)
    (setq w32-pipe-read-delay 0))
  ;; Set the buffer size to 64K on Windows (from the original 4K)
  (when (boundp 'w32-pipe-buffer-size)
    (setq irony-server-w32-pipe-buffer-size (* 64 1024)))

  (use-package company-irony
    :after company
    :config
    (add-to-list 'company-backends 'company-irony)
    (use-package company-c-headers
      :ensure t
      :functions irony--extract-user-search-paths company-c-headers
      :preface
      (defun company-c-headers-path-user-irony ()
        "Return the user include paths for the current buffer."
        (when irony-mode
          (irony--extract-user-search-paths irony--compile-options
                                            irony--working-directory)))
      :config
      (setq company-c-headers-path-user #'company-c-headers-path-user-irony)
      (add-to-list 'company-backends #'company-c-headers)))

  (use-package flycheck-irony
    :config (add-hook 'irony-mode-hook 'flycheck-irony-setup))

  (use-package flycheck-clang-analyzer
    :after flycheck-irony
    :config (add-hook 'irony-mode-hook 'flycheck-clang-analyzer-setup)))


  (provide 'init-cc-mode)
