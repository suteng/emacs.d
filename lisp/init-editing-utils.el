(when (fboundp 'electric-pair-mode)
  (setq-default electric-pair-mode 1))


(setq ring-bell-function 'ignore)
(setq scroll-margin 5
      scroll-conservatively 10000)

(when *is-a-mac*
  (setq-default locate-command "mdfind"))

(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)


(global-set-key (kbd "RET") 'newline-and-indent)

;;----------------------------------------------------------------------------
;; Don't disable narrowing commands
;;----------------------------------------------------------------------------
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;;----------------------------------------------------------------------------
;; Show matching parens
;;----------------------------------------------------------------------------
(show-paren-mode 1)
(electric-pair-mode 1)
;;----------------------------------------------------------------------------
;; Don't disable case-change functions
;;----------------------------------------------------------------------------
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;----------------------------------------------------------------------------
;; Handy key bindings
;;----------------------------------------------------------------------------
(use-package ace-jump-mode
  :ensure t
  :init
  :config
  (global-set-key (kbd "C-;") 'ace-jump-mode)
  (global-set-key (kbd "C-:") 'ace-jump-word-mode)
  )

;; Save all tempfiles in $TMPDIR/emacs$UID/
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms   `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix    emacs-tmp-dir)

(setq linum-format "%d ")
(global-linum-mode 1)


(provide 'init-editing-utils)
