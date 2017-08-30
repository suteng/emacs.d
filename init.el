(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
;(let ((normal-gc-cons-threshold (* 20 1024 1024))
      ;(init-gc-cons-threshold (* 128 1024 1024)))
  ;(setq gc-cons-threshold init-gc-cons-threshold)
  ;(add-hook 'after-init-hook
            ;(lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))
(let ((old-threshold gc-cons-threshold))
  (setq gc-cons-threshold 100000000)
  (run-with-idle-timer 1 nil (lambda ()
                               ;; restore the default GC threshold
                               (setq gc-cons-threshold old-threshold))))
;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-editing-utils)
(require 'init-ibuffer)
(require 'init-flycheck)
(require 'init-evil-mode)
(require 'init-snippet)
(require 'init-completion)
(require 'init-cc-mode)
(require 'init-pb-mode)
(require 'init-python-mode)
(require 'init-git)
(require 'init-tools)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
