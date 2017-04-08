(package-initialize) 

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(add-to-list 'load-path "~/.emacs.d/custel/")

(require 'init-package)
(require 'init-ui)
(require 'init-keybinding)
(require 'init-org)
(require 'init-my-default)

;; custom-group-setting
(setq custom-file (expand-file-name "custel/custom.el" user-emacs-directory))
(load-file custom-file)
