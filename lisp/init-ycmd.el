(require-package 'ycmd)
(require-package 'company-ycmd)
(require 'ycmd)

(ycmd-setup)
(set-variable 'ycmd-server-command '("python" "/home/suteng/ycmd/ycmd"))
(set-variable 'ycmd-global-config "/home/suteng/ycmd/cpp/ycm/.ycm_extra_conf.py")
(set-variable 'ycmd-extra-conf-whitelist '("~/ycmd"))

(require 'company-ycmd)
(company-ycmd-setup)
(setq company-backends (delete 'company-clang company-backends))

(provide 'init-ycmd)
