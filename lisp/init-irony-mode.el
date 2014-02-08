(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/irony-mode/elisp/"))

(require 'auto-complete)
(require 'yasnippet)
(require 'irony) ;Note: hit `C-c C-b' to open build menu

;; the ac plugin will be activated in each buffer using irony-mode
(irony-enable 'ac)             ; hit C-RET to trigger completion

(defun my-c++-hooks ()
  "Enable the hooks in the preferred order: 'yas -> auto-complete -> irony'."
  ;; if yas is not set before (auto-complete-mode 1), overlays may persist after
  ;; an expansion.
  (yas/minor-mode-on)
  (auto-complete-mode 1)

  ;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode
  (when (member major-mode irony-known-modes)
    (irony-mode 1)))

(add-hook 'c++-mode-hook 'my-c++-hooks)
(add-hook 'c-mode-hook 'my-c++-hooks)

(provide 'init-irony-mode)
