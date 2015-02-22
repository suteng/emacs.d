(require-package 'google-c-style)
(require 'google-c-style)

(add-hook 'c-mode-common-hook 'google-set-c-style)

(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(require-package 'cd-compile)
(provide 'init-cc-mode)
