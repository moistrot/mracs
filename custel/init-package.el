(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
(require 'cl)

;; Add Packages
 (defvar mracs-packages '(
                ;; --- Auto-completion ---
		popwin
                company
                ;; --- Better Editor ---
                swiper
                counsel
                smartparens
                ;; --- Major Mode ---
                ;; js2-mode
                ;; --- Minor Mode ---
                ;; nodejs-repl
                ;; exec-path-from-shell
                ;; --- Themes ---
                monokai-theme
                ;; solarized-theme
                ) "Default packages")




 (setq package-selected-packages mracs-packages)

 (defun mracs-packages-installed-p ()
     (loop for pkg in mracs-packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (mracs-packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg mracs-packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))


(provide 'init-package)

