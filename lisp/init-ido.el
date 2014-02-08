;; Use C-f during file selection to switch to regular find-file
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)

(when (eval-when-compile (>= emacs-major-version 24))
 (require-package 'ido-ubiquitous)
 (ido-ubiquitous-mode t))

(require-package 'flx-ido)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
;;(setq flx-ido-use-faces nil)

;; Use smex to handle M-x
(require-package 'smex)
(global-set-key [remap execute-extended-command] 'smex)


;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)


(provide 'init-ido)
